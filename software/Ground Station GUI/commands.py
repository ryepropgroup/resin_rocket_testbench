#commands from ground station are a single char
MANUAL_CTRL_CMD = 'M'   #manually override which actuators are turned on/off
LAUNCH_CMD = 'L'        #auto launch
ABORT_CMD = 'A'         #auto abort

#button combinations for manually overriding each actuator on the engine
manual_ctrl_buttons =  {"sv1" : ["ctrl","f1"],
                        "sv2" : ["ctrl","f2"],
                        "sv3" : ["ctrl","f3"],
                        "sv4" : ["ctrl","f4"],
                        "sv5" : ["ctrl","f5"],
                        "sv6" : ["ctrl","f6"],
                        "sv7" : ["ctrl","f7"],
                        "sv8" : ["ctrl","f8"],
                        "sv9" : ["ctrl","f9"],
                        "sv10": ["ctrl","f10"],
                        "sv11": ["ctrl","f11"],
                        "sv12": ["ctrl","f12"],
                        "sv13": ["ctrl","1"],
                        "ign1": ["ctrl","2"]}

#which bit corresponds to each actuator
actuator_flags = {"sv1" : b0000000000000001,
                  "sv2" : b0000000000000010,
                  "sv3" : b0000000000000100,
                  "sv4" : b0000000000001000,
                  "sv5" : b0000000000010000,
                  "sv6" : b0000000000100000,
                  "sv7" : b0000000001000000,
                  "sv8" : b0000000010000000,
                  "sv9" : b0000000100000000,
                  "sv10": b0000001000000000,
                  "sv11": b0000010000000000,
                  "sv12": b0000100000000000,
                  "sv13": b0001000000000000,
                  "ign1": b0010000000000000}