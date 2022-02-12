from packet import BAUDRATE, get_packet     #imports the data pacoet from packet.py. __init__.py needed to tell python where to start looking for import
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

serialInst.baudrate = BAUDRATE
serialInst.port = portVar
serialInst.open()

while True:
    # test buttons
    
    # reading data while buffer
    if serialInst.in_waiting:

        #get consecutive bytes from USB connection, and interpret it as a data packet (a dict)
        packet = get_packet(serialInst)

        #print out each measurement stored in packet
        for (key, value) in packet.items():
            print(key + " = " + str(value))
        print()