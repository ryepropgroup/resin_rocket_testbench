char receivedByte;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial1.begin(9600);    //baud rate of 230400 too high for Arduino Mega's USART unit to handle?

  Serial.print("Ground Station Started\n--------------------\n");
  //Serial1.print("echo!\n"); //used to make an echo on the pair of radios using the TX1/RX1 USART lines
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial1.available() > 0){
    receivedByte = Serial1.read();
    Serial.print(receivedByte);
  }
}
