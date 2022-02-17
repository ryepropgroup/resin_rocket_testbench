import keyboard

#commands from ground station are a single char
MANUAL_CTRL_CMD = 'M'   #manually override which actuators are turned on/off
LAUNCH_CMD = 'L'        #auto launch
ABORT_CMD = 'A'         #auto abort

#button combinations for manually overriding each actuator on the engine
manual_ctrl_buttons =  {"sv1" : "1",
                        "sv2" : "2",
                        "sv3" : "3",
                        "sv4" : "4",
                        "sv5" : "5",
                        "sv6" : "6",
                        "sv7" : "7",
                        "sv8" : "8",
                        "sv9" : "9",
                        "sv10": "f1",
                        "sv11": "f2",
                        "sv12": "f3",
                        "sv13": "f4",
                        "ign1": "f5"}

#which bit corresponds to each actuator
actuator_flags = {"sv1" : 0b0000000000000001,
                  "sv2" : 0b0000000000000010,
                  "sv3" : 0b0000000000000100,
                  "sv4" : 0b0000000000001000,
                  "sv5" : 0b0000000000010000,
                  "sv6" : 0b0000000000100000,
                  "sv7" : 0b0000000001000000,
                  "sv8" : 0b0000000010000000,
                  "sv9" : 0b0000000100000000,
                  "sv10": 0b0000001000000000,
                  "sv11": 0b0000010000000000,
                  "sv12": 0b0000100000000000,
                  "sv13": 0b0001000000000000,
                  "ign1": 0b0010000000000000}

def num(keyboard):
    flags = 0

    for actuator in manual_ctrl_buttons.keys():
        if keyboard.is_pressed(manual_ctrl_buttons[actuator]):
            #print("pressed" + manual_ctrl_buttons[actuator])
            flags = flags | actuator_flags[actuator]

    return flags