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
L sensors:MCP9600 T1
U 1 1 61A47F9F
P 8800 4800
F 0 "T1" H 9528 4951 50  0000 L CNN
F 1 "MCP9600" H 9528 4860 50  0000 L CNN
F 2 "" H 9300 4950 50  0001 C CNN
F 3 "" H 9300 4950 50  0001 C CNN
	1    8800 4800
	1    0    0    -1  
$EndComp
Text Label 7050 4850 0    50   ~ 0
SDA(Red)
Text Label 7050 4950 0    50   ~ 0
SCL(Black)
Text Label 7050 5050 0    50   ~ 0
?(Yellow)
$Comp
L Connector:Conn_01x02_Female J11
U 1 1 61A4BA22
P 7650 4450
F 0 "J11" H 7350 4700 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6900 4600 50  0000 L CNN
F 2 "" H 7650 4450 50  0001 C CNN
F 3 "~" H 7650 4450 50  0001 C CNN
	1    7650 4450
	1    0    0    -1  
$EndComp
Text Label 7050 4450 0    50   ~ 0
5V(Red)
Text Label 7050 4550 0    50   ~ 0
GND(Black)
$Comp
L Connector:Conn_01x08_Male J4
U 1 1 61A54FC3
P 5250 1300
F 0 "J4" V 5400 1750 50  0000 C CNN
F 1 "Conn_01x08_Male" V 5300 2000 50  0000 C CNN
F 2 "" H 5250 1300 50  0001 C CNN
F 3 "~" H 5250 1300 50  0001 C CNN
	1    5250 1300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x06_Male J19
U 1 1 61A572F0
P 5200 6800
F 0 "J19" V 5350 6400 50  0000 R CNN
F 1 "Conn_01x06_Male" V 5250 6400 50  0000 R CNN
F 2 "" H 5200 6800 50  0001 C CNN
F 3 "~" H 5200 6800 50  0001 C CNN
	1    5200 6800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x06_Male J21
U 1 1 61A58D90
P 4050 6800
F 0 "J21" V 4200 7250 50  0000 R CNN
F 1 "Conn_01x06_Male" V 4100 7750 50  0000 R CNN
F 2 "" H 4050 6800 50  0001 C CNN
F 3 "~" H 4050 6800 50  0001 C CNN
	1    4050 6800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x08_Male J2
U 1 1 61A5C83D
P 4050 1300
F 0 "J2" V 4200 650 50  0000 C CNN
F 1 "Conn_01x08_Male" V 4100 500 50  0000 C CNN
F 2 "" H 4050 1300 50  0001 C CNN
F 3 "~" H 4050 1300 50  0001 C CNN
	1    4050 1300
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x08_Female J1
U 1 1 61A6B10B
P 4050 1200
F 0 "J1" V 3900 550 50  0000 C CNN
F 1 "Arduino(Female)" V 4000 350 50  0000 C CNN
F 2 "" H 4050 1200 50  0001 C CNN
F 3 "~" H 4050 1200 50  0001 C CNN
	1    4050 1200
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x08_Female J3
U 1 1 61A6C27C
P 5250 1200
F 0 "J3" V 5100 1650 50  0000 C CNN
F 1 "Arduino(Female)" V 5200 1900 50  0000 C CNN
F 2 "" H 5250 1200 50  0001 C CNN
F 3 "~" H 5250 1200 50  0001 C CNN
	1    5250 1200
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x06_Female J18
U 1 1 61A6DCB8
P 5200 6900
F 0 "J18" V 5150 6500 50  0000 R CNN
F 1 "Arduino(Female)" V 5050 6500 50  0000 R CNN
F 2 "" H 5200 6900 50  0001 C CNN
F 3 "~" H 5200 6900 50  0001 C CNN
	1    5200 6900
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x06_Female J20
U 1 1 61A708D4
P 4050 6900
F 0 "J20" V 4000 7350 50  0000 R CNN
F 1 "Arduino(Female)" V 3900 7800 50  0000 R CNN
F 2 "" H 4050 6900 50  0001 C CNN
F 3 "~" H 4050 6900 50  0001 C CNN
	1    4050 6900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 7100 4150 7250
Wire Wire Line
	4150 7250 4250 7250
Wire Wire Line
	4250 7250 4250 7100
$Comp
L power:GNDREF #PWR?
U 1 1 61A74328
P 4150 7350
F 0 "#PWR?" H 4150 7100 50  0001 C CNN
F 1 "GNDREF" H 4050 7200 50  0000 C CNN
F 2 "" H 4150 7350 50  0001 C CNN
F 3 "" H 4150 7350 50  0001 C CNN
	1    4150 7350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4150 7250 4150 7350
Connection ~ 4150 7250
$Comp
L Analog_ADC:ADS1115IDGS U1
U 1 1 61A37058
P 6200 2950
F 0 "U1" H 5900 3500 50  0000 C CNN
F 1 "ADS1115IDGS" H 5900 3400 50  0000 C CNN
F 2 "Package_SO:TSSOP-10_3x3mm_P0.5mm" H 6200 2450 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/ads1113.pdf" H 6150 2050 50  0001 C CNN
	1    6200 2950
	-1   0    0    -1  
$EndComp
$Comp
L sensors:M3021-000005-2K5PG P2
U 1 1 61A86FB4
P 9300 4350
F 0 "P2" H 10128 5026 50  0000 L CNN
F 1 "M3021-000005-2K5PG" H 10128 4935 50  0000 L CNN
F 2 "" H 9300 4350 50  0001 C CNN
F 3 "" H 9300 4350 50  0001 C CNN
	1    9300 4350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Female J9
U 1 1 61A97ECB
P 7650 3550
F 0 "J9" H 7350 3250 50  0000 L CNN
F 1 "Conn_01x04_Female" H 6900 3150 50  0000 L CNN
F 2 "" H 7650 3550 50  0001 C CNN
F 3 "~" H 7650 3550 50  0001 C CNN
	1    7650 3550
	1    0    0    -1  
$EndComp
Text Label 7000 3550 0    50   ~ 0
GND(Black)
Text Label 7000 3650 0    50   ~ 0
AIN2(Yellow)
Text Label 7000 3750 0    50   ~ 0
AIN3(Green)
$Comp
L Connector:Conn_01x04_Male J8
U 1 1 61A9948C
P 7750 3550
F 0 "J8" H 7950 3250 50  0000 L CNN
F 1 "Conn_01x04_Male" H 7800 3150 50  0000 L CNN
F 2 "" H 7750 3550 50  0001 C CNN
F 3 "~" H 7750 3550 50  0001 C CNN
	1    7750 3550
	1    0    0    -1  
$EndComp
Text Label 8200 3450 2    50   ~ 0
Red
Text Label 8200 3550 2    50   ~ 0
Black
Text Label 8200 3650 2    50   ~ 0
Yellow
Text Label 8200 3750 2    50   ~ 0
Green
Wire Wire Line
	7950 3450 8800 3450
Wire Wire Line
	7950 3550 8800 3550
Wire Wire Line
	8400 3650 8400 3750
Wire Wire Line
	8400 3750 8800 3750
Wire Wire Line
	7950 3650 8400 3650
Wire Wire Line
	8800 3650 8500 3650
Wire Wire Line
	8500 3650 8500 3800
Wire Wire Line
	8500 3800 8300 3800
Wire Wire Line
	8300 3800 8300 3750
Wire Wire Line
	8300 3750 7950 3750
Wire Wire Line
	6600 3150 6750 3150
Wire Wire Line
	6750 3150 6750 3750
Wire Wire Line
	6750 3750 7450 3750
Wire Wire Line
	6850 3650 6850 3050
Wire Wire Line
	6850 3050 6600 3050
Wire Wire Line
	6850 3650 7450 3650
Wire Wire Line
	6600 2950 6850 2950
Wire Wire Line
	6750 2850 6600 2850
$Comp
L Connector:Conn_01x03_Female J13
U 1 1 61A4BA16
P 7650 4950
F 0 "J13" H 7350 4800 50  0000 L CNN
F 1 "Conn_01x03_Female" H 6900 4700 50  0000 L CNN
F 2 "" H 7650 4950 50  0001 C CNN
F 3 "~" H 7650 4950 50  0001 C CNN
	1    7650 4950
	1    0    0    -1  
$EndComp
$Comp
L sensors:MCP9600 T2
U 1 1 61A49392
P 8800 6000
F 0 "T2" H 9528 6151 50  0000 L CNN
F 1 "MCP9600" H 9528 6060 50  0000 L CNN
F 2 "" H 9300 6150 50  0001 C CNN
F 3 "" H 9300 6150 50  0001 C CNN
	1    8800 6000
	1    0    0    -1  
$EndComp
Text Label 8200 4850 2    50   ~ 0
Red
Text Label 8200 4950 2    50   ~ 0
Black
Text Label 8200 5050 2    50   ~ 0
Yellow
$Comp
L Connector:Conn_01x02_Male J10
U 1 1 61AB93EA
P 7750 4450
F 0 "J10" H 8000 4700 50  0000 L CNN
F 1 "Conn_01x02_Male" H 7750 4600 50  0000 L CNN
F 2 "" H 7750 4450 50  0001 C CNN
F 3 "~" H 7750 4450 50  0001 C CNN
	1    7750 4450
	1    0    0    -1  
$EndComp
Text Label 8200 4450 2    50   ~ 0
Red
Text Label 8200 4550 2    50   ~ 0
Black
$Comp
L Connector:Conn_01x03_Male J12
U 1 1 61AB93F4
P 7750 4950
F 0 "J12" H 7950 4800 50  0000 L CNN
F 1 "Conn_01x03_Male" H 7750 4700 50  0000 L CNN
F 2 "" H 7750 4950 50  0001 C CNN
F 3 "~" H 7750 4950 50  0001 C CNN
	1    7750 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 4450 8500 4500
Wire Wire Line
	8500 4500 8750 4500
Wire Wire Line
	7950 4450 8500 4450
Wire Wire Line
	8600 5050 8600 4800
Wire Wire Line
	8600 4800 8750 4800
Wire Wire Line
	7950 5050 8600 5050
Wire Wire Line
	8500 4950 8500 4700
Wire Wire Line
	8500 4700 8750 4700
Wire Wire Line
	7950 4950 8500 4950
Wire Wire Line
	8750 4600 8400 4600
Wire Wire Line
	8400 4600 8400 4850
Wire Wire Line
	7950 4850 8400 4850
Wire Wire Line
	8300 4550 8300 5150
Wire Wire Line
	8300 5150 8750 5150
Wire Wire Line
	8750 5150 8750 4900
Wire Wire Line
	7950 4550 8300 4550
Text Label 7000 3450 0    50   ~ 0
5V(Red)
Text Label 7050 6050 0    50   ~ 0
SDA(Red)
Text Label 7050 6150 0    50   ~ 0
SCL(Black)
Text Label 7050 6250 0    50   ~ 0
?(Yellow)
$Comp
L Connector:Conn_01x02_Female J15
U 1 1 61AF18AA
P 7650 5650
F 0 "J15" H 7350 5900 50  0000 L CNN
F 1 "Conn_01x02_Female" H 6900 5800 50  0000 L CNN
F 2 "" H 7650 5650 50  0001 C CNN
F 3 "~" H 7650 5650 50  0001 C CNN
	1    7650 5650
	1    0    0    -1  
$EndComp
Text Label 7050 5650 0    50   ~ 0
5V(Red)
Text Label 7050 5750 0    50   ~ 0
GND(Black)
$Comp
L Connector:Conn_01x03_Female J17
U 1 1 61AF18B2
P 7650 6150
F 0 "J17" H 7350 6000 50  0000 L CNN
F 1 "Conn_01x03_Female" H 6900 5900 50  0000 L CNN
F 2 "" H 7650 6150 50  0001 C CNN
F 3 "~" H 7650 6150 50  0001 C CNN
	1    7650 6150
	1    0    0    -1  
$EndComp
Text Label 8200 6050 2    50   ~ 0
Red
Text Label 8200 6150 2    50   ~ 0
Black
Text Label 8200 6250 2    50   ~ 0
Yellow
$Comp
L Connector:Conn_01x02_Male J14
U 1 1 61AF18BB
P 7750 5650
F 0 "J14" H 8000 5900 50  0000 L CNN
F 1 "Conn_01x02_Male" H 7750 5800 50  0000 L CNN
F 2 "" H 7750 5650 50  0001 C CNN
F 3 "~" H 7750 5650 50  0001 C CNN
	1    7750 5650
	1    0    0    -1  
$EndComp
Text Label 8200 5650 2    50   ~ 0
Red
Text Label 8200 5750 2    50   ~ 0
Black
$Comp
L Connector:Conn_01x03_Male J16
U 1 1 61AF18C3
P 7750 6150
F 0 "J16" H 7950 6000 50  0000 L CNN
F 1 "Conn_01x03_Male" H 7750 5900 50  0000 L CNN
F 2 "" H 7750 6150 50  0001 C CNN
F 3 "~" H 7750 6150 50  0001 C CNN
	1    7750 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 5650 8500 5700
Wire Wire Line
	8500 5700 8750 5700
Wire Wire Line
	7950 5650 8500 5650
Wire Wire Line
	8600 6250 8600 6000
Wire Wire Line
	8600 6000 8750 6000
Wire Wire Line
	7950 6250 8600 6250
Wire Wire Line
	8500 6150 8500 5900
Wire Wire Line
	8500 5900 8750 5900
Wire Wire Line
	7950 6150 8500 6150
Wire Wire Line
	8750 5800 8400 5800
Wire Wire Line
	8400 5800 8400 6050
Wire Wire Line
	7950 6050 8400 6050
Wire Wire Line
	8300 5750 8300 6350
Wire Wire Line
	8300 6350 8750 6350
Wire Wire Line
	8750 6350 8750 6100
Wire Wire Line
	7950 5750 8300 5750
Wire Wire Line
	5800 2950 5450 2950
Wire Wire Line
	5550 3050 5800 3050
Wire Wire Line
	5550 4850 7450 4850
Wire Wire Line
	5550 4850 5550 6050
Wire Wire Line
	5550 6050 7450 6050
Wire Wire Line
	5450 6150 5450 4950
Wire Wire Line
	5450 6150 7450 6150
Wire Wire Line
	5450 4950 7450 4950
Wire Wire Line
	4050 5750 4050 6600
Wire Wire Line
	4050 5750 7450 5750
Wire Wire Line
	4050 4550 7450 4550
Connection ~ 4050 5750
Connection ~ 4050 4550
Wire Wire Line
	4150 4450 4150 4700
Wire Wire Line
	4150 4450 7450 4450
Wire Wire Line
	4150 5650 7450 5650
Connection ~ 4150 5650
Wire Wire Line
	4150 5650 4150 6600
Connection ~ 4150 4450
Wire Wire Line
	5800 3150 5750 3150
Text Notes 5950 3900 0    50   ~ 0
i2c addr: \n= hex 1001000\n= 0x01001000\n= 0x48
Text Notes 8850 5050 0    50   ~ 0
i2c addr = 0x66
Text Notes 8850 6250 0    50   ~ 0
i2c addr = 0x67
$Comp
L sensors:Turbine_Flow_Meter F1
U 1 1 61BD9364
P 1000 3950
F 0 "F1" H 963 4315 50  0000 C CNN
F 1 "Turbine_Flow_Meter" H 963 4224 50  0000 C CNN
F 2 "" H 1100 3650 50  0001 C CNN
F 3 "" H 1100 3650 50  0001 C CNN
	1    1000 3950
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J25
U 1 1 61BDCDA4
P 2100 3950
F 0 "J25" H 2300 3800 50  0000 L CNN
F 1 "Conn_01x03_Male" H 2100 3700 50  0000 L CNN
F 2 "" H 2100 3950 50  0001 C CNN
F 3 "~" H 2100 3950 50  0001 C CNN
	1    2100 3950
	-1   0    0    -1  
$EndComp
Text Label 1650 3850 0    50   ~ 0
Red
Text Label 1650 3950 0    50   ~ 0
Black
Text Label 1650 4050 0    50   ~ 0
Yellow
$Comp
L Connector:Conn_01x03_Female J24
U 1 1 61BE319B
P 2200 3950
F 0 "J24" H 1900 3800 50  0000 L CNN
F 1 "Conn_01x03_Female" H 1450 3700 50  0000 L CNN
F 2 "" H 2200 3950 50  0001 C CNN
F 3 "~" H 2200 3950 50  0001 C CNN
	1    2200 3950
	-1   0    0    -1  
$EndComp
Text Label 2750 3850 2    50   ~ 0
5V(Red)
Text Label 2850 3950 2    50   ~ 0
GND(Black)
Text Label 2900 4050 2    50   ~ 0
Pin2(Yellow)
Wire Wire Line
	1400 3850 1900 3850
Wire Wire Line
	1550 3950 1550 4050
Wire Wire Line
	1550 4050 1400 4050
Wire Wire Line
	1550 3950 1900 3950
Wire Wire Line
	1400 3950 1450 3950
Wire Wire Line
	1450 3950 1450 4150
Wire Wire Line
	1450 4150 1650 4150
Wire Wire Line
	1650 4150 1650 4050
Wire Wire Line
	1900 4050 1650 4050
$Comp
L sensors:Turbine_Flow_Meter F2
U 1 1 61C28E2B
P 1000 4800
F 0 "F2" H 963 5165 50  0000 C CNN
F 1 "Turbine_Flow_Meter" H 963 5074 50  0000 C CNN
F 2 "" H 1100 4500 50  0001 C CNN
F 3 "" H 1100 4500 50  0001 C CNN
	1    1000 4800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J23
U 1 1 61C28E31
P 2100 4800
F 0 "J23" H 2300 4650 50  0000 L CNN
F 1 "Conn_01x03_Male" H 2100 4550 50  0000 L CNN
F 2 "" H 2100 4800 50  0001 C CNN
F 3 "~" H 2100 4800 50  0001 C CNN
	1    2100 4800
	-1   0    0    -1  
$EndComp
Text Label 1650 4700 0    50   ~ 0
Red
Text Label 1650 4800 0    50   ~ 0
Black
Text Label 1650 4900 0    50   ~ 0
Yellow
$Comp
L Connector:Conn_01x03_Female J22
U 1 1 61C28E3A
P 2200 4800
F 0 "J22" H 1900 4650 50  0000 L CNN
F 1 "Conn_01x03_Female" H 1450 4550 50  0000 L CNN
F 2 "" H 2200 4800 50  0001 C CNN
F 3 "~" H 2200 4800 50  0001 C CNN
	1    2200 4800
	-1   0    0    -1  
$EndComp
Text Label 2750 4700 2    50   ~ 0
5V(Red)
Text Label 2850 4800 2    50   ~ 0
GND(Black)
Text Label 2900 4900 2    50   ~ 0
Pin3(Yellow)
Wire Wire Line
	1400 4700 1900 4700
Wire Wire Line
	1550 4800 1550 4900
Wire Wire Line
	1550 4900 1400 4900
Wire Wire Line
	1550 4800 1900 4800
Wire Wire Line
	1400 4800 1450 4800
Wire Wire Line
	1450 4800 1450 5000
Wire Wire Line
	1450 5000 1650 5000
Wire Wire Line
	1650 5000 1650 4900
Wire Wire Line
	1900 4900 1650 4900
Wire Wire Line
	2400 3950 4050 3950
Wire Wire Line
	4050 5750 4050 4800
Wire Wire Line
	2400 4800 4050 4800
Connection ~ 4050 4800
Wire Wire Line
	4050 4800 4050 4550
Connection ~ 4150 4700
Wire Wire Line
	4150 4700 4150 5650
Wire Wire Line
	2400 3850 3500 3850
$Comp
L Device:R R1
U 1 1 61C7A622
P 3500 4200
F 0 "R1" V 3400 4200 50  0000 C CNN
F 1 "10k" V 3300 4200 50  0000 C CNN
F 2 "" V 3430 4200 50  0001 C CNN
F 3 "~" H 3500 4200 50  0001 C CNN
	1    3500 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4050 3500 3850
Connection ~ 3500 3850
Wire Wire Line
	3500 3850 4150 3850
Wire Wire Line
	3250 4050 3250 4400
Wire Wire Line
	3250 4400 3500 4400
Wire Wire Line
	3500 4400 3500 4350
Wire Wire Line
	2400 4050 3250 4050
$Comp
L Device:R R2
U 1 1 61CB3891
P 3500 5050
F 0 "R2" V 3400 5050 50  0000 C CNN
F 1 "10k" V 3300 5050 50  0000 C CNN
F 2 "" V 3430 5050 50  0001 C CNN
F 3 "~" H 3500 5050 50  0001 C CNN
	1    3500 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4900 3500 4700
Wire Wire Line
	3250 4900 3250 5250
Wire Wire Line
	3250 5250 3500 5250
Wire Wire Line
	3500 5250 3500 5200
Wire Wire Line
	2400 4900 3250 4900
Wire Wire Line
	2400 4700 3500 4700
Connection ~ 3500 4700
Wire Wire Line
	3500 4700 4150 4700
Wire Wire Line
	4050 3950 4050 4550
Wire Wire Line
	4150 3850 4150 4450
Wire Wire Line
	4050 3550 5750 3550
Wire Wire Line
	5750 3150 5750 3550
Connection ~ 5750 3550
Wire Wire Line
	5750 3550 6200 3550
Wire Wire Line
	6200 3350 6200 3550
Connection ~ 6200 3550
Wire Wire Line
	6200 3550 7450 3550
Wire Wire Line
	4150 3450 7450 3450
Wire Wire Line
	6750 2300 7450 2300
Wire Wire Line
	7450 2400 6850 2400
Text Label 7000 2100 0    50   ~ 0
5V(Red)
Text Label 7000 2400 0    50   ~ 0
AIN3(Green)
Text Label 7000 2300 0    50   ~ 0
AIN2(Yellow)
Text Label 7000 2200 0    50   ~ 0
GND(Black)
$Comp
L Connector:Conn_01x04_Female J7
U 1 1 61B0808F
P 7650 2200
F 0 "J7" H 7350 1900 50  0000 L CNN
F 1 "Conn_01x04_Female" H 6900 1800 50  0000 L CNN
F 2 "" H 7650 2200 50  0001 C CNN
F 3 "~" H 7650 2200 50  0001 C CNN
	1    7650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 2400 7950 2400
Wire Wire Line
	8300 2450 8300 2400
Wire Wire Line
	8500 2450 8300 2450
Wire Wire Line
	8500 2300 8500 2450
Wire Wire Line
	8800 2300 8500 2300
Wire Wire Line
	7950 2300 8400 2300
Wire Wire Line
	8400 2400 8800 2400
Wire Wire Line
	8400 2300 8400 2400
Wire Wire Line
	7950 2200 8800 2200
Wire Wire Line
	7950 2100 8800 2100
Text Label 8200 2400 2    50   ~ 0
Green
Text Label 8200 2300 2    50   ~ 0
Yellow
Text Label 8200 2200 2    50   ~ 0
Black
Text Label 8200 2100 2    50   ~ 0
Red
$Comp
L Connector:Conn_01x04_Male J6
U 1 1 61AA8CA1
P 7750 2200
F 0 "J6" H 7950 1900 50  0000 L CNN
F 1 "Conn_01x04_Male" H 7800 1800 50  0000 L CNN
F 2 "" H 7750 2200 50  0001 C CNN
F 3 "~" H 7750 2200 50  0001 C CNN
	1    7750 2200
	1    0    0    -1  
$EndComp
$Comp
L sensors:M3021-000005-2K5PG P1
U 1 1 61AA8C8F
P 9300 3000
F 0 "P1" H 10128 3676 50  0000 L CNN
F 1 "M3021-000005-2K5PG" H 10128 3585 50  0000 L CNN
F 2 "" H 9300 3000 50  0001 C CNN
F 3 "" H 9300 3000 50  0001 C CNN
	1    9300 3000
	1    0    0    -1  
$EndComp
Text Label 6750 1800 0    50   ~ 0
SDA(D20)
Wire Wire Line
	6850 2400 6850 2950
Wire Wire Line
	6750 2300 6750 2850
Wire Wire Line
	4150 3850 4150 3450
Connection ~ 4150 3850
Connection ~ 4150 3450
Wire Wire Line
	4050 3550 4050 3950
Connection ~ 4050 3950
Wire Wire Line
	4150 2100 4150 3450
Wire Wire Line
	4150 2100 6200 2100
Wire Wire Line
	6200 2100 6200 2450
Connection ~ 6200 2100
Wire Wire Line
	6200 2100 7450 2100
Wire Wire Line
	4050 2200 4050 3550
Wire Wire Line
	4050 2200 7450 2200
Connection ~ 4050 3550
Wire Wire Line
	5550 4850 5550 3050
Connection ~ 5550 4850
Connection ~ 5550 3050
Wire Wire Line
	5450 2950 5450 4950
Connection ~ 5450 2950
Connection ~ 5450 4950
Wire Wire Line
	3500 5250 3700 5250
Connection ~ 3500 5250
Wire Wire Line
	3800 4400 3500 4400
Connection ~ 3500 4400
Text Notes 3550 3600 1    50   ~ 0
Pins D2 and D3 can have\nexternal interrupts, good \nfor counting pulses
Wire Wire Line
	5050 5050 7450 5050
Wire Wire Line
	4950 6250 7450 6250
NoConn ~ 3850 6600
NoConn ~ 3950 6600
NoConn ~ 4250 6600
NoConn ~ 4350 6600
NoConn ~ 5000 6600
NoConn ~ 5100 6600
NoConn ~ 5200 6600
NoConn ~ 5300 6600
NoConn ~ 5400 6600
NoConn ~ 5500 6600
Text GLabel 5550 1000 1    50   Input ~ 0
D0(RX0)
NoConn ~ 4850 1500
NoConn ~ 5450 1500
NoConn ~ 5550 1500
NoConn ~ 3650 1500
NoConn ~ 3750 1500
NoConn ~ 3850 1500
NoConn ~ 3950 1500
Text GLabel 5450 1000 1    50   Input ~ 0
D1(TX0)
Text GLabel 5350 1000 1    50   Input ~ 0
D2
Text GLabel 5250 1000 1    50   Input ~ 0
D3
Text GLabel 5150 1000 1    50   Input ~ 0
D4
Text GLabel 5050 1000 1    50   Input ~ 0
D5
Text GLabel 4950 1000 1    50   Input ~ 0
D6
Text GLabel 4850 1000 1    50   Input ~ 0
D7
Text GLabel 4350 1000 1    50   Input ~ 0
D8
Text GLabel 4250 1000 1    50   Input ~ 0
D9
Text GLabel 4150 1000 1    50   Input ~ 0
D10
Text GLabel 4050 1000 1    50   Input ~ 0
D11
Text GLabel 3950 1000 1    50   Input ~ 0
D12
Text GLabel 3850 1000 1    50   Input ~ 0
D13
Text GLabel 3650 1000 1    50   Input ~ 0
AREF
$Comp
L power:GNDREF #PWR?
U 1 1 61EB2FB5
P 3900 550
F 0 "#PWR?" H 3900 300 50  0001 C CNN
F 1 "GNDREF" H 3905 377 50  0000 C CNN
F 2 "" H 3900 550 50  0001 C CNN
F 3 "" H 3900 550 50  0001 C CNN
	1    3900 550 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1000 3750 500 
Wire Wire Line
	3750 500  3900 500 
Wire Wire Line
	3900 500  3900 550 
Text GLabel 5000 7100 3    50   Input ~ 0
A0
Text GLabel 5100 7100 3    50   Input ~ 0
A1
Text GLabel 5200 7100 3    50   Input ~ 0
A2
Text GLabel 5300 7100 3    50   Input ~ 0
A3
Text GLabel 5400 7100 3    50   Input ~ 0
A4
Text GLabel 5500 7100 3    50   Input ~ 0
A5
Text GLabel 4350 7100 3    50   Input ~ 0
VIN
Text GLabel 3850 7100 3    50   Input ~ 0
RESET
$Comp
L power:+5V #PWR?
U 1 1 61A75EDA
P 3450 7500
F 0 "#PWR?" H 3450 7350 50  0001 C CNN
F 1 "+5V" H 3465 7673 50  0000 C CNN
F 2 "" H 3450 7500 50  0001 C CNN
F 3 "" H 3450 7500 50  0001 C CNN
	1    3450 7500
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 61F05E93
P 3650 7500
F 0 "#PWR?" H 3650 7350 50  0001 C CNN
F 1 "+3.3V" H 3665 7673 50  0000 C CNN
F 2 "" H 3650 7500 50  0001 C CNN
F 3 "" H 3650 7500 50  0001 C CNN
	1    3650 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 7500 3950 7500
Wire Wire Line
	3950 7500 3950 7100
Wire Wire Line
	3450 7500 3450 7600
Wire Wire Line
	3450 7600 4050 7600
Wire Wire Line
	4050 7100 4050 7600
Wire Wire Line
	5450 1700 5450 2950
Wire Wire Line
	5550 1800 5550 3050
Wire Wire Line
	5150 2750 5150 1500
Wire Wire Line
	5150 2750 5800 2750
Wire Wire Line
	5050 1500 5050 5050
Wire Wire Line
	4950 6250 4950 1500
Wire Notes Line
	6650 6700 3150 6700
Wire Notes Line
	3150 1400 6650 1400
Wire Notes Line
	3150 1400 3150 6700
Wire Notes Line
	6650 1400 6650 6700
Text Notes 7350 7500 0    50   ~ 0
Resin Rocket Sensor Board
Text Notes 8200 7650 0    50   ~ 0
Nov 14th, 2021
Text Notes 10600 7650 0    50   ~ 0
A
NoConn ~ 4050 1500
Wire Wire Line
	4150 1500 4150 1550
Wire Wire Line
	4150 1550 2250 1550
$Comp
L Connector:Conn_01x04_Male J26
U 1 1 618FCEC3
P 2050 1650
F 0 "J26" H 2150 2000 50  0000 C CNN
F 1 "Conn_01x04_Male" H 2150 1900 50  0000 C CNN
F 2 "" H 2050 1650 50  0001 C CNN
F 3 "~" H 2050 1650 50  0001 C CNN
	1    2050 1650
	1    0    0    -1  
$EndComp
Connection ~ 4050 2200
Text Label 2350 1550 0    50   ~ 0
D10(Red)
Text Label 2350 1650 0    50   ~ 0
GND(Black)
Text Label 2350 1750 0    50   ~ 0
D9(Yellow)
Text Label 2350 1850 0    50   ~ 0
D8(Green)
Text Notes 1250 1800 0    50   ~ 0
goes to High Power\nCircuit Board\n<---
Text GLabel 7550 1000 1    50   Input ~ 0
D21(SCL)
Text GLabel 7450 1000 1    50   Input ~ 0
D20(SDA)
Text GLabel 7350 1000 1    50   Input ~ 0
D19(RX1)
Text GLabel 7250 1000 1    50   Input ~ 0
D18(TX1)
Text GLabel 7150 1000 1    50   Input ~ 0
D17
Text GLabel 6950 1000 1    50   Input ~ 0
D15
Text GLabel 6850 1000 1    50   Input ~ 0
D14
$Comp
L Connector:Conn_01x08_Female J26
U 1 1 61927238
P 7250 1200
F 0 "J26" V 7100 1650 50  0000 C CNN
F 1 "Arduino(Female)" V 7200 1900 50  0000 C CNN
F 2 "" H 7250 1200 50  0001 C CNN
F 3 "~" H 7250 1200 50  0001 C CNN
	1    7250 1200
	0    1    1    0   
$EndComp
Text GLabel 7050 1000 1    50   Input ~ 0
D16
Wire Wire Line
	7550 1500 7550 1700
Wire Wire Line
	7450 1500 7450 1800
Wire Wire Line
	5450 1700 7550 1700
Wire Wire Line
	5550 1800 7450 1800
Text Label 6750 1700 0    50   ~ 0
SCL(D21)
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 61B036AF
P 7550 1300
F 0 "J5" V 7600 1450 50  0000 R CNN
F 1 "2 Male Header Pins" V 7700 2100 50  0000 R CNN
F 2 "" H 7550 1300 50  0001 C CNN
F 3 "~" H 7550 1300 50  0001 C CNN
	1    7550 1300
	0    1    1    0   
$EndComp
Text Notes 7600 1700 0    50   ~ 0
Connect header pins to \nboard using external wires
Wire Wire Line
	4050 2200 4050 1650
Wire Wire Line
	4050 1650 2250 1650
Wire Wire Line
	2250 1750 4250 1750
Wire Wire Line
	4250 1500 4250 1750
Wire Wire Line
	5350 2000 3800 2000
Wire Wire Line
	3700 1900 5250 1900
Text Label 3550 4400 0    50   ~ 0
D3
Wire Wire Line
	3700 1900 3700 5250
Wire Wire Line
	4350 1500 4350 1850
Wire Wire Line
	2250 1850 4350 1850
Wire Wire Line
	5250 1500 5250 1900
Wire Wire Line
	5350 1500 5350 2000
Wire Wire Line
	3800 2000 3800 4400
Text Label 3550 5250 0    50   ~ 0
D2
Text Label 5450 3300 1    50   ~ 0
SCL
Text Label 5550 3300 1    50   ~ 0
SDA
Text Label 4050 3300 1    50   ~ 0
GND
Text Label 4150 3300 1    50   ~ 0
5V
Text Label 5200 5050 0    50   ~ 0
D5
Text Label 5200 6250 0    50   ~ 0
D6
Text Label 5200 2750 0    50   ~ 0
D4
$EndSCHEMATC
