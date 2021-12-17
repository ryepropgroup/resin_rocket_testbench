from packet import *         #imports the data pacoet from packet.py. __init__.py needed to tell python where to start looking for import
import serial.tools.list_ports

ports = serial.tools.list_ports.comports()

serialInst = serial.Serial()

# reading ports line by line now

# empty list to append
portList = []

# go through all the ports
for onePort in ports:
    portList.append(str(onePort))
    print(str(onePort))
    # This line needs to detect the arduino and the port

# asking  in terminal which port user wants to  connect. Write the number of it..

val = input("select Port: COM")

# Goes through the loop of list of ports and displays the port we selected
for x in range(0, len(portList)):
    if portList[x].startswith("COM" + str(val)):
        portVar = "COM" + str(val)
        print(portList[x])

serialInst.baudrate = 9600
serialInst.port = portVar
serialInst.open()

while True:

    # reading data while buffer
    if serialInst.in_waiting:
        #make byte array of length 20
        bytes = bytearray(serialInst.read(18))
        bytes.append(0)
        bytes.append(0)
        packet = DATA.from_buffer(bytes)

        print("type: "+str(packet.type))
        print("state: "+str(packet.state))
        print("timestamp: "+str(packet.timestamp))
        print("t1: "+str(packet.t1))
        print(packet.t2.decode('utf'))
        print(packet.p1.decode('utf'))
        print(packet.p2.decode('utf'))
        print(packet.fm1.decode('utf'))
        print(packet.fm2.decode('utf'))