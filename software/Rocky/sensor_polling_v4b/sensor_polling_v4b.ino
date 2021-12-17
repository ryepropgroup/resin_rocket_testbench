float p1, opamp_pos, opamp_neg;

void setup() {
  Serial.begin(9600);
  Serial.println("P1,opamp_pos,opamp_neg");  //labels for serial plotter
}

void loop() {
  p1 = analogRead(PF0);
  opamp_pos = analogRead(PF1);
  opamp_neg = analogRead(PF2);
  
  Serial.print(5.0*p1/1024.0, 4);
  Serial.print(",");
  Serial.print(5.0*opamp_pos/1024.0, 4);
  Serial.print(",");
  Serial.println(5.0*opamp_neg/m1024.0, 4);
}
