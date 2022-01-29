int delay_value = 1000; int led_pin = 13;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.write('A');
  Serial.write('B');
  Serial.write((uint32_t)8000); // random time stamp number
  Serial.write((uint16_t)1);
  Serial.write((uint16_t)2);
  Serial.write((uint16_t)3);
  Serial.write((uint16_t)4);
  Serial.write((uint16_t)5);
  Serial.write((uint16_t)6);
  delay(1000);
}
