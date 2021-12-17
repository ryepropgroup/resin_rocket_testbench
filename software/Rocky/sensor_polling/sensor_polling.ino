#include <Wire.h>

uint8_t MSB, LSB;
uint16_t Th = 0xFEEF;
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
  rv = Wire.endTransmission();
  Serial.print("return value = ");
  Serial.println(rv);
  
  Wire.requestFrom(0x66, 2, true); //read from device #6
  if(Wire.available()){
    MSB = Wire.read();  //read the MSB of the temperature
    Serial.println(MSB);
  }
  if(Wire.available()){
    LSB = Wire.read();  //read the LSB of the temperature
    Serial.println(LSB);
  }

  Th = MSB << 8 + LSB;
  
  Serial.println("done reading");

  //Serial.println(Th);
}
