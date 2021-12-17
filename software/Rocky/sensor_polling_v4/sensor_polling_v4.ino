#include <Wire.h>

uint8_t T1_ADDR = 0x66;
uint8_t T2_ADDR = 0x67;
uint8_t numBytes = 0;
uint8_t MSB, LSB;
uint16_t Th = 0xFEEF;
float T1, T2;
float p1, p1bias, p1nfb;
int rv;
void setup() {
  // put your setup code here, to run once:
  //MCP9600 Thermiciople Snesor Datasheet: https://ww1.microchip.com/downloads/en/DeviceDoc/MCP960X-Data-Sheet-20005426.pdf
  Wire.setClock(100000); //MCP9600 has max I2C serial frequency of 100kHz (page 9)
  Wire.begin();   //join i2c bus, address optional for master device (the Arduino Mega)
  
  Wire.beginTransmission(T1_ADDR); //write to T1 sensor
  Wire.write(0b00000110); //specify the device configuration register (page 27)
  Wire.write(0b11100000); //specify lowest resolution for fastest sampling mode (page 36)
                          //cold junction res = 0.25*C, ADC res = 12 bits, burst mode samples = 1, shutdown mode = normal operation
  Wire.endTransmission();

  Wire.beginTransmission(T2_ADDR); //write to T2 sensor
  Wire.write(0b00000110); //specify the device configuration register (page 27)
  Wire.write(0b11100000); //specify lowest resolution for fastest sampling mode (page 36)
                          //cold junction res = 0.25*C, ADC res = 12 bits, burst mode samples = 1, shutdown mode = normal operation
  Wire.endTransmission();

  Serial.begin(9600);
  Serial.println("T1,T2,P1,P1_bias_voltage,P1_neg_feedback");  //labels for serial plotter
}

void loop() {
  //110 0XXX = 0x66 or 0x67, add a bit on the right to specify read or write command (page 22)
  //read = 1, write = 0
  Wire.beginTransmission(T1_ADDR); //write to T1 sensor
  Wire.write(0b00000000); //specify the thermocoule hot-junction register (page 27)
  /*Serial.println("calling endTransmission");*/
  rv = Wire.endTransmission(); //0 if device on i2c acknowledged the request
  
  if(rv != 0){
    /*Serial.print("Error! Request not acknowledged! return value not 0, is ");
    Serial.println(rv);*/
  }

  Wire.beginTransmission(T2_ADDR); //write to T2 sensor
  Wire.write(0b00000000); //specify the thermocoule hot-junction register (page 27)
  /*Serial.println("calling endTransmission");*/
  rv = Wire.endTransmission(); //0 if device on i2c acknowledged the request
  
  if(rv != 0){
    /*Serial.print("Error! Request not acknowledged! return value not 0, is ");
    Serial.println(rv);*/
  }

  delay(80);  //typical conversion time for temp reading of the delta T thermocouple signal in ADC is 5ms for 12 bit resolution (page 6)
              //bear in mind that the cold junction temp has conversion time of 63ms at resolution of 0.25*C (page 31)
              //bear in mind that typical temp calculation time (Th = Tc + delta T) is 12 ms (page 6)
  
  Wire.requestFrom(T1_ADDR, 2, false); //read from T1, release i2c line afterwards
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
  Th = (MSB << 8) + LSB;
  T1 = Th/16.0;

  Wire.requestFrom(T2_ADDR, 2, false); //read from T1, release i2c line afterwards
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
  Th = (MSB << 8) + LSB;
  T2 = Th/16.0;
  
  /*Serial.print("temp = ");
  Serial.println(temp, 4);*/
  
  p1 = analogRead(PF0);
  p1bias = analogRead(PF1);
  p1nfb = analogRead(PF2);
  
  /*Serial.print("P1 = ");
  Serial.print(5.0*p1/1024.0);
  Serial.print(" , bias = ");
  Serial.print(5.0*p1bias/1024.0);
  Serial.print(" , nfb = ");
  Serial.println(5.0*p1nfb/1024.0);*/
  
  Serial.print(T1, 4);
  Serial.print(",");
  Serial.print(T2, 4);
  Serial.print(",");
  Serial.print(5.0*p1/1024.0, 4);
  Serial.print(",");
  Serial.print(5.0*p1bias/1024.0, 4);
  Serial.print(",");
  Serial.println(5.0*p1nfb/1024.0, 4);
}
