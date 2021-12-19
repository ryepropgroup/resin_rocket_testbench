//This program changes the states of the rocket's actuators in response to ground station commands
//No data measuring is done in order to make debugging the radios easier
//Started by Toni Pano on Dec 17th, 2021

#include "pdu.h";

char GS_cmd;                //command from ground station
char GS_manual_ctrl_flags;  //flags sent from ground station, in the event of a manual control command
struct data_pdu pkt;        //data packet to send to ground station

//rocket specific states
char rocket_state;                //current state of rocket
char actuators;                   //on/off status for solenoid valves (SV1, SV2) and igniter (IGN1)
uint32_t IGN1_start_t = 0;        //start time of igniter in AUTO_LAUNCH state, used for keeping igniter on for x amount of time
uint32_t SV1_turnon_t = 800000;   //(0.08s) when to turn on fuel, relative to start of igniter ignition
uint32_t SV2_turnon_t = 800000;   //(0.08s) when to turn on oxidizer, relative to start of igniter ignition
uint32_t IGN1_duration = 3000000; //(0.1s) how long to fire the igniter for
uint32_t ABORT_start_t = 0;       //start time of ABORT state, used for staying in ABORT state for x amount of time
uint32_t ABORT_duration = 1000000;//(1.0s) how long to stay in the ABORT state before processing more commands

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
  Serial.begin(9600);

  //set up debug console (USB port on Rocky) at min freq. (9600 Hz)
  //Serial.begin(9600);  
}

char temp;
//loop() will loop indefinitely
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
  Serial.print(" -> ");
  Serial.print(pkt.rocket_state);
  Serial.print(' ');
  Serial.print(pkt.actuators, BIN);
  Serial.print(' ');
  Serial.println(pkt.timestamp);
  delay(10);
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
    //skip to state change if ground station command is to abort
    //Serial.println(GS_cmd);
    if(GS_cmd == ABORT_CMD){
        rocket_state = ARMED_STATE;
        //Serial.print("beginning of LAUNCH STATE = ");
        //Serial.println(rocket_state);
    }
    else{
      //ignition timing
      if((actuators & A_SV1) == 0){  //check if SV1 still needs to be turned on
        if(micros()-IGN1_start_t >= SV1_turnon_t){  //do full 32 bit time comparison
          /*open SV1 here*/
          actuators = actuators | A_SV1;
        }
      }
      if((actuators & A_SV2) == 0){  //check if SV2 still needs to be turned on
        if(micros()-IGN1_start_t >= SV2_turnon_t){  //do full 32 bit time comparison
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
    switch(GS_cmd){
      case ABORT_CMD:
        ABORT_start_t = micros(); //record abort start time to maintain abort state for specific length of time
        /*turn off all actuators here*/
        rocket_state = GS_cmd;
        actuators = 0;  //turn off all actuators (solenoids + igniter);
        break;
      case LAUNCH_CMD:
        IGN1_start_t = micros();  //record ignition start time to shut off ignition 100 ms later
        /*torun of SV1 and SV2, and start firing IGN1 here*/
        rocket_state = GS_cmd;
        actuators = actuators | A_IGN1;   //set IGN1 flag to 1 (turn ignition on)
        actuators = actuators & (~A_SV2); //set SV1 flag to 0 (shut off fuel) 
        actuators = actuators & (~A_SV1); //set SV2 flag to 0 (shut off oxidizer)
        break;
      case MANUAL_CTRL_CMD:
        actuators = GS_manual_ctrl_flags;     //expect a second data byte to follow if manual control command received
        /*turn on or off the respctive actuators here, based on the flags in the actuator variable */
        //rocket_state = MANUAL_CTRL_CMD;
        break;
    }
    //Serial.print("end of switch statement = ");
    //Serial.println(rocket_state);
  }
}
