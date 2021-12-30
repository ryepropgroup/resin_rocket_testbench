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
byte data_byte;                   //store a single byte of data from radio
uint8_t pkt_byte_pos;             //position of byte being read from current packet from radio

//ground station states
char GS_state;                 //state of ground station

// put your setup code here, to run once:
void setup() {
  //initialize ground station command to default value (0)
  GS_cmd = 0;

  //initialize laptop command to default value ('E' for empty)
  laptop_cmd ='E';

  //initialize ground station state to default (STORE DATA)
  GS_state = STORE_DATA_STATE;
  
  data_byte = 0;      //set data byte to default value (0)
  pkt_byte_pos = 0;
  //store_byte_ptr = 0; //set bytes read to default value (0)
  //send_byte_ptr = 0;  //
  
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
  if(Serial1.available() > 0){
    data_byte = Serial1.read(); //read a single byte of data from radio
    
    update_GS_state();
    
    //update byte pos
    pkt_byte_pos++;               //increment bytes read
    if(pkt_byte_pos == PKT_LEN){  //reset bytes to 0 after each packet read
      pkt_byte_pos = 0;
    }
  }

  Serial.print("Laptop CMD: ");
  Serial.print(laptop_cmd);
  Serial.print(", pkt_byte #");
  Serial.print(pkt_byte_pos);
  Serial.print(", GS_state: ");
  Serial.println(GS_state);
  Serial1.print('A');
  delay(100);
}

void update_GS_state(){
  //check if anything needs to be updated based on first byte of each packet
  if(pkt_byte_pos == 0){
    //update buttons on LED by reading rocket_state byte in latest packet (first byte of each packet)
    //light LEDs if button press triggered respective state change in rocket
    switch(data_byte){
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
  }
  
  //act on current ground station state, if needed
  if(GS_state == PASS_DATA_STATE){  //pass data byte from radio to USB connection of laptop
    Serial.write(data_byte);
  }
}
