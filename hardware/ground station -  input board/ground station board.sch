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
$Comp
L Switch:SW_SPDT SW1
U 1 1 619086C4
P 7650 3700
F 0 "SW1" H 7650 3375 50  0000 C CNN
F 1 "SW_SPDT" H 7650 3466 50  0000 C CNN
F 2 "" H 7650 3700 50  0001 C CNN
F 3 "~" H 7650 3700 50  0001 C CNN
	1    7650 3700
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 6190C125
P 8000 3700
F 0 "D2" H 7993 3445 50  0000 C CNN
F 1 "GREEN_LED" H 7850 3550 50  0000 C CNN
F 2 "" H 8000 3700 50  0001 C CNN
F 3 "~" H 8000 3700 50  0001 C CNN
	1    8000 3700
	-1   0    0    1   
$EndComp
$Comp
L Switch:SW_Push_LED BTN1
U 1 1 6190FE63
P 7700 2300
F 0 "BTN1" V 7746 2547 50  0000 L CNN
F 1 "SW_Push_LED" V 7655 2547 50  0000 L CNN
F 2 "" H 7700 2600 50  0001 C CNN
F 3 "~" H 7700 2600 50  0001 C CNN
	1    7700 2300
	0    1    -1   0   
$EndComp
$Comp
L Switch:SW_Push BTN2
U 1 1 618FD4AB
P 7800 3000
F 0 "BTN2" V 7754 3148 50  0000 L CNN
F 1 "SW_Push" V 7845 3148 50  0000 L CNN
F 2 "" H 7800 3200 50  0001 C CNN
F 3 "~" H 7800 3200 50  0001 C CNN
	1    7800 3000
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x08_Female J1
U 1 1 6191E16D
P 3500 1400
F 0 "J1" V 3300 850 50  0000 C CNN
F 1 "Arduino(Female)" V 3400 600 50  0000 C CNN
F 2 "" H 3500 1400 50  0001 C CNN
F 3 "~" H 3500 1400 50  0001 C CNN
	1    3500 1400
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x08_Male J4
U 1 1 61922C40
P 4550 2050
F 0 "J4" V 4550 2450 50  0000 C CNN
F 1 "Conn_01x08_Male" V 4650 2750 50  0000 C CNN
F 2 "" H 4550 2050 50  0001 C CNN
F 3 "~" H 4550 2050 50  0001 C CNN
	1    4550 2050
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x08_Female J3
U 1 1 61922C46
P 4550 1950
F 0 "J3" V 4350 2350 50  0000 C CNN
F 1 "Arduino(Female)" V 4450 2700 50  0000 C CNN
F 2 "" H 4550 1950 50  0001 C CNN
F 3 "~" H 4550 1950 50  0001 C CNN
	1    4550 1950
	0    1    1    0   
$EndComp
NoConn ~ 4750 6150
NoConn ~ 4850 6150
NoConn ~ 4350 6150
NoConn ~ 4450 6150
NoConn ~ 4550 6150
$Comp
L Device:R R2
U 1 1 6192D9F7
P 8200 3900
F 0 "R2" H 8270 3946 50  0000 L CNN
F 1 "1k" H 8270 3855 50  0000 L CNN
F 2 "" V 8130 3900 50  0001 C CNN
F 3 "~" H 8200 3900 50  0001 C CNN
	1    8200 3900
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW2
U 1 1 61939750
P 1150 3250
F 0 "SW2" H 700 3300 50  0000 C CNN
F 1 "SW_SPDT" H 700 3200 50  0000 C CNN
F 2 "" H 1150 3250 50  0001 C CNN
F 3 "~" H 1150 3250 50  0001 C CNN
	1    1150 3250
	1    0    0    -1  
$EndComp
Text Label 7400 2800 0    50   ~ 0
+5V
Text Label 7400 2100 0    50   ~ 0
+5V
Text Label 7250 3600 0    50   ~ 0
+5V
Text Label 6650 3200 0    50   ~ 0
BACKUP_STOP
Text Label 6650 2650 0    50   ~ 0
STOP
Text Label 7350 3800 0    50   ~ 0
GND
$Comp
L Switch:SW_SPDT SW3
U 1 1 619430BD
P 1150 3650
F 0 "SW3" H 700 3700 50  0000 C CNN
F 1 "SW_SPDT" H 700 3600 50  0000 C CNN
F 2 "" H 1150 3650 50  0001 C CNN
F 3 "~" H 1150 3650 50  0001 C CNN
	1    1150 3650
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW4
U 1 1 61944E2F
P 1150 4050
F 0 "SW4" H 700 4100 50  0000 C CNN
F 1 "SW_SPDT" H 700 4000 50  0000 C CNN
F 2 "" H 1150 4050 50  0001 C CNN
F 3 "~" H 1150 4050 50  0001 C CNN
	1    1150 4050
	1    0    0    -1  
$EndComp
Text Label 1400 3150 0    50   ~ 0
+5V
Text Label 1400 3550 0    50   ~ 0
+5V
Text Label 1400 3950 0    50   ~ 0
+5V
Text Label 1400 3350 0    50   ~ 0
GND
Text Label 1400 3750 0    50   ~ 0
GND
Text Label 1400 4150 0    50   ~ 0
GND
Wire Wire Line
	1650 3550 1350 3550
Wire Wire Line
	1650 3150 1350 3150
Wire Wire Line
	1350 3350 1750 3350
Wire Wire Line
	1750 3750 1350 3750
NoConn ~ 4750 2250
NoConn ~ 4850 2250
Text GLabel 4850 1750 1    50   Input ~ 0
D0(RX0)
Text GLabel 4750 1750 1    50   Input ~ 0
D1(TX1)
Text GLabel 4650 1750 1    50   Input ~ 0
D2
Text GLabel 4550 1750 1    50   Input ~ 0
D3
Text GLabel 4450 1750 1    50   Input ~ 0
D4
Text GLabel 4350 1750 1    50   Input ~ 0
D5
Text GLabel 4250 1750 1    50   Input ~ 0
D6
Text GLabel 4150 1750 1    50   Input ~ 0
D7
Text GLabel 3800 1200 1    50   Input ~ 0
D8
Text GLabel 3700 1200 1    50   Input ~ 0
D9
Text GLabel 3600 1200 1    50   Input ~ 0
D10
Text GLabel 3500 1200 1    50   Input ~ 0
D11
Text GLabel 3400 1200 1    50   Input ~ 0
D12
Text GLabel 3300 1200 1    50   Input ~ 0
D13
Text GLabel 3100 1200 1    50   Input ~ 0
AREF
$Comp
L power:GNDREF #PWR?
U 1 1 6196DEF7
P 3350 750
F 0 "#PWR?" H 3350 500 50  0001 C CNN
F 1 "GNDREF" H 3355 577 50  0000 C CNN
F 2 "" H 3350 750 50  0001 C CNN
F 3 "" H 3350 750 50  0001 C CNN
	1    3350 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 750  3200 750 
Wire Wire Line
	3200 750  3200 1200
Text Notes 7350 7500 0    50   ~ 0
Ground Station Board
Text Notes 8150 7650 0    50   ~ 0
Nov 14th, 2021
Connection ~ 7700 2100
Wire Wire Line
	7700 2100 7800 2100
Wire Wire Line
	7800 2650 7800 2500
Text Label 6650 2550 0    50   ~ 0
ABORT_LED
Wire Wire Line
	950  3250 950  3450
Wire Wire Line
	950  3850 950  3650
Wire Wire Line
	1650 3150 1650 3550
Wire Wire Line
	1750 3350 1750 3750
Wire Wire Line
	1650 3950 1650 3550
Connection ~ 1650 3550
Wire Wire Line
	1750 3750 1750 4150
Connection ~ 1750 3750
Wire Wire Line
	1350 3950 1650 3950
Wire Wire Line
	1350 4150 1750 4150
Wire Wire Line
	7250 2100 7250 2800
Wire Wire Line
	7450 3800 7350 3800
Wire Wire Line
	7250 3600 7450 3600
Wire Wire Line
	7250 2100 7700 2100
Wire Wire Line
	7250 2800 7800 2800
Wire Wire Line
	950  4050 950  4250
Text Label 6300 4100 0    50   ~ 0
LAUNCH_MANL_OR_AUTO
Text Label 6300 6050 0    50   ~ 0
ARM_ROCKET
$Comp
L Device:R R3
U 1 1 61AAA291
P 3650 2600
F 0 "R3" H 3720 2646 50  0000 L CNN
F 1 "375" H 3720 2555 50  0000 L CNN
F 2 "" V 3580 2600 50  0001 C CNN
F 3 "~" H 3650 2600 50  0001 C CNN
	1    3650 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 61AAC90D
P 3250 2600
F 0 "R4" H 3320 2646 50  0000 L CNN
F 1 "1k" H 3320 2555 50  0000 L CNN
F 2 "" V 3180 2600 50  0001 C CNN
F 3 "~" H 3250 2600 50  0001 C CNN
	1    3250 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2750 3250 2850
Wire Wire Line
	3650 2750 3650 2800
Wire Wire Line
	3650 2450 3650 2400
Connection ~ 1650 3150
Wire Wire Line
	3250 3050 3250 3150
Wire Wire Line
	3650 3100 3650 3150
$Comp
L Device:Buzzer BZ4
U 1 1 61AAF4BD
P 3150 2950
F 0 "BZ4" H 3000 2900 50  0000 C CNN
F 1 "BUZZER" H 2900 3000 50  0000 C CNN
F 2 "" V 3125 3050 50  0001 C CNN
F 3 "~" V 3125 3050 50  0001 C CNN
	1    3150 2950
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J12
U 1 1 61985A40
P 7000 5300
F 0 "J12" H 7100 5400 50  0000 C CNN
F 1 "XT90_Male" H 7200 5500 50  0000 C CNN
F 2 "" H 7000 5300 50  0001 C CNN
F 3 "~" H 7000 5300 50  0001 C CNN
	1    7000 5300
	1    0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 61A1ECEC
P 8400 5500
F 0 "R5" H 8470 5546 50  0000 L CNN
F 1 "10k" H 8470 5455 50  0000 L CNN
F 2 "" V 8330 5500 50  0001 C CNN
F 3 "~" H 8400 5500 50  0001 C CNN
	1    8400 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 61A233D3
P 8250 6100
F 0 "R7" H 8320 6146 50  0000 L CNN
F 1 "10k" H 8320 6055 50  0000 L CNN
F 2 "" V 8180 6100 50  0001 C CNN
F 3 "~" H 8250 6100 50  0001 C CNN
	1    8250 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 61A21484
P 8400 5800
F 0 "R6" H 8470 5846 50  0000 L CNN
F 1 "10k" H 8470 5755 50  0000 L CNN
F 2 "" V 8330 5800 50  0001 C CNN
F 3 "~" H 8400 5800 50  0001 C CNN
	1    8400 5800
	1    0    0    -1  
$EndComp
Text Notes 5850 4800 0    50   ~ 0
24V Li-Ion Battery
Text Notes 9050 5450 0    50   ~ 0
--->\nto extension cord \nfor junction box
Wire Wire Line
	7300 5300 7300 5350
Wire Wire Line
	7200 5300 7300 5300
Wire Wire Line
	7300 5200 7200 5200
Wire Wire Line
	7300 5150 7300 5200
Wire Wire Line
	7350 5150 7300 5150
Text Notes 7200 4800 0    50   ~ 0
Key Switch\n(Enable/Disable High Power)
$Comp
L Switch:SW_SPST KEY_SW1
U 1 1 61977B1A
P 7550 5150
F 0 "KEY_SW1" H 7550 5385 50  0000 C CNN
F 1 "SW_SPST" H 7550 5294 50  0000 C CNN
F 2 "" H 7550 5150 50  0001 C CNN
F 3 "~" H 7550 5150 50  0001 C CNN
	1    7550 5150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J11
U 1 1 61A57F63
P 6900 5300
F 0 "J11" H 6850 5400 50  0000 C CNN
F 1 "XT90_Female" H 6650 5500 50  0000 C CNN
F 2 "" H 6900 5300 50  0001 C CNN
F 3 "~" H 6900 5300 50  0001 C CNN
	1    6900 5300
	1    0    0    1   
$EndComp
$Comp
L Device:Battery BT1
U 1 1 61A5BC9F
P 6000 5250
F 0 "BT1" H 6108 5296 50  0000 L CNN
F 1 "Battery" H 6108 5205 50  0000 L CNN
F 2 "" V 6000 5310 50  0001 C CNN
F 3 "~" V 6000 5310 50  0001 C CNN
	1    6000 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5450 6450 5450
Wire Wire Line
	6450 5450 6450 5300
Wire Wire Line
	6450 5300 6700 5300
Wire Wire Line
	6700 5200 6450 5200
Wire Wire Line
	6450 5200 6450 5050
Wire Wire Line
	6450 5050 6000 5050
$Comp
L Connector:Conn_01x08_Female J5
U 1 1 61A657C7
P 6300 1400
F 0 "J5" V 6100 1800 50  0000 C CNN
F 1 "Arduino(Female)" V 6200 2150 50  0000 C CNN
F 2 "" H 6300 1400 50  0001 C CNN
F 3 "~" H 6300 1400 50  0001 C CNN
	1    6300 1400
	0    1    1    0   
$EndComp
Text GLabel 6600 1200 1    50   Input ~ 0
D21(SCL)
Text GLabel 6500 1200 1    50   Input ~ 0
D20(SDA)
Text GLabel 6400 1200 1    50   Input ~ 0
D19(RX1)
Text GLabel 6300 1200 1    50   Input ~ 0
D18(TX1)
Text GLabel 6200 1200 1    50   Input ~ 0
D17
Text GLabel 6100 1200 1    50   Input ~ 0
D16
Text GLabel 6000 1200 1    50   Input ~ 0
D15
Text GLabel 5900 1200 1    50   Input ~ 0
D14
Text Label 3800 2150 1    50   ~ 0
ARMED_LED
Text Label 3700 2150 1    50   ~ 0
ARMED_BZR
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 61A9207B
P 6600 1500
F 0 "J6" V 6662 1544 50  0000 L CNN
F 1 "Conn_01x02_Male" V 6753 1544 50  0000 L CNN
F 2 "" H 6600 1500 50  0001 C CNN
F 3 "~" H 6600 1500 50  0001 C CNN
	1    6600 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 2250 4250 3450
Wire Wire Line
	4350 2250 4350 3850
Wire Wire Line
	4450 2250 4450 4250
Wire Wire Line
	950  3450 4250 3450
Wire Wire Line
	950  3850 4350 3850
Wire Wire Line
	950  4250 4450 4250
$Comp
L Device:LED D3
U 1 1 61AA941F
P 3650 2950
F 0 "D3" V 3597 3030 50  0000 L CNN
F 1 "YELLOW_LED" V 3688 3030 50  0000 L CNN
F 2 "" H 3650 2950 50  0001 C CNN
F 3 "~" H 3650 2950 50  0001 C CNN
	1    3650 2950
	0    1    1    0   
$EndComp
Text Notes 7600 2150 3    50   ~ 0
RED_LED
Wire Wire Line
	6500 3200 7800 3200
Wire Wire Line
	7250 3600 7250 2800
Connection ~ 7250 2800
$Comp
L Device:Fuse F1
U 1 1 61B05566
P 8000 5150
F 0 "F1" V 7803 5150 50  0000 C CNN
F 1 "7A Fuse" V 7894 5150 50  0000 C CNN
F 2 "" V 7930 5150 50  0001 C CNN
F 3 "~" H 8000 5150 50  0001 C CNN
	1    8000 5150
	0    1    1    0   
$EndComp
Wire Wire Line
	7750 5150 7850 5150
$Comp
L power:+24V #PWR?
U 1 1 61B14710
P 6000 5050
F 0 "#PWR?" H 6000 4900 50  0001 C CNN
F 1 "+24V" H 6015 5223 50  0000 C CNN
F 2 "" H 6000 5050 50  0001 C CNN
F 3 "" H 6000 5050 50  0001 C CNN
	1    6000 5050
	1    0    0    -1  
$EndComp
Connection ~ 6000 5050
$Comp
L power:GNDPWR #PWR?
U 1 1 61B1584F
P 6000 5450
F 0 "#PWR?" H 6000 5250 50  0001 C CNN
F 1 "GNDPWR" H 6004 5296 50  0000 C CNN
F 2 "" H 6000 5400 50  0001 C CNN
F 3 "" H 6000 5400 50  0001 C CNN
	1    6000 5450
	1    0    0    -1  
$EndComp
Connection ~ 6000 5450
Wire Wire Line
	8150 3700 8200 3700
Wire Wire Line
	8200 3700 8200 3750
Wire Wire Line
	8200 4050 8200 4100
$Comp
L Device:R R1
U 1 1 61B4105F
P 7450 2550
F 0 "R1" V 7243 2550 50  0000 C CNN
F 1 "1k" V 7334 2550 50  0000 C CNN
F 2 "" V 7380 2550 50  0001 C CNN
F 3 "~" H 7450 2550 50  0001 C CNN
	1    7450 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	7600 2550 7700 2550
Wire Wire Line
	7700 2550 7700 2500
NoConn ~ 4650 6150
Text GLabel 4850 6650 3    50   Input ~ 0
A5
Text GLabel 4750 6650 3    50   Input ~ 0
A4
Text GLabel 4650 6650 3    50   Input ~ 0
A3
Text GLabel 4550 6650 3    50   Input ~ 0
A2
Text GLabel 4450 6650 3    50   Input ~ 0
A1
Text GLabel 4350 6650 3    50   Input ~ 0
A0
$Comp
L Connector:Conn_01x06_Female J5
U 1 1 61929E6A
P 4550 6450
F 0 "J5" V 4450 6050 50  0000 R CNN
F 1 "Arduino(Female)" V 4350 6050 50  0000 R CNN
F 2 "" H 4550 6450 50  0001 C CNN
F 3 "~" H 4550 6450 50  0001 C CNN
	1    4550 6450
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x06_Male J6
U 1 1 61929E64
P 4550 6350
F 0 "J6" V 4650 5950 50  0000 R CNN
F 1 "Conn_01x06_Male" V 4550 5950 50  0000 R CNN
F 2 "" H 4550 6350 50  0001 C CNN
F 3 "~" H 4550 6350 50  0001 C CNN
	1    4550 6350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 2250 4650 4100
Wire Wire Line
	4650 4100 8200 4100
Text Notes 7150 5950 0    50   ~ 0
not a good idea to put these\nresistors onto the board, they\nhave a high voltage on them\nand might damage the 5V\nelectronics
Wire Wire Line
	4550 6050 8250 6050
Wire Wire Line
	3800 1700 3800 2400
Wire Wire Line
	3700 1700 3700 2300
Wire Wire Line
	6500 1700 6500 3200
Wire Wire Line
	6600 2650 7800 2650
Wire Wire Line
	6600 1700 6600 2650
Wire Wire Line
	3250 2300 3250 2450
Text Label 2050 4250 0    50   ~ 0
MANL_IGN1_CTRL
$Comp
L power:+5V #PWR?
U 1 1 61BA9D6B
P 10400 2200
F 0 "#PWR?" H 10400 2050 50  0001 C CNN
F 1 "+5V" H 10415 2373 50  0000 C CNN
F 2 "" H 10400 2200 50  0001 C CNN
F 3 "" H 10400 2200 50  0001 C CNN
	1    10400 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 61BAD70B
P 10400 4200
F 0 "#PWR?" H 10400 3950 50  0001 C CNN
F 1 "GNDREF" H 10405 4027 50  0000 C CNN
F 2 "" H 10400 4200 50  0001 C CNN
F 3 "" H 10400 4200 50  0001 C CNN
	1    10400 4200
	1    0    0    -1  
$EndComp
Text GLabel 9850 3950 2    50   Input ~ 0
D52
Text GLabel 9850 3850 2    50   Input ~ 0
D50
Text GLabel 9850 3750 2    50   Input ~ 0
D48
Text GLabel 9850 3650 2    50   Input ~ 0
D46
Text GLabel 9850 3550 2    50   Input ~ 0
D44
Text GLabel 9850 3450 2    50   Input ~ 0
D42
Text GLabel 9850 3350 2    50   Input ~ 0
D40
Text GLabel 9850 3250 2    50   Input ~ 0
D38
Text GLabel 9850 3150 2    50   Input ~ 0
D36
Text GLabel 9850 3050 2    50   Input ~ 0
D34
Text GLabel 9850 2950 2    50   Input ~ 0
D32
Text GLabel 9850 2850 2    50   Input ~ 0
D30
$Comp
L Connector:Conn_01x18_Female J7
U 1 1 61BB3B7C
P 9650 3150
F 0 "J7" V 9800 3100 50  0000 C CNN
F 1 "Arduino_DoubleRow_Left(Female)" V 9700 3100 50  0000 C CNN
F 2 "" H 9650 3150 50  0001 C CNN
F 3 "~" H 9650 3150 50  0001 C CNN
	1    9650 3150
	-1   0    0    -1  
$EndComp
Text GLabel 9850 2750 2    50   Input ~ 0
D28
Text GLabel 9850 2650 2    50   Input ~ 0
D26
Text GLabel 9850 2550 2    50   Input ~ 0
D24
Text GLabel 9850 2450 2    50   Input ~ 0
D22
Text GLabel 10750 3950 2    50   Input ~ 0
D52
Text GLabel 10750 3850 2    50   Input ~ 0
D50
Text GLabel 10750 3750 2    50   Input ~ 0
D48
Text GLabel 10750 3650 2    50   Input ~ 0
D46
Text GLabel 10750 3550 2    50   Input ~ 0
D44
Text GLabel 10750 3450 2    50   Input ~ 0
D42
Text GLabel 10750 3350 2    50   Input ~ 0
D40
Text GLabel 10750 3250 2    50   Input ~ 0
D38
Text GLabel 10750 3150 2    50   Input ~ 0
D36
Text GLabel 10750 3050 2    50   Input ~ 0
D34
Text GLabel 10750 2950 2    50   Input ~ 0
D32
Text GLabel 10750 2850 2    50   Input ~ 0
D30
$Comp
L Connector:Conn_01x18_Female J8
U 1 1 61BC77E0
P 10550 3150
F 0 "J8" V 10700 3100 50  0000 C CNN
F 1 "Arduino_DoubleRow_Right(Female)" V 10600 3100 50  0000 C CNN
F 2 "" H 10550 3150 50  0001 C CNN
F 3 "~" H 10550 3150 50  0001 C CNN
	1    10550 3150
	-1   0    0    -1  
$EndComp
Text GLabel 10750 2750 2    50   Input ~ 0
D28
Text GLabel 10750 2650 2    50   Input ~ 0
D26
Text GLabel 10750 2550 2    50   Input ~ 0
D24
Text GLabel 10750 2450 2    50   Input ~ 0
D22
Wire Wire Line
	10850 4150 10850 4050
Wire Wire Line
	10850 4050 10750 4050
Wire Wire Line
	10750 2350 10850 2350
Wire Wire Line
	10850 2350 10850 2250
Wire Wire Line
	10850 2250 10400 2250
Wire Wire Line
	10400 4150 10850 4150
Wire Wire Line
	10400 4150 10400 4200
Connection ~ 10400 4150
Wire Wire Line
	10400 2200 10400 2250
Wire Wire Line
	9950 4050 9950 4150
Wire Wire Line
	9950 4050 9850 4050
Wire Wire Line
	9950 4150 10400 4150
Connection ~ 10400 2250
Wire Wire Line
	9950 2350 9950 2250
Wire Wire Line
	9950 2350 9850 2350
Wire Wire Line
	9950 2250 10400 2250
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 61BF9BEC
P 10250 1900
F 0 "J9" H 10400 1700 50  0000 R CNN
F 1 "Conn_01x02_Male" H 10900 1600 50  0000 R CNN
F 2 "" H 10250 1900 50  0001 C CNN
F 3 "~" H 10250 1900 50  0001 C CNN
	1    10250 1900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10250 1700 10250 1600
Wire Wire Line
	10250 1600 10300 1600
Wire Wire Line
	10350 1600 10350 1700
$Comp
L power:+5V #PWR?
U 1 1 61BFFA85
P 5700 700
F 0 "#PWR?" H 5700 550 50  0001 C CNN
F 1 "+5V" H 5715 873 50  0000 C CNN
F 2 "" H 5700 700 50  0001 C CNN
F 3 "" H 5700 700 50  0001 C CNN
	1    5700 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 1550 10300 1600
Connection ~ 10300 1600
Wire Wire Line
	10300 1600 10350 1600
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 61C0F210
P 10350 4600
F 0 "J10" H 10450 4700 50  0000 L CNN
F 1 "Conn_01x02_Male" H 10300 4800 50  0000 L CNN
F 2 "" H 10350 4600 50  0001 C CNN
F 3 "~" H 10350 4600 50  0001 C CNN
	1    10350 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	10250 4800 10250 4900
Wire Wire Line
	10250 4900 10300 4900
Wire Wire Line
	10350 4900 10350 4800
$Comp
L power:GNDREF #PWR?
U 1 1 61C13E27
P 10300 4950
F 0 "#PWR?" H 10300 4700 50  0001 C CNN
F 1 "GNDREF" H 10305 4777 50  0000 C CNN
F 2 "" H 10300 4950 50  0001 C CNN
F 3 "" H 10300 4950 50  0001 C CNN
	1    10300 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 4900 10300 4950
Connection ~ 10300 4900
Wire Wire Line
	10300 4900 10350 4900
Wire Wire Line
	4150 2250 4150 2550
Wire Wire Line
	4150 2550 7300 2550
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 61C1B411
P 3800 1500
F 0 "J2" V 3850 1200 50  0000 L CNN
F 1 "Conn_01x02_Male" V 3950 650 50  0000 L CNN
F 2 "" H 3800 1500 50  0001 C CNN
F 3 "~" H 3800 1500 50  0001 C CNN
	1    3800 1500
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 4900 10250 4900
Connection ~ 10250 4900
Wire Wire Line
	10250 1600 9950 1600
Wire Wire Line
	9950 1600 9950 2100
Wire Wire Line
	9950 2100 7800 2100
Connection ~ 10250 1600
Connection ~ 7800 2100
Connection ~ 1750 4150
Wire Wire Line
	9950 4400 9950 4900
Wire Wire Line
	7350 3800 7350 4400
Wire Wire Line
	7350 4400 9950 4400
Wire Wire Line
	4550 2250 4550 6050
Wire Wire Line
	1650 3150 1650 700 
Wire Wire Line
	1650 700  5700 700 
Connection ~ 9950 1600
Wire Notes Line
	4950 2200 4950 6200
Wire Wire Line
	9950 4900 9950 6250
Wire Wire Line
	9950 6250 8550 6250
Connection ~ 9950 4900
Wire Wire Line
	6000 6250 8250 6250
Wire Wire Line
	1750 4150 1750 6950
$Comp
L power:GNDREF #PWR?
U 1 1 61C83E93
P 8400 6250
F 0 "#PWR?" H 8400 6000 50  0001 C CNN
F 1 "GNDREF" H 8405 6077 50  0000 C CNN
F 2 "" H 8400 6250 50  0001 C CNN
F 3 "" H 8400 6250 50  0001 C CNN
	1    8400 6250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 61A24DA8
P 8550 6100
F 0 "R8" H 8620 6146 50  0000 L CNN
F 1 "10k" H 8620 6055 50  0000 L CNN
F 2 "" V 8480 6100 50  0001 C CNN
F 3 "~" H 8550 6100 50  0001 C CNN
	1    8550 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 5950 8400 5950
Connection ~ 8400 5950
Wire Wire Line
	8400 5950 8550 5950
Wire Wire Line
	8250 6250 8400 6250
Connection ~ 8400 6250
Wire Wire Line
	8400 6250 8550 6250
Connection ~ 8550 6250
Connection ~ 8250 6250
Wire Wire Line
	6000 6250 6000 6950
$Comp
L power:GNDREF #PWR?
U 1 1 61CB7354
P 3950 7000
F 0 "#PWR?" H 3950 6750 50  0001 C CNN
F 1 "GNDREF" H 3955 6827 50  0000 C CNN
F 2 "" H 3950 7000 50  0001 C CNN
F 3 "" H 3950 7000 50  0001 C CNN
	1    3950 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6950 3950 7000
Wire Wire Line
	3950 6950 6000 6950
Connection ~ 5700 700 
Wire Wire Line
	5700 700  9950 700 
Wire Wire Line
	9950 700  9950 1600
Text Notes 10950 5450 1    50   ~ 0
----------------->\nconnect J10 sideways into end \nof Arduino Double Row\nof female headers for GND
Text Notes 10950 2000 1    50   ~ 0
<-----------------\nconnect J9 sideways into end \nof Arduino Double Row\nof female headers for 5V
Connection ~ 3250 3150
Wire Wire Line
	3800 2400 3650 2400
Wire Wire Line
	3700 2300 3250 2300
Text Label 2050 3850 0    50   ~ 0
MANL_SV2_CTRL
Text Label 2050 3450 0    50   ~ 0
MANL_SV1_CTRL
Wire Notes Line
	2950 2200 2950 6200
Wire Notes Line
	2950 2200 4950 2200
Wire Notes Line
	2950 6200 4950 6200
Connection ~ 3950 6950
Wire Wire Line
	1750 6950 3950 6950
Wire Wire Line
	1650 3150 3250 3150
Wire Wire Line
	3250 3150 3650 3150
$Comp
L Connector:Conn_WallPlug_Earth J13
U 1 1 61D2DEF4
P 9050 5050
F 0 "J13" H 9100 5400 50  0000 R CNN
F 1 "NEMA_5-15P(Male)" H 9100 5300 50  0000 R CNN
F 2 "" H 9450 5050 50  0001 C CNN
F 3 "~" H 9450 5050 50  0001 C CNN
	1    9050 5050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7300 5350 8400 5350
Connection ~ 8400 5350
Wire Wire Line
	8400 5350 8750 5350
Wire Wire Line
	8750 4950 8750 5150
Wire Wire Line
	8150 5150 8400 5150
Connection ~ 8750 5150
Wire Wire Line
	8400 5150 8400 5350
Connection ~ 8400 5150
Wire Wire Line
	8400 5150 8750 5150
Text Notes 10600 7650 0    50   ~ 0
A
Text Notes 2950 2050 0    50   ~ 0
connect header\nto board using\nexternal wires
$EndSCHEMATC
