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
	5000 4550 5100 4550
Wire Wire Line
	5000 5250 5100 5250
Wire Wire Line
	5700 5250 5800 5250
Wire Wire Line
	5800 4550 5700 4550
Wire Wire Line
	5800 3850 5700 3850
Wire Wire Line
	5000 5250 5000 5400
Wire Wire Line
	5000 5400 5400 5400
Wire Wire Line
	5800 5400 5800 5250
Connection ~ 5000 5250
Connection ~ 5800 5250
$Comp
L power:GNDREF #PWR?
U 1 1 61912711
P 5400 5450
F 0 "#PWR?" H 5400 5200 50  0001 C CNN
F 1 "GNDREF" H 5405 5277 50  0000 C CNN
F 2 "" H 5400 5450 50  0001 C CNN
F 3 "" H 5400 5450 50  0001 C CNN
	1    5400 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 5450 5400 5400
Connection ~ 5400 5400
Wire Wire Line
	5400 5400 5800 5400
$Comp
L Connector:Conn_01x02_Female J3
U 1 1 619132D9
P 7500 3550
F 0 "J3" H 7350 3800 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6750 3700 50  0000 L CNN
F 2 "" H 7500 3550 50  0001 C CNN
F 3 "~" H 7500 3550 50  0001 C CNN
	1    7500 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L_SV1
U 1 1 61915554
P 8550 3600
F 0 "L_SV1" H 8638 3646 50  0000 L CNN
F 1 "L_Core_Ferrite" H 8638 3555 50  0000 L CNN
F 2 "" H 8550 3600 50  0001 C CNN
F 3 "~" H 8550 3600 50  0001 C CNN
	1    8550 3600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 61917CA0
P 7600 3550
F 0 "J4" H 7700 3800 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7950 3700 50  0000 C CNN
F 2 "" H 7600 3550 50  0001 C CNN
F 3 "~" H 7600 3550 50  0001 C CNN
	1    7600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3550 8450 3450
Wire Wire Line
	8450 3450 8550 3450
Wire Wire Line
	8450 3650 8450 3750
Wire Wire Line
	8450 3750 8550 3750
$Comp
L Connector:Conn_01x02_Female J5
U 1 1 6191BE55
P 7500 4250
F 0 "J5" H 7350 4500 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6750 4400 50  0000 L CNN
F 2 "" H 7500 4250 50  0001 C CNN
F 3 "~" H 7500 4250 50  0001 C CNN
	1    7500 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L_SV2
U 1 1 6191BE5B
P 8550 4300
F 0 "L_SV2" H 8638 4346 50  0000 L CNN
F 1 "L_Core_Ferrite" H 8638 4255 50  0000 L CNN
F 2 "" H 8550 4300 50  0001 C CNN
F 3 "~" H 8550 4300 50  0001 C CNN
	1    8550 4300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 6191BE61
P 7600 4250
F 0 "J6" H 7700 4500 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7950 4400 50  0000 C CNN
F 2 "" H 7600 4250 50  0001 C CNN
F 3 "~" H 7600 4250 50  0001 C CNN
	1    7600 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4250 8450 4150
Wire Wire Line
	8450 4150 8550 4150
Wire Wire Line
	8450 4350 8450 4450
Wire Wire Line
	8450 4450 8550 4450
$Comp
L Connector:Conn_01x02_Female J7
U 1 1 61922F83
P 7500 4950
F 0 "J7" H 7350 5200 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6750 5100 50  0000 L CNN
F 2 "" H 7500 4950 50  0001 C CNN
F 3 "~" H 7500 4950 50  0001 C CNN
	1    7500 4950
	1    0    0    -1  
$EndComp
$Comp
L Device:L_Core_Ferrite L_IGN1
U 1 1 61922F89
P 8550 5000
F 0 "L_IGN1" H 8638 5046 50  0000 L CNN
F 1 "L_Core_Ferrite" H 8638 4955 50  0000 L CNN
F 2 "" H 8550 5000 50  0001 C CNN
F 3 "~" H 8550 5000 50  0001 C CNN
	1    8550 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 61922F8F
P 7600 4950
F 0 "J8" H 7700 5200 50  0000 C CNN
F 1 "Conn_01x02_Male" H 7950 5100 50  0000 C CNN
F 2 "" H 7600 4950 50  0001 C CNN
F 3 "~" H 7600 4950 50  0001 C CNN
	1    7600 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4950 8450 4850
Wire Wire Line
	8450 4850 8550 4850
Wire Wire Line
	8450 5050 8450 5150
Wire Wire Line
	8450 5150 8550 5150
Text Notes 7150 3250 0    50   ~ 0
barrel jack connectors
Wire Notes Line
	8400 3400 9200 3400
Wire Notes Line
	9200 3400 9200 3800
Wire Notes Line
	9200 3800 8400 3800
Wire Notes Line
	8400 3800 8400 3400
Wire Notes Line
	8400 4100 9200 4100
Wire Notes Line
	9200 4100 9200 4500
Wire Notes Line
	9200 4500 8400 4500
Wire Notes Line
	8400 4500 8400 4100
Wire Notes Line
	8400 4800 9200 4800
Wire Notes Line
	9200 4800 9200 5200
Wire Notes Line
	9200 5200 8400 5200
Wire Notes Line
	8400 5200 8400 4800
Text Notes 8350 3350 0    50   ~ 0
Solenoid Valve 1 (SV1)
Text Notes 8350 4050 0    50   ~ 0
Solenoid Valve 2 (SV2)
Text Notes 8500 4750 0    50   ~ 0
Igniter 1 (IGN1)
$Comp
L Connector:Conn_01x04_Female J1
U 1 1 61901B49
P 3750 4500
F 0 "J1" H 3350 4100 50  0000 C CNN
F 1 "Conn_01x04_Female" H 3350 4200 50  0000 C CNN
F 2 "" H 3750 4500 50  0001 C CNN
F 3 "~" H 3750 4500 50  0001 C CNN
	1    3750 4500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4800 4300 3950 4300
Wire Wire Line
	4800 4600 3950 4600
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 61903582
P 3650 4500
F 0 "J2" H 4050 4100 50  0000 R CNN
F 1 "Conn_01x04_Male" H 4300 4200 50  0000 R CNN
F 2 "" H 3650 4500 50  0001 C CNN
F 3 "~" H 3650 4500 50  0001 C CNN
	1    3650 4500
	-1   0    0    1   
$EndComp
Text GLabel 2800 4300 0    50   Input ~ 0
D10
Text GLabel 2800 4500 0    50   Input ~ 0
D9
Text GLabel 2800 4600 0    50   Input ~ 0
D8
$Comp
L power:GNDREF #PWR?
U 1 1 61904F0A
P 2450 4400
F 0 "#PWR?" H 2450 4150 50  0001 C CNN
F 1 "GNDREF" H 2455 4227 50  0000 C CNN
F 2 "" H 2450 4400 50  0001 C CNN
F 3 "" H 2450 4400 50  0001 C CNN
	1    2450 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4600 3450 4600
Wire Wire Line
	3450 4500 2800 4500
Wire Wire Line
	3450 4300 2800 4300
Text Label 3150 4300 0    50   ~ 0
Red
Text Label 3150 4400 0    50   ~ 0
Black
Text Label 3150 4500 0    50   ~ 0
Yellow
Text Label 3150 4600 0    50   ~ 0
Green
Text Label 4100 4300 0    50   ~ 0
SV1(Red)
Text Label 4100 4400 0    50   ~ 0
GND(Black)
Text Label 4100 4500 0    50   ~ 0
SV2(Yellow)
Wire Wire Line
	2450 4400 3450 4400
Text Label 4100 4600 0    50   ~ 0
IGN1(Green)
Wire Wire Line
	3950 4500 4900 4500
Wire Wire Line
	4900 4500 4900 4350
Wire Wire Line
	4900 4350 5100 4350
Wire Wire Line
	3950 4400 5000 4400
Wire Wire Line
	5000 4400 5000 4550
Wire Wire Line
	4800 5050 5100 5050
Text Notes 7350 7500 0    50   ~ 0
High Power Board
Text Notes 8150 7650 0    50   ~ 0
Nov 13th, 2021
Text Notes 10600 7650 0    50   ~ 0
Original
Text Notes 2350 4150 0    50   ~ 0
from sensor board\n<---
Wire Wire Line
	5000 4550 5000 5250
Connection ~ 5000 4550
Wire Wire Line
	5000 3850 5000 4400
Connection ~ 5000 4400
Wire Wire Line
	4800 3650 4800 4300
Wire Wire Line
	5800 3850 5800 4550
Wire Wire Line
	5800 4550 5800 5250
Connection ~ 5800 4550
$Comp
L Simulation_SPICE:DIODE D1
U 1 1 6195BBD2
P 6150 3500
F 0 "D1" V 6196 3420 50  0000 R CNN
F 1 "DIODE" V 6105 3420 50  0000 R CNN
F 2 "" H 6150 3500 50  0001 C CNN
F 3 "~" H 6150 3500 50  0001 C CNN
F 4 "Y" H 6150 3500 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 6150 3500 50  0001 L CNN "Spice_Primitive"
	1    6150 3500
	0    -1   -1   0   
$EndComp
$Comp
L Simulation_SPICE:DIODE D2
U 1 1 61965A6E
P 6150 4200
F 0 "D2" V 6196 4120 50  0000 R CNN
F 1 "DIODE" V 6105 4120 50  0000 R CNN
F 2 "" H 6150 4200 50  0001 C CNN
F 3 "~" H 6150 4200 50  0001 C CNN
F 4 "Y" H 6150 4200 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 6150 4200 50  0001 L CNN "Spice_Primitive"
	1    6150 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6150 3350 6500 3350
Wire Wire Line
	6500 4050 6150 4050
Connection ~ 6500 4050
$Comp
L Simulation_SPICE:DIODE D3
U 1 1 619769CF
P 6150 4900
F 0 "D3" V 6196 4820 50  0000 R CNN
F 1 "DIODE" V 6105 4820 50  0000 R CNN
F 2 "" H 6150 4900 50  0001 C CNN
F 3 "~" H 6150 4900 50  0001 C CNN
F 4 "Y" H 6150 4900 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 6150 4900 50  0001 L CNN "Spice_Primitive"
	1    6150 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6500 4950 6500 4750
Wire Wire Line
	6500 4750 6150 4750
Connection ~ 6500 4750
Wire Wire Line
	5700 3650 6150 3650
Wire Wire Line
	5700 4350 6150 4350
Wire Wire Line
	5700 5050 6150 5050
$Comp
L Connector:Conn_01x02_Female J10
U 1 1 61986204
P 3750 3100
F 0 "J10" H 3600 3350 50  0000 L CNN
F 1 "Conn_01x02_Female" H 3000 3250 50  0000 L CNN
F 2 "" H 3750 3100 50  0001 C CNN
F 3 "~" H 3750 3100 50  0001 C CNN
	1    3750 3100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 6198620A
P 3650 3100
F 0 "J9" H 3750 3350 50  0000 C CNN
F 1 "Conn_01x02_Male" H 4000 3250 50  0000 C CNN
F 2 "" H 3650 3100 50  0001 C CNN
F 3 "~" H 3650 3100 50  0001 C CNN
	1    3650 3100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3450 3100 2900 3100
Wire Wire Line
	3450 3200 2900 3200
Wire Wire Line
	3950 3200 5800 3200
Wire Wire Line
	5800 3200 5800 3850
Connection ~ 5800 3850
Wire Wire Line
	6500 3100 6500 3350
Wire Wire Line
	3950 3100 6500 3100
Connection ~ 6500 3350
Text GLabel 2900 3100 0    50   Input ~ 0
HIGH_PWR
$Comp
L power:GNDREF #PWR?
U 1 1 61993080
P 2900 3200
F 0 "#PWR?" H 2900 2950 50  0001 C CNN
F 1 "GNDREF" H 2905 3027 50  0000 C CNN
F 2 "" H 2900 3200 50  0001 C CNN
F 3 "" H 2900 3200 50  0001 C CNN
	1    2900 3200
	1    0    0    -1  
$EndComp
Text Label 4000 3100 0    50   ~ 0
+24V(Red)
Text Label 4000 3200 0    50   ~ 0
GND(Black)
Wire Wire Line
	5000 3850 5100 3850
Wire Wire Line
	4800 3650 5100 3650
$Comp
L Relay_SolidState:CPC1002N U1
U 1 1 619944A8
P 5400 3750
F 0 "U1" H 5400 4075 50  0000 C CNN
F 1 "CPC1002N" H 5400 3984 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 5200 3550 50  0001 L CIN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1002N.pdf/$file/CPC1002N.pdf" H 5400 3750 50  0001 L CNN
	1    5400 3750
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:CPC1002N U2
U 1 1 6199C847
P 5400 4450
F 0 "U2" H 5400 4775 50  0000 C CNN
F 1 "CPC1002N" H 5400 4684 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 5200 4250 50  0001 L CIN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1002N.pdf/$file/CPC1002N.pdf" H 5400 4450 50  0001 L CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:CPC1002N U3
U 1 1 6199EE2D
P 5400 5150
F 0 "U3" H 5400 5475 50  0000 C CNN
F 1 "CPC1002N" H 5400 5384 50  0000 C CNN
F 2 "Package_SO:SOP-4_3.8x4.1mm_P2.54mm" H 5200 4950 50  0001 L CIN
F 3 "http://www.ixysic.com/home/pdfs.nsf/www/CPC1002N.pdf/$file/CPC1002N.pdf" H 5400 5150 50  0001 L CNN
	1    5400 5150
	1    0    0    -1  
$EndComp
Text Notes 1950 3150 0    50   ~ 0
from ground station\ninput board\n<---
Wire Wire Line
	4800 4600 4800 5050
Wire Notes Line
	4650 3000 4650 5700
Wire Notes Line
	4650 5700 6650 5700
Wire Notes Line
	6650 5700 6650 3000
Wire Notes Line
	6650 3000 4650 3000
Wire Wire Line
	6500 3350 6500 3550
Wire Wire Line
	6500 4050 6500 4250
Wire Wire Line
	6150 3650 7300 3650
Connection ~ 6150 3650
Wire Wire Line
	6500 3550 7300 3550
Connection ~ 6500 3550
Wire Wire Line
	6500 3550 6500 4050
Wire Wire Line
	6500 4250 7300 4250
Connection ~ 6500 4250
Wire Wire Line
	6500 4250 6500 4750
Wire Wire Line
	6150 4350 7300 4350
Connection ~ 6150 4350
Wire Wire Line
	6500 4950 7300 4950
Wire Wire Line
	6150 5050 7300 5050
Connection ~ 6150 5050
Text Notes 5200 2950 0    50   ~ 0
High Power Board\n(has Solid State Relays)
Wire Wire Line
	7800 5050 8450 5050
Wire Wire Line
	7800 4950 8450 4950
Wire Wire Line
	7800 4350 8450 4350
Wire Wire Line
	7800 4250 8450 4250
Wire Wire Line
	7800 3650 8450 3650
Wire Wire Line
	7800 3550 8450 3550
$EndSCHEMATC
