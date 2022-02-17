from packet import BAUDRATE, get_packet, send_packet     #imports the data pacoet from packet.py. __init__.py needed to tell python where to start looking for import
from commands import num, MANUAL_CTRL_CMD, LAUNCH_CMD, ABORT_CMD
import serial.tools.list_ports
import keyboard
import time

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
serialInst.timeout = 0          #writing to serial USB link stalls program if timeout is non zero
serialInst.write_timeout = 0    #writing to serial USB link stalls program if timeout is non zero
serialInst.port = portVar
serialInst.open()

key_held = 0
actuator_flags = 0
prev_flags = 0

while True:
    # test buttons
    #print("pressed prev key:"+str(pressed_prev_key)+" l:"+str(keyboard.is_pressed(LAUNCH_CMD)))

    #detect button presses from keyboard
    if(keyboard.is_pressed(MANUAL_CTRL_CMD)):
        actuator_flags = num(keyboard)

        if (key_held == 0):
            send_packet(serialInst, MANUAL_CTRL_CMD, actuator_flags)
            key_held = 1

        elif(actuator_flags != prev_flags):
            send_packet(serialInst, MANUAL_CTRL_CMD, actuator_flags)

        prev_flags = actuator_flags

    elif (keyboard.is_pressed(ABORT_CMD)):
        if (key_held == 0):
            send_packet(serialInst, ABORT_CMD)
            key_held = 1
    elif(keyboard.is_pressed(LAUNCH_CMD)):
        if (key_held == 0):
            send_packet(serialInst, LAUNCH_CMD)
            key_held = 1
    else:
        key_held = 0

    # reading data while buffer
    if serialInst.in_waiting:
        #get consecutive bytes from USB connection, and interpret it as a data packet (a dict)
        packet = get_packet(serialInst)

        #print out each measurement stored in packet
        for (key, value) in packet.items():
            print(key + " = ", end="")
            if(key == "actuators"):
                print("{0:016b}".format(value))
            elif(key == "timestamp"):
                print("{0:16d}".format(value))
            else:
                print(str(value))
        print()
