uint16_t p1;

void setup() {
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
  cli();
  sei();
  
  Serial.begin(9600);
  //Serial.println("P1,P2,P3");  //labels for serial plotter
  Serial.println("P1");
}

void loop() {
  ADCSRB =  0b00000000; //select (ADC1-ADC0)*10 as ADC input 
  ADMUX =   0b11001001; //select (ADC1-ADC0)*10 as ADC input, with internal 2.56V reference as VREF
  ADCSRA =  0b11000000; //start ADC conversion
  while(ADCSRA&01000000);   //wait for ADC to finish conversion (ADSC becomes 0)
  p1 = ADCL + (ADCH<<8);         //read 7 lower bits of conversion

  //ADC seems to get stuck on positive voltage inputs around 0x100, but negative inputs seem ok?
  //so 0V = 0x000 or 0x3FF, and -0.274V = 0x200
  if(p1&0x200){ //if p1 has signed bit negative (leftmost in 10 bit num)
    Serial.print("0x");
    Serial.print(p1, HEX);
    Serial.print(" = ");
    //convert p1 from 2's complement into unsigned form
    if(p1 != 0){
      p1 = ((~p1)&0x3FF) + 1;
    }
    Serial.print(-(2.56/10)*(p1)/512.0, 4);
    Serial.print("V = -0x");
  }
  else{
    Serial.print((2.56/10)*(p1)/512.0, 4);
    Serial.print("V = 0x");
  }  
  Serial.println(p1, HEX);
}
