/*defines packet data unit (pdu) for ground station commands to rocket
and data from rocket*/

//commands from ground station are a single char
#define MANUAL_CTRL_CMD 'M'
#define AUTO_LAUNCH_CMD 'L'
#define ABORT_CMD 'A'

//rocket states
#define SAFE_STATE 'S'   //no 24V power detected, means actuators can't fire
#define ARMED_STATE 'R'  //24V power to actuators detected, not firing
#define MANUAL_CTRL_STATE 'M'  //firing any combo of actuators manually
#define AUTO_LAUNCH_STATE 'L'    //firing
#define ABORT_STATE 'A'

//packet for rocket data
struct data_pdu{
  char rocket_state; //current state of the rocket as a char (safe, armed, launching, aborting, manual control, etc).
  byte actuators; //each bit is a an on/off flag representing SV1, SV2, and IGN1;
  uint32_t timestamp; //timestamp for measurements
  uint16_t t[2];  //readings of temperature sensors 1 and 2
  uint16_t p[2];  //readings of pressure sensors 1 and 2
  uint16_t f[2];  //readings of flow meter sensors 1 and 2
};

//actuator bit positions
byte A_SV1 =  0b00000001;
byte A_SV2 =  0b00000010;
byte A_IGN1 = 0b00000100;
