int16_t p1, p2, p3;
float v1, v2, v3;

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
  
  Serial.begin(9600);
  Serial.println("V1 V2 V3");
}

void loop() {
  delay(100);
  ADCSRB =  0b00000000; //select (ADC1-ADC0)*10 as ADC input 
  ADMUX =   0b11001001; //select (ADC1-ADC0)*10 as ADC input, with internal 2.56V reference as VREF
  p1 = analogDiffRead();

  delay(100);
  ADCSRB =  0b00000000; //select (ADC3-ADC2)*10 as ADC input 
  ADMUX =   0b11001101; //select (ADC3-ADC2)*10 as ADC input, with internal 2.56V reference as VREF
  p2 = analogDiffRead();

  delay(100);
  ADCSRB =  0b00001000; //select (ADC9-ADC8)*10 as ADC input 
  ADMUX =   0b11001001; //select (ADC9-ADC8)*10 as ADC input, with internal 2.56V reference as VREF
  p3 = analogDiffRead();
  
  v1 = (2.56/10)*(p1)/512.0;  //convert ADC number into voltage
  v2 = (2.56/10)*(p2)/512.0;  //convert ADC number into voltage
  v3 = (2.56/10)*(p3)/512.0;  //convert ADC number into voltage
  
  Serial.print(v1, 4);
  Serial.print(" ");
  Serial.print(v2, 4);
  Serial.print(" ");
  Serial.println(v3, 4);
}

int16_t adc_out;
int16_t analogDiffRead(){
  ADCSRA =  0b11000000;       //start ADC conversion
  while(ADCSRA&0b01000000);     //wait for ADC to finish conversion (ADSC becomes 0)
  adc_out = ADCL;             //read 8 lower bits of conversion
  adc_out += (ADCH<<8);       //concatenate 8 higher bits of conversion to 8 lower bits to make 16 bits
  
  //translates 10 bit signed number in 16 bit int, into a 16 bit signed number
  if(adc_out&0x200){ //if p1 has signed bit negative (leftmost bit in 10 bit num)
    //convert p1 from 2's complement into unsigned form
    if(adc_out != 0){
      adc_out = ((~adc_out)&0x3FF) + 1;
    }
    adc_out = -adc_out; //add sign to 16 bit number
  }
  return adc_out;
}
