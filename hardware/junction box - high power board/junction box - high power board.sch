EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5100 4550 5200 4550
Wire Wire Line
	5100 5250 5200 5250
Wire Wire Line
	5800 5250 5900 5250
Wire Wire Line
	5900 4550 5800 4550
Wire Wire Line
	5900 3850 5800 3850
Wire Wire Line
	5100 5250 5100 5400
Wire Wire Line
	5100 5400 5500 5400
Wire Wire Line
	5900 5400 5900 5250
Connection ~ 5100 5250
Connection ~ 5900 5250
$Comp
L power:GNDREF #PWR?
U 1 1 61912711
P 5500 5450
F 0 "#PWR?" H 5500 5200 50  0001 C CNN
F 1 "GNDREF" H 5505 5277 50  0000 C CNN
F 2 "" H 5500 5450 50  0001 C CNN
F 3 "" H 5500 5450 50  0001 C CNN
	1    5500 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5450 5500 5400
Connection ~ 5500 5400
Wire Wire Line
	5500 5400 5900 5400
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 619132D9
P 7700 3550
F 0 "J3" H 7550 3800 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6950 3700 50  0000 L CNN
F 2 "" H 7700 3550 50  0001 C CNN
F 3 "~" H 7700 3550 50  0001 C CNN
	1    7700 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L_SV1
U 1 1 61915554
P 8750 3600
F 0 "L_SV1" H 8838 3646 50  0000 L CNN
F 1 "SV1" H 8838 3555 50  0000 L CNN
F 2 "" H 8750 3600 50  0001 C CNN
F 3 "~" H 8750 3600 50  0001 C CNN
	1    8750 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 61917CA0
P 7800 3550
F 0 "J4" H 7900 3800 50  0000 C CNN
F 1 "Conn_01x02_Male" H 8150 3700 50  0000 C CNN
F 2 "" H 7800 3550 50  0001 C CNN
F 3 "~" H 7800 3550 50  0001 C CNN
	1    7800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 3550 8650 3450
Wire Wire Line
	8650 3450 8750 3450
Wire Wire Line
	8650 3650 8650 3750
Wire Wire Line
	8650 3750 8750 3750
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 6191BE55
P 7700 4250
F 0 "J5" H 7550 4500 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6950 4400 50  0000 L CNN
F 2 "" H 7700 4250 50  0001 C CNN
F 3 "~" H 7700 4250 50  0001 C CNN
	1    7700 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L_SV2
U 1 1 6191BE5B
P 8750 4300
F 0 "L_SV2" H 8838 4346 50  0000 L CNN
F 1 "SV2" H 8838 4255 50  0000 L CNN
F 2 "" H 8750 4300 50  0001 C CNN
F 3 "~" H 8750 4300 50  0001 C CNN
	1    8750 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 6191BE61
P 7800 4250
F 0 "J6" H 7900 4500 50  0000 C CNN
F 1 "Conn_01x02_Male" H 8150 4400 50  0000 C CNN
F 2 "" H 7800 4250 50  0001 C CNN
F 3 "~" H 7800 4250 50  0001 C CNN
	1    7800 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4250 8650 4150
Wire Wire Line
	8650 4150 8750 4150
Wire Wire Line
	8650 4350 8650 4450
Wire Wire Line
	8650 4450 8750 4450
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 61922F83
P 7700 4950
F 0 "J7" H 7550 5200 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6950 5100 50  0000 L CNN
F 2 "" H 7700 4950 50  0001 C CNN
F 3 "~" H 7700 4950 50  0001 C CNN
	1    7700 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 61922F8F
P 7800 4950
F 0 "J8" H 7900 5200 50  0000 C CNN
F 1 "Conn_01x02_Male" H 8150 5100 50  0000 C CNN
F 2 "" H 7800 4950 50  0001 C CNN
F 3 "~" H 7800 4950 50  0001 C CNN
	1    7800 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4950 8650 4850
Wire Wire Line
	8650 4850 8750 4850
Wire Wire Line
	8650 5050 8650 5150
Wire Wire Line
	8650 5150 8750 5150
Text Notes 7350 3250 0    50   ~ 0
barrel jack connectors
Wire Notes Line
	8600 3400 9400 3400
Wire Notes Line
	9400 3400 9400 3800
Wire Notes Line
	9400 3800 8600 3800
Wire Notes Line
	8600 3800 8600 3400
Wire Notes Line
	8600 4100 9400 4100
Wire Notes Line
	9400 4100 9400 4500
Wire Notes Line
	9400 4500 8600 4500
Wire Notes Line
	8600 4500 8600 4100
Wire Notes Line
	8600 4800 9400 4800
Wire Notes Line
	9400 4800 9400 5200
Wire Notes Line
	9400 5200 8600 5200
Wire Notes Line
	8600 5200 8600 4800
Text Notes 8550 3350 0    50   ~ 0
Solenoid Valve 1 (SV1)
Text Notes 8550 4050 0    50   ~ 0
Solenoid Valve 2 (SV2)
Text Notes 8700 4750 0    50   ~ 0
Igniter 1 (IGN1)
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 61901B49
P 3850 4500
F 0 "J1" H 3450 4100 50  0000 C CNN
F 1 "Conn_01x04_Female" H 3450 4200 50  0000 C CNN
F 2 "" H 3850 4500 50  0001 C CNN
F 3 "~" H 3850 4500 50  0001 C CNN
	1    3850 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 4300 4050 4300
Wire Wire Line
	4900 4600 4050 4600
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 61903582
P 3750 4500
F 0 "J2" H 4150 4100 50  0000 R CNN
F 1 "Conn_01x04_Male" H 4400 4200 50  0000 R CNN
F 2 "" H 3750 4500 50  0001 C CNN
F 3 "~" H 3750 4500 50  0001 C CNN
	1    3750 4500
	-1   0    0    1   
$EndComp
Text GLabel 2900 4300 0    50   Input ~ 0
D10
Text GLabel 2900 4500 0    50   Input ~ 0
D9
Text GLabel 2900 4600 0    50   Input ~ 0
D8
$Comp
L power:GNDREF #PWR?
U 1 1 61904F0A
P 2550 4400
F 0 "#PWR?" H 2550 4150 50  0001 C CNN
F 1 "GNDREF" H 2555 4227 50  0000 C CNN
F 2 "" H 2550 4400 50  0001 C CNN
F 3 "" H 2550 4400 50  0001 C CNN
	1    2550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 4600 3550 4600
Wire Wire Line
	3550 4500 2900 4500
Wire Wire Line
	3550 4300 2900 4300
Text Label 3250 4300 0    50   ~ 0
Red
Text Label 3250 4400 0    50   ~ 0
Black
Text Label 3250 4500 0    50   ~ 0
Yellow
Text Label 3250 4600 0    50   ~ 0
Green
Text Label 4200 4300 0    50   ~ 0
SV1(Red)
Text Label 4200 4400 0    50   ~ 0
GND(Black)
Text Label 4200 4500 0    50   ~ 0
SV2(Yellow)
Wire Wire Line
	2550 4400 3550 4400
Text Label 4200 4600 0    50   ~ 0
IGN1(Green)
Wire Wire Line
	4050 4500 5000 4500
Wire Wire Line
	5000 4500 5000 4350
Wire Wire Line
	5000 4350 5200 4350
Wire Wire Line
	4050 4400 5100 4400
Wire Wire Line
	5100 4400 5100 4550
Wire Wire Line
	4900 5050 5200 5050
Text Notes 7350 7500 0    50   ~ 0
High Power Board
Text Notes 8150 7650 0    50   ~ 0
Nov 14th, 2021
Text Notes 10600 7650 0    50   ~ 0
A
Text Notes 2550 4150 0    50   ~ 0
from sensor board\n--->
Wire Wire Line
	5100 4550 5100 5250
Connection ~ 5100 4550
Wire Wire Line
	5100 3850 5100 4400
Connection ~ 5100 4400
Wire Wire Line
	4900 3650 4900 4300
Connection ~ 5900 4550
$Comp
L Simulation_SPICE:DIODE D1
U 1 1 6195BBD2
P 6350 3500
F 0 "D1" V 6396 3420 50  0000 R CNN
F 1 "DIODE" V 6305 3420 50  0000 R CNN
F 2 "" H 6350 3500 50  0001 C CNN
F 3 "~" H 6350 3500 50  0001 C CNN
F 4 "Y" H 6350 3500 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 6350 3500 50  0001 L CNN "Spice_Primitive"
	1    6350 3500
	0    -1   -1   0   
$EndComp
$Comp
L Simulation_SPICE:DIODE D2
U 1 1 61965A6E
P 6350 4200
F 0 "D2" V 6396 4120 50  0000 R CNN
F 1 "DIODE" V 6305 4120 50  0000 R CNN
F 2 "" H 6350 4200 50  0001 C CNN
F 3 "~" H 6350 4200 50  0001 C CNN
F 4 "Y" H 6350 4200 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 6350 4200 50  0001 L CNN "Spice_Primitive"
	1    6350 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 3350 6700 3350
Wire Wire Line
	6700 4050 6350 4050
Connection ~ 6700 4050
$Comp
L Simulation_SPICE:DIODE D3
U 1 1 619769CF
P 6350 4900
F 0 "D3" V 6396 4820 50  0000 R CNN
F 1 "DIODE" V 6305 4820 50  0000 R CNN
F 2 "" H 6350 4900 50  0001 C CNN
F 3 "~" H 6350 4900 50  0001 C CNN
F 4 "Y" H 6350 4900 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 6350 4900 50  0001 L CNN "Spice_Primitive"
	1    6350 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6700 4950 6700 4750
Wire Wire Line
	6700 4750 6350 4750
Connection ~ 6700 4750
$Comp
L Connector:Conn_01x02_Female J11
U 1 1 61986204
P 3450 3100
F 0 "J11" H 3300 3350 50  0000 L CNN
F 1 "XT90(Female)" H 2950 3250 50  0000 L CNN
F 2 "" H 3450 3100 50  0001 C CNN
F 3 "~" H 3450 3100 50  0001 C CNN
	1    3450 3100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 6198620A
P 3350 3100
F 0 "J10" H 3450 3350 50  0000 C CNN
F 1 "XT90(Male)" H 3600 3250 50  0000 C CNN
F 2 "" H 3350 3100 50  0001 C CNN
F 3 "~" H 3350 3100 50  0001 C CNN
	1    3350 3100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3150 3100 2600 3100
Wire Wire Line
	3150 3200 2600 3200
Connection ~ 5900 3850
Wire Wire Line
	6700 3100 6700 3350
Connection ~ 6700 3350
$Comp
L power:GNDREF #PWR?
U 1 1 61993080
P 2600 3200
F 0 "#PWR?" H 2600 2950 50  0001 C CNN
F 1 "GNDREF" H 2605 3027 50  0000 C CNN
F 2 "" H 2600 3200 50  0001 C CNN
F 3 "" H 2600 3200 50  0001 C CNN
	1    2600 3200
	1    0    0    -1  
$EndComp
Text Label 3700 3100 0    50   ~ 0
+24V(Red)
Text Label 3700 3200 0    50   ~ 0
GND(Black)
Wire Wire Line
	5100 3850 5200 3850
Wire Wire Line
	4900 3650 5200 3650
$Comp
L Relay_SolidState:CPC1002N U1
U 1 1 619944A8
P 5500 3750
F 0 "U1" H 5500 4075 50  0000 C CNN
F 1 "CPC1002N" H 5500 3984 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 5300 3550 50  0001 L CIN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1002N.pdf/$file/CPC1002N.pdf" H 5500 3750 50  0001 L CNN
	1    5500 3750
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:CPC1002N U2
U 1 1 6199C847
P 5500 4450
F 0 "U2" H 5500 4775 50  0000 C CNN
F 1 "CPC1002N" H 5500 4684 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 5300 4250 50  0001 L CIN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1002N.pdf/$file/CPC1002N.pdf" H 5500 4450 50  0001 L CNN
	1    5500 4450
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:CPC1002N U3
U 1 1 6199EE2D
P 5500 5150
F 0 "U3" H 5500 5475 50  0000 C CNN
F 1 "CPC1002N" H 5500 5384 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 5300 4950 50  0001 L CIN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1002N.pdf/$file/CPC1002N.pdf" H 5500 5150 50  0001 L CNN
	1    5500 5150
	1    0    0    -1  
$EndComp
Text Notes 1700 2550 0    50   ~ 0
connect to extension cord \ncoming from ground \nstation input board\n--->
Wire Wire Line
	4900 4600 4900 5050
Wire Wire Line
	6700 3350 6700 3550
Wire Wire Line
	6700 4050 6700 4250
Wire Wire Line
	6350 3650 7500 3650
Wire Wire Line
	6700 3550 7500 3550
Connection ~ 6700 3550
Wire Wire Line
	6700 3550 6700 4050
Wire Wire Line
	6700 4250 7500 4250
Connection ~ 6700 4250
Wire Wire Line
	6700 4250 6700 4750
Wire Wire Line
	6350 4350 7500 4350
Wire Wire Line
	6700 4950 7500 4950
Wire Wire Line
	6350 5050 7500 5050
Text Notes 5300 2950 0    50   ~ 0
High Power Board\n(has Solid State Relays)
Wire Wire Line
	8000 5050 8650 5050
Wire Wire Line
	8000 4950 8650 4950
Wire Wire Line
	8000 4350 8650 4350
Wire Wire Line
	8000 4250 8650 4250
Wire Wire Line
	8000 3650 8650 3650
Wire Wire Line
	8000 3550 8650 3550
$Comp
L power:+24V #PWR?
U 1 1 61D53B71
P 2600 2800
F 0 "#PWR?" H 2600 2650 50  0001 C CNN
F 1 "+24V" H 2615 2973 50  0000 C CNN
F 2 "" H 2600 2800 50  0001 C CNN
F 3 "" H 2600 2800 50  0001 C CNN
	1    2600 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:Fuse F4
U 1 1 61D57E85
P 4400 3100
F 0 "F4" V 4203 3100 50  0000 C CNN
F 1 "7A Fuse" V 4294 3100 50  0000 C CNN
F 2 "" V 4330 3100 50  0001 C CNN
F 3 "~" H 4400 3100 50  0001 C CNN
	1    4400 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	3650 3100 4250 3100
Wire Wire Line
	3650 3200 5900 3200
$Comp
L Device:Fuse F1
U 1 1 61D60C49
P 6100 3650
F 0 "F1" V 5903 3650 50  0000 C CNN
F 1 "3A Fuse" V 5994 3650 50  0000 C CNN
F 2 "" V 6030 3650 50  0001 C CNN
F 3 "~" H 6100 3650 50  0001 C CNN
	1    6100 3650
	0    1    1    0   
$EndComp
Connection ~ 6350 3650
$Comp
L Device:Fuse F2
U 1 1 61D658FA
P 6100 4350
F 0 "F2" V 5903 4350 50  0000 C CNN
F 1 "3A Fuse" V 5994 4350 50  0000 C CNN
F 2 "" V 6030 4350 50  0001 C CNN
F 3 "~" H 6100 4350 50  0001 C CNN
	1    6100 4350
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F3
U 1 1 61D6716F
P 6100 5050
F 0 "F3" V 5903 5050 50  0000 C CNN
F 1 "3A Fuse" V 5994 5050 50  0000 C CNN
F 2 "" V 6030 5050 50  0001 C CNN
F 3 "~" H 6100 5050 50  0001 C CNN
	1    6100 5050
	0    1    1    0   
$EndComp
Connection ~ 6350 4350
Connection ~ 6350 5050
Wire Wire Line
	5900 3200 5900 3650
Wire Wire Line
	5900 3850 5900 4350
Wire Wire Line
	5900 4550 5900 5050
Wire Wire Line
	4550 3100 6700 3100
Wire Wire Line
	6250 5050 6350 5050
Wire Wire Line
	6250 4350 6350 4350
Wire Wire Line
	6250 3650 6350 3650
Wire Wire Line
	5900 3650 5950 3650
Connection ~ 5900 3650
Wire Wire Line
	5900 3650 5900 3850
Wire Wire Line
	5950 4350 5900 4350
Connection ~ 5900 4350
Wire Wire Line
	5900 4350 5900 4550
Wire Wire Line
	5900 5050 5950 5050
Connection ~ 5900 5050
Wire Wire Line
	5900 5050 5900 5250
Wire Notes Line
	6850 3000 6850 5700
Wire Notes Line
	4750 5700 6850 5700
Wire Notes Line
	4750 3000 6850 3000
Wire Notes Line
	4750 3000 4750 5700
$Comp
L Connector:Conn_WallPlug_Earth J9
U 1 1 61D93AF3
P 2000 2900
F 0 "J9" H 2067 3225 50  0000 C CNN
F 1 "Conn_WallPlug_Earth" H 2067 3134 50  0000 C CNN
F 2 "" H 2400 2900 50  0001 C CNN
F 3 "~" H 2400 2900 50  0001 C CNN
	1    2000 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3100 2600 2800
Wire Wire Line
	2300 2800 2300 3000
Wire Wire Line
	2300 2800 2600 2800
Connection ~ 2300 2800
Connection ~ 2600 2800
Wire Wire Line
	2300 3200 2600 3200
Connection ~ 2600 3200
$Comp
L Device:Heater R1
U 1 1 61DB7929
P 8750 5000
F 0 "R1" H 8820 5046 50  0000 L CNN
F 1 "Heater(IGN1)" H 8820 4955 50  0000 L CNN
F 2 "" V 8680 5000 50  0001 C CNN
F 3 "~" H 8750 5000 50  0001 C CNN
	1    8750 5000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
