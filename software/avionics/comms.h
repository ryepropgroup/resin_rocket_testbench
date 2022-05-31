/*defines packet data unit (pdu) for ground station commands to rocket
and data from rocket.

Started by Toni Pano on Dec 17th, 2021*/

//commands from ground station are a single char
#define MANUAL_CTRL_CMD 'M' //modify which actuators are turned on/off manually
#define LAUNCH_CMD 'L'      //auto launch
#define ABORT_CMD 'A'       //auto abort

//rocket states
#define SAFE_STATE 'S'    //no 24V power detected (means actuators can't fire), all actuators off
#define ARMED_STATE 'R'   //24V power to actuators available, actuators can change to any state, each may already be on or off depending on previous states
#define LAUNCH_STATE 'L'  //fire igniter and solenoids in short automated sequence
#define ABORT_STATE 'A'   //shut off everything in short automated sequence

//packet for rocket data
struct data_pdu{
  char rocket_state;  //current state of the rocket as a char (safe, armed, launching, aborting, manual control, etc).
  uint32_t actuators;     //each bit is a an on/off flag representing SV1, SV2, and IGN1;
  uint32_t timestamp; //timestamp for measurements
  uint16_t t[5];      //readings of temperature sensors       N2, N2O, Eth, Igniter, Coolant
  uint16_t p[5];      //readings of pressure sensors          N2, N2O, Eth, Engine,  Coolant
  uint16_t fr[3];     //readings of volume flow rate sensors      N2O, Eth,          Coolant
  uint16_t s[2];      //readings of strain gauges on outer engine wall
  uint16_t f;         //reading of thrust from force sensor on engine
};

//actuator bit positions
byte A_SV1  =  0b0000000000000001;  //solenoid valve 1 (fuel)
byte A_SV2  =  0b0000000000000010;  //solenoid valve 2 (oxidizer)
byte A_SV3  =  0b0000000000000100;
byte A_SV4  =  0b0000000000001000;
byte A_SV5  =  0b0000000000010000;
byte A_SV6  =  0b0000000000100000;
byte A_SV7  =  0b0000000001000000;
byte A_SV8  =  0b0000000010000000;
byte A_SV9  =  0b0000000100000000;
byte A_SV10 =  0b0000001000000000;
byte A_SV11 =  0b0000010000000000;
byte A_SV12 =  0b0000100000000000;
byte A_SV13 =  0b0001000000000000;
byte A_IGN1 =  0b0010000000000000;  //igniter 1 (solid rocket motor)
