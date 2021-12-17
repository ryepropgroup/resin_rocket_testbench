#include <Wire.h>

uint8_t numBytes = 0;
uint8_t MSB, LSB;
uint16_t Th = 0xFEEF;
float temp;
float p1, p1bias;
int rv;
void setup() {
  // put your setup code here, to run once:
  Wire.begin();   //join i2c bus, address optional for master device (the Arduino Mega)
  Serial.begin(9600);
}

void loop() {
  //from page 22 of https://ww1.microchip.com/downloads/en/DeviceDoc/MCP960X-Data-Sheet-20005426.pdf
  //110 0XXX = 0x66 or 0x67, add a bit on the right to specify read or write command
  //read = 1, write = 0
  Wire.beginTransmission(0x66); //write to device #6
  Wire.write(0b00000000); //specify the thermocoule hot-junction register (page 27)
  Serial.println("calling endTransmission");
  rv = Wire.endTransmission();
  
  if(rv != 0){
    Serial.print("Error! return value not 0, is ");
    Serial.println(rv);
  }
  
  Wire.requestFrom(0x66, 2, false); //read from device #6, release i2c line afterwards
  //Serial.println("sent request for data");
  
  //resend request until both bytes of temperature measurement have been received
  do{
    numBytes = Wire.available();
    Serial.print("received ");
    Serial.print(numBytes);
    Serial.println(" bytes");
    delay(200);
  }while(numBytes < 2);
  
  MSB = Wire.read();  //read the MSB of the temperature
  LSB = Wire.read();  //read the LSB of the temperature
  
  Th = (MSB << 8) + LSB;
  temp = Th/16.0;
  
  Serial.print("temp = ");
  Serial.println(temp, 4);
  
  p1 = analogRead(PF0);
  p1bias = analogRead(PF1);
  Serial.print("P1 = ");
  Serial.print(5.0*p1/1024.0);
  Serial.print(" , bias = ");
  Serial.println(p1bias);
}
