/*defines laptop commands for laptop to send to ground station.

Started by Toni Pano on Dec 22, 2021*/

#define PASS_DATA_CMD 'P'   //pass data in ground station data buffer to laptop
#define STORE_DATA_CMD 'S'  //do not pass data to laptop, store incoming data in ground station data buffer

//states for ground station
#define PASS_DATA_STATE 'P'     //pass data in buffer to laptop, starting from oldest entry
#define STORE_DATA_STATE 'S'    //only store most recent data in buffer
