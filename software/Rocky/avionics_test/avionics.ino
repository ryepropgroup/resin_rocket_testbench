//This program changes the states of the rocket's actuators in response to ground station commands
//No data measuring is done in order to make debugging the radios easier
//Started by Toni Pano on Dec 17th, 2021

#include "rocket_comms.h";   //include definitions for ground commands, rocket states, data packet, and actuator flags 
#include <Wire.h>
#include <SPI.h>

#define CLR(x, bit_mask) (x &= (~bit_mask))
#define SET(x, bit_mask) (x |= bit_mask)

//stores radio comms info to send and to receive
const unsigned int BAUD_RATE = 9600;//230400;  //bits per second in all serial lines (radio and serial to USB output)
char GS_cmd;                          //command from ground station
uint16_t GS_manual_ctrl_flags;            //flags sent from ground station, in the event of a manual control command
struct data_pdu pkt;                  //data packet to send to ground station

//rocket specific states
uint32_t time;      //current time
char rocket_state;  //current state of rocket
uint16_t actuators;     //on/off status for solenoid valves (SV1, SV2) and igniter (IGN1)
#define sec 1000000 //the number of microseconds in a second (used because clock measures time in microseconds)
uint32_t IGN1_start_t = 0;              //start time of igniter in AUTO_LAUNCH state, used for keeping igniter on for x amount of time
const uint32_t SV1_start_t = 1.5*sec;  //(0.08s) when to turn on fuel, relative to start of igniter ignition
const uint32_t SV2_start_t = 1.5*sec;  //(0.08s) when to turn on oxidizer, relative to start of igniter ignition
const uint32_t IGN1_duration = 3.0*sec; //(0.1s) how long to fire the igniter for
uint32_t ABORT_start_t = 0;               //start time of ABORT state, used for staying in ABORT state for x amount of time
const uint32_t ABORT_duration = 1.0*sec;  //(1.0s) how long to stay in the ABORT state before processing more commands
uint32_t FIRST_ACT_start_t = 0;               //remembers first time when any actuator on rocket turns on. Used to automatically trigger ABORT sequence, if ground station can't send ABORT command (due to radio failure)
const uint32_t AUTO_ABORT_start_t = 5.0*sec;  //when to trigger AUTO_ABORT, relative to first actuator turning on. Either triggers in ARMED_STATE, or during LAUNCH_STATE. Will be cancelled in ARMED_STATE if all actuators are turned off manually, or through ABORT_cmd from ground station

//setup() runs once, before loop() starts
void setup() {
  //initialize ground station value to default value (0)
  GS_cmd = 0;
  
  //initialize all packet values to default value (MAX value for timestamp, 0 for rest)
  memset((byte*)&pkt, 0, sizeof(pkt));  //set everything to 0 in packet
  pkt.timestamp = 0xFFFFFFFF;

  //initialize rocket state to default value (SAFE)
  //rocket_state = SAFE_STATE;
  rocket_state = ARMED_STATE; //we are missing the circuit to detect if 24V is on high voltage line, so default state is ARMED
  
  //set up radio at min freq. (9600 Hz)
  Serial1.begin(BAUD_RATE);

  //set up debug console (USB port on Rocky) at min freq. (9600 Hz)
  Serial.begin(9600);  
  Serial.println("begin");
  Wire.begin();
  spi_setup();
  
  unsigned long loops = 60000;
  unsigned int i;
  unsigned long t1, t2, delta_t;
  float loop_time, loop_clock_cycles;  //loop time and clock cycles in microseconds
  float clock_period = 1.0/16.0; //clock period in microseconds
  float loop_freq;
  
  while(true){
    t1 = micros();
    for(i = 0; i < loops; i++){
      //Serial.println(i);
      loop();
    }
    t2 = micros();
    
    delta_t = t2-t1;
    loop_time = ((float)delta_t)/((float)loops);
    loop_freq = 1000000.0/loop_time;    //loop time in microseconds, must divide it by 1000000 to convert to seconds.
    loop_clock_cycles = loop_time/clock_period;

    Serial.print("t1, t2 = ");
    Serial.print(t1);
    Serial.print(" ");
    Serial.println(t2);
    Serial.print("time for "); 
    Serial.print(loops);
    Serial.print(" loops: ");
    Serial.print(delta_t);
    Serial.println(" us");
    Serial.print("avg time for each loop: ");
    Serial.print(loop_time);
    Serial.println(" us");
    Serial.print("loop freq: ");
    Serial.print(loop_freq/1000.0);
    Serial.println(" kHz");
    Serial.print("# of 16 MHz clock cycles per loop: ");
    Serial.print(loop_clock_cycles);
    Serial.println(" cycles");
  }
}

/*void spi_setup(){
  SPI.begin();
  SET(SPCR, 1<<SPE);  //enable SPI unit
  SET(SPCR, 1<<MSTR); //make SPI unit work in controller mode?
  SET(SPCR, 1<<SPIE); //enable SPI interrupts

  //spi double speed = fclk/2 = 16MHz/2 = 8MHz
  SET(SPSR, 1<<SPI2X);
  CLR(SPSR, 1<<SPR1);
  CLR(SPSR, 1<<SPR0);
}

volatile byte* SPI_buffer;
volatile byte SPI_buffer_len = 19;
volatile byte SPI_buffer_i;
volatile byte SPI_available = 1;

void spi_transfer(volatile byte* data, volatile byte data_len){
  SPI_buffer = data;
  SPI_buffer_len = data_len;
  SPI_buffer_i = 0;
  SPI_available = 0;
  SPDR = SPI_buffer[0];
}

ISR (SPI_STC_vect){
  SPI_buffer[SPI_buffer_i] = SPDR;  //read data that came in from last transmission

  if(SPI_buffer_i < SPI_buffer_len){  //start new transmission of data if data still needs to be sent,
    SPI_buffer_i++;
    SPDR = SPI_buffer[SPI_buffer_i];  
  }
  else{
    SPI_available = 1;
  }
}*/

void spi_setup(){
  SPI.begin();
}

void spi_transfer(byte data[], byte data_len){
  byte i;
  for(i = 0; i < data_len; i++){
    SPDR = data[i];
    while(!(SPSR & (1<<SPIF))){};
    data[i] = SPDR;
  }
}

//loop() will loop indefinitely
char temp;  //temporary variable for storing command from ground station (When simulating ground station commands using Rocky's serial monitor input, it helps to get rid of whitespace characters you enter, like '\n')
void loop() {
  time = micros();
  pkt.timestamp = time;

  GS_cmd = 'E'; //E for empty, no ground station command
  if(Wire.available() > 0){
    temp = Wire.peek(); //reads first byte in Serial buffer without removing it from buffer
    if(temp == '\n'){ //clear input of '\n' chars, if testing code with Serial monitor
      Wire.read();  //remove first byte from Serial buffer
    }
    else{             //deal with ground station commands
      if(temp == MANUAL_CTRL_CMD){  //if manual control command sent, wait for actuator flags to appear in following byte, before reading command
        if(Wire.available() >= 3){ //wait for at least 3 bytes to appear (1 byte manual control command and 2 bytes actuator flags)
          GS_cmd = Wire.read();                     //read manual control command byte in Serial buffer, and remove it from buffer
          GS_manual_ctrl_flags = Wire.read();       //read actuator flags byte for 8 lower bits in Serial buffer, and remove it from buffer. Must subtract '0' if testing with Serial monitor commands
          GS_manual_ctrl_flags += Wire.read() << 8; //read actuator flags byte for 8 upper bits in Serial buffer, and remove it from buffer. Must subtract '0' if testing with Serial monitor commands
        }
      }
      else{ //otherwise expect single byte command
        GS_cmd = Wire.read(); //read single byte command in Serial buffer, and remove it from buffer
      }
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
  /*Serial1.write((byte *) &pkt, sizeof(pkt));*/
  /*Wire.beginTransmission(4); // transmit to device #4
  Wire.write((byte *) &pkt, sizeof(pkt));
  Wire.endTransmission();    // stop transmitting*/
  spi_transfer((byte*) &(pkt.t[0]), 2);
  spi_transfer((byte*) &(pkt.t[1]), 2);
  spi_transfer((byte*) &(pkt.t[2]), 2);
  spi_transfer((byte*) &(pkt.t[3]), 2);
  spi_transfer((byte*) &(pkt.t[4]), 2);
  
  spi_transfer((byte*) &(pkt.p[0]), 2);
  spi_transfer((byte*) &(pkt.p[1]), 2);
  spi_transfer((byte*) &(pkt.p[2]), 2);
  spi_transfer((byte*) &(pkt.p[3]), 2);
  spi_transfer((byte*) &(pkt.p[4]), 2);
  
  spi_transfer((byte*) &(pkt.fr[0]), 2);
  spi_transfer((byte*) &(pkt.fr[1]), 2);
  spi_transfer((byte*) &(pkt.fr[2]), 2);
  
  spi_transfer((byte*) &(pkt.s[0]), 2);
  spi_transfer((byte*) &(pkt.s[1]), 2);
  
  spi_transfer((byte*) &(pkt.f), 2);
  
  /*spi_transfer((byte *) &pkt, (byte *) &pkt, (byte)sizeof(pkt));*/
  
  /*Serial.print(GS_cmd);
  if(GS_cmd == MANUAL_CTRL_CMD){
    Serial.print(GS_manual_ctrl_flags, BIN);
  }
  Serial.print(" -> ");
  Serial.print(pkt.rocket_state);
  Serial.print(' ');
  Serial.print(pkt.actuators, BIN);
  Serial.print(' ');
  Serial.println(((float)pkt.timestamp)/1000000, 8);*/
  //delay(1000);
}

void update_rocket_state(){
  //deal with existing state, according to state hierarchy
  if(rocket_state == ABORT_STATE){ //abort state overrides any commands until aborting done
    //abort timing
    if(time-ABORT_start_t >= ABORT_duration){ //randomly chosen time for demo purposes
      rocket_state = ARMED_STATE;
    }
  }
  else if(rocket_state == LAUNCH_STATE){ //auto launch state overrides any commands (except abort) until done
    //Serial.print("beginning of LAUNCH STATE = ");
    if(GS_cmd == ABORT_CMD){    //skip to state change if ground station command is to abort
        rocket_state = ARMED_STATE;
        //Serial.println(rocket_state);
    }
    else if(time-FIRST_ACT_start_t >= AUTO_ABORT_start_t){ //skip to state change and force abort if auto abort should happen
      GS_cmd = ABORT_CMD;
      rocket_state = ARMED_STATE;
      //Serial.println("AUTO ABORT");
    }
    else{ //ignition timing
      if((actuators & A_SV1) == 0){  //check if SV1 still needs to be turned on
        if(time-IGN1_start_t >= SV1_start_t){  //do full 32 bit time comparison
          /*open SV1 here*/
          SET(actuators, A_SV1);
        }
      }
      if((actuators & A_SV2) == 0){  //check if SV2 still needs to be turned on
        if(time-IGN1_start_t >= SV2_start_t){  //do full 32 bit time comparison
          /*open SV2 here*/
          SET(actuators, A_SV2);
        }
      }
      if(actuators & A_IGN1){ //check if igniter still needs to be turned on
        if(time-IGN1_start_t >= IGN1_duration){   //do full 32 bit time comparison
          /*stop firing IGN1 here*/
          CLR(actuators, A_IGN1);
        }
      }
      if((actuators & (A_IGN1 | A_SV1 | A_SV2)) == ((~A_IGN1) & A_SV1 | A_SV2)){
        rocket_state = ARMED_STATE;
      }
    }
  }
  
  if(rocket_state == ARMED_STATE){ //armed state allows responding to ground station commands
    if(GS_cmd != ABORT_CMD && actuators != 0){   //see if auto abort needs to shut off any actuators
      if(time-FIRST_ACT_start_t >= AUTO_ABORT_start_t){
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
        SET(actuators, A_IGN1);   //set IGN1 flag to 1 (turn ignition on)
        CLR(actuators, A_SV2); //set SV1 flag to 0 (shut off fuel) 
        CLR(actuators, A_SV1); //set SV2 flag to 0 (shut off oxidizer)
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
