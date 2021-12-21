//This program changes the states of the rocket's actuators in response to ground station commands
//No data measuring is done in order to make debugging the radios easier
//Started by Toni Pano on Dec 17th, 2021

#include "pdu.h";

const unsigned int BAUD_RATE = 9600;  //bits per second in serial lines (radio or serial to USB output)
char GS_cmd;                          //command from ground station
char GS_manual_ctrl_flags;            //flags sent from ground station, in the event of a manual control command
struct data_pdu pkt;                  //data packet to send to ground station

//rocket specific states
char rocket_state;  //current state of rocket
char actuators;     //on/off status for solenoid valves (SV1, SV2) and igniter (IGN1)
#define sec 1000000 //the number of microseconds in a second (used because clock measures time in microseconds)
uint32_t IGN1_start_t = 0;              //start time of igniter in AUTO_LAUNCH state, used for keeping igniter on for x amount of time
const uint32_t SV1_start_t = 0.08*sec;  //(0.08s) when to turn on fuel, relative to start of igniter ignition
const uint32_t SV2_start_t = 0.08*sec;  //(0.08s) when to turn on oxidizer, relative to start of igniter ignition
const uint32_t IGN1_duration = 3.0*sec; //(0.1s) how long to fire the igniter for
uint32_t ABORT_start_t = 0;               //start time of ABORT state, used for staying in ABORT state for x amount of time
const uint32_t ABORT_duration = 1.0*sec;  //(1.0s) how long to stay in the ABORT state before processing more commands
uint32_t FIRST_ACT_start_t = 0;               //remembers first time when any actuator on rocket turns on. Used to automatically trigger ABORT sequence, if ground station can't send ABORT command (due to radio failure)
const uint32_t AUTO_ABORT_start_t = 5.0*sec;  //when to trigger AUTO_ABORT, relative to first actuator turning on. Either triggers in ARMED_STATE, or during LAUNCH_STATE. Will be cancelled in ARMED_STATE if all actuators are turned off manually, or through ABORT_cmd from ground station

//setup() runs once, before loop() starts
void setup() {
  //initialize ground station value to default value (0)
  GS_cmd = 0;
  
  //initialize all packet values to default(MAX value for timestamp, 0 for rest)
  pkt.rocket_state = 0;
  pkt.actuators = 0;
  pkt.timestamp = 0xFFFFFFFF;
  pkt.t[0] = 0;
  pkt.t[1] = 0;
  pkt.p[0] = 0;
  pkt.p[1] = 0;
  pkt.f[0] = 0;
  pkt.f[1] = 0;

  //initialize rocket state to default value (SAFE)
  //rocket_state = SAFE_STATE;
  rocket_state = ARMED_STATE; //we are missing the circuit to detect if 24V is on high voltage line, so default state is ARMED
  
  //set up radio at min freq. (9600 Hz)
  Serial.begin(BAUD_RATE);

  //set up debug console (USB port on Rocky) at min freq. (9600 Hz)
  //Serial.begin(BAUD_RATE);  
}

//loop() will loop indefinitely
char temp;  //temporary variable for storing command from ground station
void loop() {
  pkt.timestamp = micros();

  //read latest command byte from ground station, if available
  GS_cmd = 'E';
  if(Serial.available()){
    temp = Serial.read(); //reads a byte
    if(temp != '\n'){     //clear input of '\n' chars
      GS_cmd = temp;
    }

    if(GS_cmd == MANUAL_CTRL_CMD){ //read the manual control flags from following byte if manual control command sent
      while(!Serial.available()){}//block until 2nd byte read, to make sure flags not interpreted as command by accident on next loop
      GS_manual_ctrl_flags = Serial.read() - '0';  //reads a byte
    }
  }
  
  //check if state needs to change over time, or if ground station sent commands to change state manually
  update_rocket_state();

  //time all of the following events for storing data asynchronously
    //rocket state
  pkt.rocket_state = rocket_state;
    //actuator flags
  pkt.actuators = actuators;
  
  //send data packet to ground station
  //Serial.write((const char *) &pkt, sizeof(pkt));
  Serial.print(GS_cmd);
  if(GS_cmd == MANUAL_CTRL_CMD){
    Serial.print(GS_manual_ctrl_flags, BIN);
  }
  Serial.print(" -> ");
  Serial.print(pkt.rocket_state);
  Serial.print(' ');
  Serial.print(pkt.actuators, BIN);
  Serial.print(' ');
  Serial.println(((float)pkt.timestamp)/1000000, 8);
  delay(100);
}

void update_rocket_state(){
  //deal with existing state, according to state hierarchy
  if(rocket_state == ABORT_STATE){ //abort state overrides any commands until aborting done
    //abort timing
    if(micros()-ABORT_start_t >= ABORT_duration){ //randomly chosen time for demo purposes
      rocket_state = ARMED_STATE;
    }
  }
  else if(rocket_state == LAUNCH_STATE){ //auto launch state overrides any commands (except abort) until done
    if(GS_cmd == ABORT_CMD){    //skip to state change if ground station command is to abort
        rocket_state = ARMED_STATE;
        //Serial.print("beginning of LAUNCH STATE = ");
        //Serial.println(rocket_state);
    }
    else if(micros()-FIRST_ACT_start_t >= AUTO_ABORT_start_t){ //skip to state change and force abort if auto abort should happen
      GS_cmd = ABORT_CMD;
    }
    else{
      //ignition timing
      if((actuators & A_SV1) == 0){  //check if SV1 still needs to be turned on
        if(micros()-IGN1_start_t >= SV1_start_t){  //do full 32 bit time comparison
          /*open SV1 here*/
          actuators = actuators | A_SV1;
        }
      }
      if((actuators & A_SV2) == 0){  //check if SV2 still needs to be turned on
        if(micros()-IGN1_start_t >= SV2_start_t){  //do full 32 bit time comparison
          /*open SV2 here*/
          actuators = actuators | A_SV2;
        }
      }
      if(actuators & A_IGN1){ //check if igniter still needs to be turned on
        if(micros()-IGN1_start_t >= IGN1_duration){   //do full 32 bit time comparison
          /*stop firing IGN1 here*/
          actuators = actuators & (~A_IGN1);
        }
      }
      if((actuators & (A_IGN1 | A_SV1 | A_SV2)) == ((~A_IGN1) & A_SV1 | A_SV2)){
        rocket_state = ARMED_STATE;
      }
    }
  }
  
  if(rocket_state == ARMED_STATE){ //armed state allows responding to ground station commands
    if(actuators != 0){   //see if auto abort needs to shut off any actuators
      if(micros()-FIRST_ACT_start_t >= AUTO_ABORT_start_t){
        GS_cmd = ABORT_CMD;
      }
    }
    switch(GS_cmd){   //respond to ground station command
      case ABORT_CMD:
        ABORT_start_t = micros(); //record abort start time to maintain abort state for specific length of time
        /*turn off all actuators here*/
        rocket_state = GS_cmd;
        actuators = 0;  //turn off all actuators (solenoids + igniter);
        break;
      case LAUNCH_CMD:
        IGN1_start_t = micros();  //record ignition start time to shut off ignition 100 ms later
        if(actuators == 0){ //if launch sequence turning actuators on for the first time, recorid ignition start time for auto abort timeout later in ARMED_STATE
          FIRST_ACT_start_t = IGN1_start_t;
        }
        /*turn on of SV1 and SV2, and start firing IGN1 here*/
        rocket_state = GS_cmd;
        actuators = actuators | A_IGN1;   //set IGN1 flag to 1 (turn ignition on)
        actuators = actuators & (~A_SV2); //set SV1 flag to 0 (shut off fuel) 
        actuators = actuators & (~A_SV1); //set SV2 flag to 0 (shut off oxidizer)
        break;
      case MANUAL_CTRL_CMD:
        actuators = GS_manual_ctrl_flags;     //expect a second data byte to follow if manual control command received
        if(actuators != 0){ //if anything turned on, get current time to schedule auto abort later (in case of radio failure)
          FIRST_ACT_start_t = micros();
        }
        /*turn on or off the respctive actuators here, based on the flags in the actuator variable */
        break;
    }
    //Serial.print("end of switch statement = ");
    //Serial.println(rocket_state);
  }
}
