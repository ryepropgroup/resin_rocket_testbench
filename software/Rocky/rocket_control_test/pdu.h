/*defines packet data unit (pdu) for ground station commands to rocket
and data from rocket*/

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
  byte actuators;     //each bit is a an on/off flag representing SV1, SV2, and IGN1;
  uint32_t timestamp; //timestamp for measurements
  uint16_t t[2];      //readings of temperature sensors 1 and 2
  uint16_t p[2];      //readings of pressure sensors 1 and 2
  uint16_t f[2];      //readings of flow meter sensors 1 and 2
};

//actuator bit positions
byte A_SV1 =  0b00000001; //solenoid valve 1 (fuel)
byte A_SV2 =  0b00000010; //solenoid valve 2 (oxidizer)
byte A_IGN1 = 0b00000100; //igniter 1 (solid rocket motor)
