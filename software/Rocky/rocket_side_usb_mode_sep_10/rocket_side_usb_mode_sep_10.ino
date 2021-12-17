byte data;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  Serial1.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0){
    data = Serial.read();
    Serial1.write(data);
  }

  if(Serial1.available() > 0){
    data = Serial1.read();
    //Serial1.write(data); //used to make an echo on the pair of radios using the TX1/RX1 USART lines
    Serial.write(data);
  }
}
