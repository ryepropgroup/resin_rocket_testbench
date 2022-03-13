struct packet{
  char type;
  uint16_t state;
  uint32_t timestamp;
  uint16_t t1;
  uint16_t t2;
  uint16_t p1;
  uint16_t p2;
  uint16_t f1;
  uint16_t f2;
};

struct packet pkt;

void setup() {
  pkt.type = 'A';
  pkt.state = 0b1111000011110000;
  pkt.t1 = (uint16_t)1;
  pkt.t2 = (uint16_t)2;
  pkt.p1 = (uint16_t)3;
  pkt.p2 = (uint16_t)4;
  pkt.f1 = (uint16_t)5;
  pkt.f2 = (uint16_t)6;
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  pkt.timestamp = (uint32_t)micros();
  Serial.write((byte *)&pkt, sizeof(pkt));
  //Serial.println();
  delay(500);
  pkt.t1++;
}
