//This program sends commands to the junction box to control the rocket, and reads the data sent from the rocket
//No data is sent to the USB port to make debugging easier.
//Started by Toni Pano on Dec 22, 2021

#include "laptop_comms.h"   //include definitions for laptop commands and ground station states
#include "rocket_comms.h"   //include definitions for ground station commands, rocket states, data packet, and actuator flags 

char GS_cmd;                          //command to send to rocket
char GS_manual_flags;                 //actuators to turn on/off in rocket, used if sending manual control command to rocket

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
  //initialize ground station command to default value (0)
  GS_cmd = 0;

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
    
    update_GS_state();
  }
  else{
    
  }

  Serial.print("Laptop CMD: ");
  Serial.print(laptop_cmd);
  Serial.print(", GS_state: ");
  Serial.println(GS_state);
  Serial1.print('A');
  delay(100);
}

void update_GS_state(){
  //update buttons on LED by reading rocket_state byte in latest packet (first byte of each packet)
  //light LEDs if button press triggered respective state change in rocket
  switch(pkt.rocket_state){
    case ABORT_STATE:
      /*turn on ABORT led*/
      /*turn off AUTO_LAUNCH led*/
      /*turn on ARMED led*/
      break;
    case LAUNCH_STATE:
      /*turn off ABORT led*/
      /*turn on AUTO_LAUNCH led*/
      /*turn on ARMED led*/
      break;
    case ARMED_STATE:
      /*turn off ABORT led*/
      /*turn off AUTO_LAUNCH led*/
      /*turn on ARMED led*/
      break;
    case SAFE_STATE:
      /*turn off ABORT led*/
      /*turn off AUTO_LAUNCH led*/
      /*turn off ARMED led*/
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
