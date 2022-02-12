import struct

#define baud rate for data coming from ground station Arduino (aka Groundy)
BAUDRATE = 9600

#convert a consecutive array of data bytes into a dict of the data contents
def get_packet(serialInst):
    #get 18 consecutive bytes from USB connection
    bytes = serialInst.read(18) #call read() func from Serial object: aka serial.Serial().read()
            serialInst.write('M')
            serialInst.write(b'00001111')
    #split data into its contents
    #array of bytes is little endian struct of: [char, char, uint32_t, uint16_t,  uint16_t,  uint16_t, uint16_t,  uint16_t,  uint16_t]
    values = struct.unpack("<ccIHHHHHH", bytes)

    #label data contents in a dict
    packet = {"type" : values[0],
              "state" : values[1],
              "timestamp" : values[2],
              "t1" : values[3],
              "t2" : values[4],
              "p1" : values[5],
              "p2" : values[6],
              "f1" : values[7],
              "f2" : values[8]}

    return packet