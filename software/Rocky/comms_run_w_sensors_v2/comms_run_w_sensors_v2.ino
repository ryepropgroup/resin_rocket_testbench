#include <Wire.h>

//Packet headers to send
#define UPDATE 0x11
#define ABORT 0xAA
#define ACK 0x33
#define DATA 0x44

//addresses of T1 and T2 on I2C bus
#define T1 0x66
#define T2 0x67

//vars for i2c management
uint8_t MSB, LSB;
uint8_t numBytes = 0;
int rv;

//Sensor order: T1 T2 T3 T4 T5 P1 P2 P3 (bit 0 to 7)

/*
ports
SV1 = D37 / PC0
SV2 = D36 / PC1
SV3 = D35 / PC2
SV4 = D34 / PC3
SV5 = D33 / PC4
SV6 = D32 / PC5
SV7 = D31 / PC6
SV8 = D30 / PC7

SV9 = D22 / PA0
SV10 = D23 / PA1
SV11 = D24 / PA2
SV12 = D25 / PA3
SV13 = D26 / PA4
IG = D27 / PA5
*/

#define ACTUATORS_1_8 PORTC
#define ACTUATORS_9_14 PORTA

struct pressure {
  uint16_t p1;
  uint16_t p2;
  uint16_t p3;
};

struct data_packet {
  uint16_t timer;
  uint8_t actuator_flags_1;
  uint8_t actuator_flags_2;
  uint8_t sensor_flags;
  uint16_t temp[5];
  uint32_t pressures;
};

union data_converter {
  struct data_packet data;
  uint8_t data_bytes[19];
};

struct pressure pressure_readings;
struct data_packet data_to_send;
uint32_t latest_time;
data_converter converter;

void setup() {
    //set up pins as outputs for actuators
    DDRC = 0b11111111;
    DDRA = 0b00111111;
    ACTUATORS_1_8 = 0;
    ACTUATORS_9_14 = 0;

    //sets up T1 and T2 sensor settings
    //MCP9600 Thermocouple Sensor Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/MCP960X-Data-Sheet-20005426.pdf
    Wire.setClock(100000); //MCP9600 has max I2C serial frequency of 100kHz (page 9)
    Wire.begin();   //join i2c bus, address optional for master device (the Arduino Mega)
    
    Wire.beginTransmission(T1); //write to T1 sensor
    Wire.write(0b00000110); //specify the device configuration register (page 27)
    Wire.write(0b11100000); //specify lowest resolution for fastest sampling mode (page 36)
                            //cold junction res = 0.25*C, ADC res = 12 bits, burst mode samples = 1, shutdown mode = normal operation
    Wire.endTransmission();
  
    Wire.beginTransmission(T2); //write to T2 sensor
    Wire.write(0b00000110); //specify the device configuration register (page 27)
    Wire.write(0b11100000); //specify lowest resolution for fastest sampling mode (page 36)
                            //cold junction res = 0.25*C, ADC res = 12 bits, burst mode samples = 1, shutdown mode = normal operation
    Wire.endTransmission();
    
    //sets up ADC
    /* Info from ATMEGA2560 datasheet: https://ww1.microchip.com/downloads/en/devicedoc/atmel-2549-8-bit-avr-microcontroller-atmega640-1280-1281-2560-2561_datasheet.pdf
    For Register ADMUX
    bits  [7:6] = REFS[1:0] = 11 to select internal 2.56 voltage reference (can't use 1.1V for analog diff input), as the VREF for the ADC (more bits used within range: https://www.youtube.com/watch?v=xI_qU2auVx8)
    bit   [5] =   ADLAR =      0 to not left adjust result
    bits  [4:0] = MUX[4:0] = used to select single/differeantial mode and gain amplification
    
    For register ADCSRB
    bit   [7] =   reserved bit, must always be 0
    bit   [6] =   0 for analog comparator to use AIN1 on negative input, won't affect ADC reading no matter if 1 or 0
    bit   [3] =   MUX[5]
    bits  [2:0] = ADTS[2:0] = no effect if ADATE is 0
    
    For register ADCSRA
    bit   [7] =   ADEN =  1 to enable ADC
    bit   [6] =   ADSC =  1 to startc ADC conversion, erases itself to 0 when conversion done
    bit   [5] =   ADATE = 0 to disable auto trigger mode
    bit   [4] =   ADIF =  0 to not erase the interrupt flag bit
    bit   [3] =   ADIE  = 0 to disable interrupt from conversion completion in ADC
    bits  [2:0] = ADPS2[2:0] = 000 to use fastest clock frequency available (crystal oscillator freq/2)
    
    For MUX[5:0]
    001001 = (ADC1-ADC0)*10 is ADC input
    001101 = (ADC3-ADC2)*10 is ADC input
    101001 = (ADC9-ADC8)*10 is ADC input*/
    
    ADCSRA = 0b1000000; //enables ADC
    
    //set all data values to 0
    pressure_readings.p1 = 0;
    pressure_readings.p2 = 0;
    pressure_readings.p3 = 0;
    data_to_send.timer = millis();
    data_to_send.actuator_flags_1 = 0;
    data_to_send.sensor_flags = 0;
    data_to_send.temp[0] = 0;
    data_to_send.temp[1] = 0;
    data_to_send.temp[2] = 0;
    data_to_send.temp[3] = 0;
    data_to_send.temp[4] = 0;
    Serial.begin(230400);
    data_to_send.actuator_flags_2 = 0;
}

int16_t analogDiffRead(){
  int16_t adc_out;
  ADCSRA =  0b11000000;       //start ADC conversion
  while(ADCSRA&0b01000000);     //wait for ADC to finish conversion (ADSC becomes 0)
  adc_out = ADCL;             //read 8 lower bits of conversion
  adc_out += (ADCH<<8);       //concatenate 8 higher bits of conversion to 8 lower bits to make 16 bits
  return adc_out;
}

void get_pressure_int() {
  data_to_send.pressures = (pressure_readings.p1 & 0x3ff) | ((pressure_readings.p2 & 0x3ff) << 10) | ((pressure_readings.p3 & 0x3ff) << 20);
}

void get_pressures() {
  ADCSRB =  0b00000000; //select (ADC1-ADC0)*10 as ADC input 
  ADMUX =   0b11001001; //select (ADC1-ADC0)*10 as ADC input, with internal 2.56V reference as VREF
  pressure_readings.p1 = analogDiffRead();
  //delay(50);
  ADCSRB =  0b00000000; //select (ADC3-ADC2)*10 as ADC input 
  ADMUX =   0b11001101; //select (ADC3-ADC2)*10 as ADC input, with internal 2.56V reference as VREF
  pressure_readings.p2 = analogDiffRead();
  //delay(50);
  ADCSRB =  0b00001000; //select (ADC9-ADC8)*10 as ADC input 
  ADMUX =   0b11001001; //select (ADC9-ADC8)*10 as ADC input, with internal 2.56V reference as VREF
  pressure_readings.p3 = analogDiffRead();
  get_pressure_int();
  data_to_send.sensor_flags = data_to_send.sensor_flags | 0b11100000;
}

void start_temp_conversion(uint16_t T_SENSOR_ADDR){
  Wire.beginTransmission((byte)T_SENSOR_ADDR); //write to temp sensor with that address
  Wire.write(0b00000000); //specify the thermocoule hot-junction register (page 27)
  /*Serial.println("calling endTransmission");*/
  rv = Wire.endTransmission(); //0 if device on i2c acknowledged the request
  
  if(rv != 0){
    /*Serial.print("Error! Request not acknowledged! return value not 0, is ");
    Serial.println(rv);*/
  }
}

uint16_t read_temp_conversion(uint16_t T_SENSOR_ADDR){
   uint16_t temp;
   
   Wire.requestFrom(T_SENSOR_ADDR, 2, false); //read from T1, release i2c line afterwards
  /*Serial.println("sent request for data");*/
  
  //resend request until both bytes of temperature measurement have been received
  do{
    numBytes = Wire.available();
    /*Serial.print("received ");
    Serial.print(numBytes);
    Serial.println(" bytes");*/
  }while(numBytes < 2);
  
  MSB = Wire.read();  //read the MSB of the temperature
  LSB = Wire.read();  //read the LSB of the temperature
  temp = (MSB << 8) + LSB;
}

void get_temperatures() {
  start_temp_conversion(T1);
  start_temp_conversion(T2);
  
  delay(80);  //typical conversion time for temp reading of the delta T thermocouple signal in ADC is 5ms for 12 bit resolution (page 6)
              //bear in mind that the cold junction temp has conversion time of 63ms at resolution of 0.25*C (page 31)
              //bear in mind that typical temp calculation time (Th = Tc + delta T) is 12 ms (page 6)

  //data_to_send.sensor_flags|(1<<0) sets T1's flag bit to a 1, and data_to_send.sensor_flags|(1 << 1) sets T2's flag bit to a 1
  //ORing both flags for T1 and T2 with the all of the sensor flags will set the sensor flag bits for both T1 and T2 to a 1
  data_to_send.temp[0] = read_temp_conversion(T1);
  data_to_send.sensor_flags = data_to_send.sensor_flags | (1 << 0);
  data_to_send.temp[1] = read_temp_conversion(T2);
  data_to_send.sensor_flags = data_to_send.sensor_flags | (1 << 1);
}

void send_data() {
  data_to_send.timer = millis();
  converter.data = data_to_send;
  /*Serial.write(DATA);
  Serial.write(converter.data_bytes, 19);*/
  Serial.print("time:\t\t\t\t\t");
  Serial.println(converter.data.timer);
  Serial.print("act_flags_1 act_flags_2 sens_flags:\t");
  Serial.print(converter.data.actuator_flags_1, BIN);
  Serial.print(" ");
  Serial.print(converter.data.actuator_flags_2, BIN);
  Serial.print(" ");
  Serial.println(converter.data.sensor_flags, BIN);
  Serial.print("T1 T2:\t\t\t\t\t");
  Serial.print(converter.data.temp[0]);
  Serial.print(" ");
  Serial.println(converter.data.temp[1]);
  //pos is 0x00 to 0x1FF, neg is 0x200 to 0x3FF
  Serial.print("P1 P2 P3:\t\t\t\t");
  Serial.print(pressure_readings.p1, HEX);
  Serial.print(" ");
  Serial.print(pressure_readings.p2, HEX);
  Serial.print(" ");
  Serial.println(pressure_readings.p3, HEX);
  /*Serial.print(((int16_t)(pressure_readings.p1<<6))/64.0);
  Serial.print(" ");
  Serial.print(((int16_t)(pressure_readings.p2<<6))/64.0);
  Serial.print(" ");
  Serial.println(((int16_t)(pressure_readings.p3<<6))/64.0);*/
  //Serial.println(pressure_readings.p1);
  uint8_t actuator_flags_1;
  uint8_t actuator_flags_2;
  uint8_t sensor_flags;
  uint16_t temp[5];
  uint32_t pressures;
  data_to_send.sensor_flags = 0;
}

void loop() {
    get_pressures();
    get_temperatures();
    send_data();
    delay(100);
}
