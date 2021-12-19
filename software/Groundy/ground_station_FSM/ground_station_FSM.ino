//inputs paired with outputs
#define EXT_PWR A0
#define DATA_SW 8

#define ARM_SW 6
#define ARM_LED_BZR 7

#define ABORT_BTN1 5
#define ABORT_BTN2 4
#define ABORT_LED 3

//state definitions
#define NO_BATTERY 0
#define RADIO_ON 1
#define DISARMED 2
#define ARMED 3
#define LAUNCHING 4
#define ABORTING 5

int state = NO_BATTERY;
int readData = 0;
int abortTime = 0;

void setup() {
  // put your setup code here, to run once:
  pinMode(ARM_SW, INPUT);
  pinMode(ABORT_BTN1, INPUT);
  pinMode(ABORT_BTN2, INPUT);

  pinMode(ARM_LED_BZR, OUTPUT);
  pinMode(ABORT_LED, OUTPUT);

  //strt reading circuits
  Serial.begin(9600);
  Serial1.begin(9600);
  //give Serial1 something to read
  Serial.write("Hello");
}

void loop() {
  // put your main code here, to run repeatedly:
  stateTrans();
  stateFunc();
}

void stateTrans(){
  
  //checks different in each case
  switch(state){
    case NO_BATTERY:
      if(analogRead(EXT_PWR) > 512){
        state = DISARMED;
      }
      break;
    
    case DISARMED:
      if(analogRead(EXT_PWR) <= 512){
        state = NO_BATTERY;
      }
      else if(digitalRead(ARM_SW) == HIGH){
        state = ARMED;
      }
      break;

    case ARMED:
      if(digitalRead(ABORT_BTN1) || digitalRead(ABORT_BTN2)){
        state = ABORTING;
        abortTime = millis();
      }
      else if(digitalRead(ARM_SW) == LOW){
        state = DISARMED;
      }
      break;
    
    case ABORTING:
      if(millis() - abortTime >= 2000){
        state = DISARMED;
      }
      break;
    
    default:
      Serial.print("Unknown State reached? state = ");
      Serial.println(state);
      exit(-1);
  }

  //check done in all cases if data reading needs to be turned on
  if((analogRead(EXT_PWR)> 512) && (digitalRead(DATA_SW) == HIGH)){
    readData = 1;
  }
  else{
    readData = 0;
  }
}

void stateFunc(){
  //most cases does something different
  switch(state){
    case DISARMED:  //set all outputs to 0 except data
      digitalWrite(ABORT_LED, LOW);
      noTone(ARM_LED_BZR);
      break;

    case ARMED:   //show is armed
      tone(ARM_LED_BZR, 200);
      break;

    case ABORTING:
      noTone(ARM_LED_BZR);
      digitalWrite(ABORT_LED, HIGH);
      break;
    
    default:
      Serial.print("Unknown State reached? state = ");
      Serial.println(state);
      exit(-1);
  }

  //done in all cases if power is supplied, either by USB cord or by battery
  if(readData){
    if(Serial1.available()){    //if data sent to RX1
      Serial.write(Serial1.read());
    }
  }
}
