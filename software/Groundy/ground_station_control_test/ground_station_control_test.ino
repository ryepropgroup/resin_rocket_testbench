//This program sends commands to the junction box to control the rocket, and reads the data sent from the rocket
//No data is sent to the USB port to make debugging easier.
//Started by Toni Pano on Dec 22, 2021

#include "laptop_comms.h"   //include definitions for laptop commands and ground station states
#include "rocket_comms.h"   //include definitions for ground station commands, rocket states, data packet, and actuator flags 

//pin connections to buttons, LEDs, and buzzer. Should match ground station input schematic
//interrupt priority order: ABORT_2 > ABORT_1 > LAUNCH > MANUAL_CTRL = INT0 > INT1 > INT5 > PCI0
#define ABORT_LED 7   //turns on when rocket sends packet with ABORT_STATE
#define ARMED_LED 6   //turns on when rocket sends packet with ARMED_STATE
#define ARMED_BZR 5   //makes sound when rocket sends packet with ARMED_STATE
#define ARMED_FRQ 2000//frequency of ARMED buzzer in Hertz
#define LAUNCH_LED 4  //turns on when rocket sends packet with LAUNCH_STATE
#define ABORT_1_BTN 21  //main ABORT button (D21 = PD0 = INT0) press SPACE on keyboard when debugging
#define ABORT_2_BTN 20  //backup ABORT button (D20 = PD1 = INT1) press 'A' on keyboard when debugging
#define LAUNCH_BTN  3   //LAUNCH sequence switch with plastic cover, functioally a button too (D3 = PE5 = INT5) press 'L' on keyboard when debugging
#define SV1_BTN     12  //MANUAL_CTRL button for solenoid valve 1 (D10 = PB4 = PCINT4, part of PCI0) press '1' on keyboard when debugging
#define SV2_BTN     11  //MANUAL_CTRL button for solenoid valve 2 (D11 = PB5 = PCINT5, part of PCI0) press '2' on keyboard when debugging
#define IGN1_BTN    10  //MANUAL_CTRL button for igniter 1 (D12 = PB6 = PCINT6, part of PCI0) press '3' on keyboard when debugging

//button debouncing
#define sec 1000000 //ammount of clock periods (microseconds) in a second
volatile uint8_t ABORT_changed = 0;           //flag if any ABORT button was pressed or released (ABORT_1 or ABORT_2) 
volatile uint32_t ABORT_changed_t = 0;        //most recent time when any ABORT button changed (ABORT_1 or ABORT_2)
const uint32_t ABORT_debounce_t = 0.1*sec;    //how long to wait before reading ABORT_1 button signals (ABORT_1 or ABORT_2)
volatile uint8_t LAUNCH_changed = 0;        //flag if LAUNCH button was pressed or released
volatile uint32_t LAUNCH_changed_t = 0;     //most recent time when LAUNCH button was changed
const uint32_t LAUNCH_debounce_t = 0.1*sec; //how long to wait before reading LAUNCH button signal
volatile uint32_t MANUAL_CTRL_changed = 0;        //flag if any MANUAL CONTROL buttons were pressed or released (SV1, SV2, IGN1)
volatile uint32_t MANUAL_CTRL_changed_t = 0;      //most recent time when any MANUAL CTRL button was changed (SV1, SV2, or IGN1)
const uint32_t MANUAL_CTRL_debounce_t = 0.1*sec;  //how long to wait before reading all MANUAL_CTRL button signals (SV1, SV2, and IGN1)

char GS_cmd;                          //command to send to rocket
char GS_manual_ctrl_flags;                 //actuators to turn on/off in rocket, used if sending manual control command to rocket

//stores radio comms info between laptop and ground station
const unsigned int BAUD_RATE = 9600;  //bits per second in all serial lines (radio or serial to laptop USB)
char laptop_cmd;                      //command from laptop to start sending data to laptop

//stores radio comms info between ground station and rocket
#define PKT_LEN sizeof(data_pdu)  //size of data packet from rocket in bytes
struct data_pdu pkt;                   //store a single byte of data from radio

//ground station states
char GS_state;                 //state of ground station

// put your setup code here, to run once:
void setup() {
  //initialize LED pins
  pinMode(ABORT_LED, INPUT);
  pinMode(ARMED_LED, INPUT);
  pinMode(ARMED_BZR, INPUT);
  pinMode(LAUNCH_LED, INPUT);
  digitalWrite(ABORT_LED, HIGH);  //turn off ABORT led
  digitalWrite(LAUNCH_LED, HIGH); //turn off LAUNCH led
  digitalWrite(ARMED_LED, HIGH);  //turn off ARMED_LED

  //initialize button pins
  pinMode(ABORT_1_BTN, INPUT);
  pinMode(ABORT_2_BTN, INPUT);
  pinMode(LAUNCH_BTN, INPUT);
  pinMode(SV1_BTN, INPUT);
  pinMode(SV2_BTN, INPUT);
  pinMode(IGN1_BTN, INPUT);

  //attach interrupt vectors to pins
  noInterrupts();  //disable all interrupts, prevents them from triggering during setup
  attachInterrupt(digitalPinToInterrupt(ABORT_1_BTN), ABORT_debounce, RISING);
  attachInterrupt(digitalPinToInterrupt(ABORT_2_BTN), ABORT_debounce, RISING);
  attachInterrupt(digitalPinToInterrupt(LAUNCH_BTN), LAUNCH_debounce, RISING);
  //set interrupts for manual control buttons
  PCMSK0 = PCMSK0 | bit(PCINT4) | bit(PCINT5) | bit(PCINT6);  //Pin Change Mask Register 0. Choose to listen to pin change interrupts for SV1, SV2, and IGN1 pins.
  PCIFR = PCIFR | bit(PCIF0); //Pin Change Interrupt Flag Register: erase interrupt flag for PCI0 by writing a 1 to it
  PCICR = PCICR | bit(PCIE0); //Pin Change Interrupt Control Register: enable pin change interrupts for group of pins PCI0 (Pin Change Interrupt Enable 0, aka pins INT0 to INT 7);
  interrupts();  //enable all interrupts after they have all been set
  
  //initialize ground station command to default value (0)
  GS_cmd = 0;
  GS_manual_ctrl_flags;

  //initialize laptop command to default value ('E' for empty)
  laptop_cmd = 'E';

  //initialize ground station state to default (STORE DATA)
  GS_state = STORE_DATA_STATE;

  //initialize all packet values to default value (MAX value for timestamp, 0 for rest)
  pkt.rocket_state = 0;
  pkt.actuators = 0;
  pkt.timestamp = 0xFFFFFFFF;
  pkt.t[0] = 0;
  pkt.t[1] = 0;
  pkt.p[0] = 0;
  pkt.p[1] = 0;
  pkt.f[0] = 0;
  pkt.f[1] = 0;
  
  //set up serial lines for radio to receive data from rocket
  Serial1.begin(9600);
    
  //set up serial to USB output for sending rocket data to laptop
  Serial.begin(9600);
}

// put your main code here, to run repeatedly:
char temp;  //remove whitespace from laptop command, if testing with Serial monitor
void loop() {
  //check for command from laptop
  if(Serial.available() > 0){
    temp = Serial.read();
    if(temp != '\n'){   //prevents whitespace from being mistaken as laptop command, if debugging with Serial monitor
      laptop_cmd = temp;
    }
  }
  
  //store latest bytes in data buffer
  //assumes radios will only let full packets transmit, or miss whole packets, not start transmitting halfway through a packet.
  //also assumes that packet can fit within Serial1 buffer (64 bytes)
  if(Serial1.available() >= PKT_LEN){
    Serial1.readBytes((byte *)&pkt, PKT_LEN); //read all bytes of rocket data into packet
    check_GS_buttons(); //check buttons after data packet arrives from rocket, and before data is sent to laptop
    update_GS_state();
  }
  check_GS_buttons(); //check buttons for any commands to send to rocket
  
  
  Serial.print(" Laptop CMD: ");
  Serial.print(laptop_cmd);
  Serial.print(", GS_state: ");
  Serial.print(GS_state);
  Serial.print(", ABORT: ");
  Serial.print(ABORT_changed);
  Serial.print(", LAUNCH: ");
  Serial.print(LAUNCH_changed);
  Serial.print(", M_CTRL: ");
  Serial.println(MANUAL_CTRL_changed);
  Serial1.print('A');
  delay(100);
}

void update_GS_state(){
  //update buttons on LED by reading rocket_state byte in latest packet (first byte of each packet)
  //light LEDs if button press triggered respective state change in rocket
  switch(pkt.rocket_state){
    case ABORT_STATE:
      digitalWrite(ABORT_LED, LOW);   /*turn on ABORT led*/
      digitalWrite(LAUNCH_LED, HIGH); /*turn off LAUNCH led*/
      digitalWrite(ARMED_LED, HIGH);  /*turn on ARMED led*/
      noTone(ARMED_BZR);              /*turn off buzzer*/
      break;
    case LAUNCH_STATE:
      digitalWrite(ABORT_LED, HIGH);  /*turn off ABORT led*/
      digitalWrite(LAUNCH_LED, LOW);  /*turn on LAUNCH led*/
      digitalWrite(ARMED_LED, LOW);   /*turn off ARMED led*/
      noTone(ARMED_BZR);              /*turn off buzzer*/
      break;
    case ARMED_STATE:
      digitalWrite(ABORT_LED, HIGH);  /*turn off ABORT led*/
      digitalWrite(LAUNCH_LED, HIGH); /*turn off LAUNCH led*/
      digitalWrite(ARMED_LED, LOW);   /*turn on ARMED led*/
      tone(ARMED_BZR, ARMED_FRQ);     /*turn on buzzer*/
      break;
    case SAFE_STATE:
      digitalWrite(ABORT_LED, HIGH);  /*turn off ABORT led*/
      digitalWrite(LAUNCH_LED, HIGH); /*turn off LAUNCH led*/
      digitalWrite(ARMED_LED, HIGH);  /*turn off ARMED led*/
      noTone(ARMED_BZR);              /*turn off buzzer*/
      break;
  }
  
  //only update ground station state with latest laptop command on first byte of each packet. Helps to avoid transmitting to laptop halfway through a packet
  switch(laptop_cmd){
    case PASS_DATA_CMD:
      GS_state = PASS_DATA_STATE;
      break;
    case STORE_DATA_CMD:
      GS_state = STORE_DATA_STATE;
      break;
  }
  
  //act on current ground station state, if needed
  if(GS_state == PASS_DATA_STATE){  //pass data byte from radio to USB connection of laptop. Assumes Serial buffer has enough room to send all bytes of a single packet
    Serial.write((byte *)&pkt, PKT_LEN);
  }
}

void check_GS_buttons(){
  noInterrupts();  //disable interrupts during button check. Avoids buttons erasing flag set by interrupts during this period
                   //also disables serial port interrupts for communication
  if(ABORT_changed){
    if(Serial.availableForWrite() >= 1){  //check if at least 1 byte command can be sent out radio
      if(micros()-ABORT_changed_t >= ABORT_debounce_t){ //wait until ABORT button electrical contacts have stopped physically bouncing
        if((digitalRead(ABORT_1_BTN) == 1) || (digitalRead(ABORT_2_BTN) == 1)){ //check that any ABORT button is still pressed down. Ignores rising voltage oscillations from release of button
          Serial.write(ABORT_CMD); //send ABORT command to rocket
        }
        ABORT_changed = 0;        //avoids check of ABORT button until it is pressed again
      }
    }
  }
  else if(LAUNCH_changed){
    if(Serial.availableForWrite() >= 1){  //check if at least 1 byte command can be sent out radio
      if(micros()-LAUNCH_changed_t >= LAUNCH_debounce_t){ //wait until LAUNCH button electrical contacts have stopped physically bouncing
        if(digitalRead(LAUNCH_BTN) == 1){ //check if LAUNCH button still pressed. Ignores rising voltage oscillatios from release of button
          Serial.write(LAUNCH_CMD); //send LAUNCH command to rocket
        }
        LAUNCH_changed = 0;       //avoids check of LAUNCH button until it is pressed again
      }
    }
  }
  else if(MANUAL_CTRL_changed){ //wait until last (most recently pressed/released) MANUAL CONTROL button has stopped physically bouncing its electrical contacts
    if(Serial.availableForWrite() >= 2){  //check if at least 2 byte commands can be sent out radio
      if(micros()-MANUAL_CTRL_changed_t >= MANUAL_CTRL_debounce_t){
        GS_manual_ctrl_flags = 0;       //clear manual control flags of rocket actuators
        
        //set manual control flags of actuators based on button states
        if(digitalRead(SV1_BTN) == 1){  //set flag if SV1 button was pressed
          GS_manual_ctrl_flags = GS_manual_ctrl_flags | A_SV1;
        }
        if(digitalRead(SV2_BTN) == 1){  //set flag if SV2 button was pressed
          GS_manual_ctrl_flags = GS_manual_ctrl_flags | A_SV2;
        }
        if(digitalRead(IGN1_BTN) == 1){ //set flag if IGN1 button was pressed
          GS_manual_ctrl_flags = GS_manual_ctrl_flags | A_IGN1;
        }
  
        Serial.write(MANUAL_CTRL_CMD);     //send MANUAL CONTROL command to rocket
        Serial.write(GS_manual_ctrl_flags+'0'); //send flags to set actuator states on rocket (0 = off/closed, 1 = on/open)
  
        MANUAL_CTRL_changed = 0;  //avoids check of MANUAL CONTROL buttons until any (SV1, SV2, IGN1) change state again
      }
    }
  }
  interrupts(); //enable interrupts after button check has set flags to 0. Any interrupts that would have triggered during button check are still waiting, and will trigger now
                //also enables serial port interrupts for communication
}

//debouncing functions, triggered by interrupts
void ABORT_debounce(){      //start debounce timer for any ABORT button
                      //flag helps to ignore somone mashing the button repeatedly, if the ABORT command has not been sent out the radio yet
  if(!ABORT_changed){ //ABORT_pressed_t will ignore other ABORT button if an ABORT button has already been pressed, and the ABORT command has not been sent yet.
    ABORT_changed_t = micros();
    ABORT_changed = 1;
    Serial.println("ABORT changed");
  }
}

void LAUNCH_debounce(){       //start debounce timer for LAUNCH_BTN
  if(!LAUNCH_changed){  //flag helps to ignore somone mashing the button repeatedly, if the LAUNCH command has not been sent out the radio yet
    LAUNCH_changed_t = micros();
    LAUNCH_changed = 1;
    Serial.println("LAUNCH changed");
  }
}

ISR(PCINT0_vect){  //start debounce timer for SV1, SV2 or IGN1. ISR = Interrupt Service Routine
  MANUAL_CTRL_changed_t = micros(); //no flag check used, so can't ignore button mashing. Will reset time to button which most recently changed state (SV1, SV2, or IGN1)
  MANUAL_CTRL_changed = 1;
  Serial.println("MANUAL CONTROL changed");
}
