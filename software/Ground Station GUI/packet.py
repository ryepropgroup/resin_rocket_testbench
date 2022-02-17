import struct

#define baud rate for data coming from ground station Arduino (aka Groundy)
BAUDRATE = 9600

#convert a consecutive array of data bytes into a dict of the data contents
def get_packet(serialInst):
    #get 18 consecutive bytes from USB connection
    bytes = serialInst.read(19) #call read() func from Serial object: aka serial.Serial().read()
            #serialInst.write('M')
            #serialInst.write(b'00001111')
    #split data into its contents
    #array of bytes is little endian struct of: [char, char, uint32_t, uint16_t,  uint16_t,  uint16_t, uint16_t,  uint16_t,  uint16_t]
    values = struct.unpack("<cHIHHHHHH", bytes)

    #label data contents in a dict
    packet = {"rocket_state" : values[0],
              "actuators" : values[1],
              "timestamp" : values[2],
              "t1" : values[3],
              "t2" : values[4],
              "p1" : values[5],
              "p2" : values[6],
              "f1" : values[7],
              "f2" : values[8]}

    return packet

def send_packet(serialInst, command, actuator_flags = -1):
    print("command: "+command, end = "")
    command = command.encode("utf-8")
    if(actuator_flags == -1):
        print()
        bytes = struct.pack("<c", command)
    else:
        print("{0:016b}".format(actuator_flags))
        bytes = struct.pack("<cH", command, actuator_flags)

    serialInst.write(bytes)