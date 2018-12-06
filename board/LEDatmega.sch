EESchema Schematic File Version 4
LIBS:LEDatmega-cache
EELAYER 26 0
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
L LEDatmega-rescue:ATMEGA8-16PU-IRatmega-rescue-IRatmega-rescue U1
U 1 1 5BB8CBE4
P 5650 2850
F 0 "U1" H 4900 4150 50  0000 L BNN
F 1 "ATMEGA8-16PU" H 6150 1400 50  0000 L BNN
F 2 "Package_DIP:DIP-28_W7.62mm_Socket" H 5650 2850 50  0001 C CIN
F 3 "" H 5650 2850 50  0001 C CNN
	1    5650 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3150 8450 3150
Wire Wire Line
	6650 3250 8450 3250
$Comp
L power:GND #PWR07
U 1 1 5BB8DC36
P 5650 4350
F 0 "#PWR07" H 5650 4100 50  0001 C CNN
F 1 "GND" H 5650 4200 50  0000 C CNN
F 2 "" H 5650 4350 50  0001 C CNN
F 3 "" H 5650 4350 50  0001 C CNN
	1    5650 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5BB8DDB6
P 8100 3650
F 0 "#PWR08" H 8100 3400 50  0001 C CNN
F 1 "GND" H 8100 3500 50  0000 C CNN
F 2 "" H 8100 3650 50  0001 C CNN
F 3 "" H 8100 3650 50  0001 C CNN
	1    8100 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3350 8100 3350
Wire Wire Line
	8100 3350 8100 3650
Wire Wire Line
	6650 2050 6950 2050
$Comp
L power:+5V #PWR06
U 1 1 5BB8DB94
P 5650 1350
F 0 "#PWR06" H 5650 1200 50  0001 C CNN
F 1 "+5V" H 5665 1523 50  0000 C CNN
F 2 "" H 5650 1350 50  0001 C CNN
F 3 "" H 5650 1350 50  0001 C CNN
	1    5650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1450 5650 1350
Text Notes 8250 2950 0    50   ~ 0
UART to other Microcontroller
$Comp
L Device:R R4
U 1 1 5BB8F969
P 4350 1750
F 0 "R4" V 4557 1750 50  0000 C CNN
F 1 "10k" V 4466 1750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 1750 50  0001 C CNN
F 3 "~" H 4350 1750 50  0001 C CNN
	1    4350 1750
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5BB8FA10
P 4100 1750
F 0 "#PWR04" H 4100 1600 50  0001 C CNN
F 1 "+5V" V 4115 1878 50  0000 L CNN
F 2 "" H 4100 1750 50  0001 C CNN
F 3 "" H 4100 1750 50  0001 C CNN
	1    4100 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4100 1750 4150 1750
Wire Wire Line
	4500 1750 4600 1750
Wire Wire Line
	4750 1950 4150 1950
Wire Wire Line
	4150 1950 4150 1750
Connection ~ 4150 1750
Wire Wire Line
	4150 1750 4200 1750
$Comp
L power:GND #PWR05
U 1 1 5BB9016E
P 4250 2150
F 0 "#PWR05" H 4250 1900 50  0001 C CNN
F 1 "GND" H 4250 2000 50  0000 C CNN
F 2 "" H 4250 2150 50  0001 C CNN
F 3 "" H 4250 2150 50  0001 C CNN
	1    4250 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 2150 4750 2150
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J2
U 1 1 5BB90674
P 3250 4900
F 0 "J2" H 3300 5217 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 3300 5126 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 3250 4900 50  0001 C CNN
F 3 "~" H 3250 4900 50  0001 C CNN
	1    3250 4900
	1    0    0    -1  
$EndComp
Text Notes 2950 4500 0    50   ~ 0
ISP (programming)
Text GLabel 3050 4800 0    50   Input ~ 0
MISO
Text GLabel 3050 4900 0    50   Input ~ 0
SCK
Text GLabel 3050 5000 0    50   Input ~ 0
RESET
Text GLabel 3550 4900 2    50   Input ~ 0
MOSI
$Comp
L power:GND #PWR03
U 1 1 5BB90910
P 3800 5000
F 0 "#PWR03" H 3800 4750 50  0001 C CNN
F 1 "GND" H 3800 4850 50  0000 C CNN
F 2 "" H 3800 5000 50  0001 C CNN
F 3 "" H 3800 5000 50  0001 C CNN
	1    3800 5000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 5000 3800 5000
Text GLabel 4350 1400 0    50   Input ~ 0
RESET
Wire Wire Line
	4350 1400 4600 1400
Wire Wire Line
	4600 1400 4600 1750
Connection ~ 4600 1750
Wire Wire Line
	4600 1750 4750 1750
Text GLabel 6650 2250 2    50   Input ~ 0
SCK
Text GLabel 6650 2150 2    50   Input ~ 0
MISO
Text GLabel 7000 1950 2    50   Input ~ 0
MOSI
Wire Wire Line
	7000 1950 6950 1950
Wire Wire Line
	6950 1950 6950 2050
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 5BC33359
P 8650 3150
F 0 "J1" H 8730 3142 50  0000 L CNN
F 1 "Conn_01x04" H 8730 3051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 8650 3150 50  0001 C CNN
F 3 "~" H 8650 3150 50  0001 C CNN
	1    8650 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5C083FE3
P 9500 2100
F 0 "#PWR09" H 9500 1950 50  0001 C CNN
F 1 "+5V" H 9515 2273 50  0000 C CNN
F 2 "" H 9500 2100 50  0001 C CNN
F 3 "" H 9500 2100 50  0001 C CNN
	1    9500 2100
	1    0    0    -1  
$EndComp
Text GLabel 6650 3450 2    50   Input ~ 0
LED
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5C084590
P 8850 2100
F 0 "J4" H 8956 2278 50  0000 C CNN
F 1 "Conn_01x02_Male" H 8956 2187 50  0000 C CNN
F 2 "" H 8850 2100 50  0001 C CNN
F 3 "~" H 8850 2100 50  0001 C CNN
	1    8850 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5C0846B5
P 9500 2200
F 0 "#PWR010" H 9500 1950 50  0001 C CNN
F 1 "GND" H 9500 2050 50  0000 C CNN
F 2 "" H 9500 2200 50  0001 C CNN
F 3 "" H 9500 2200 50  0001 C CNN
	1    9500 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 2100 9500 2100
Wire Wire Line
	9500 2200 9050 2200
$Comp
L Connector_Generic:Conn_01x03 J3
U 1 1 5C084B83
P 3150 3200
F 0 "J3" H 3230 3242 50  0000 L CNN
F 1 "Conn_01x03" H 3230 3151 50  0000 L CNN
F 2 "" H 3150 3200 50  0001 C CNN
F 3 "~" H 3150 3200 50  0001 C CNN
	1    3150 3200
	1    0    0    -1  
$EndComp
Text Notes 2750 2950 0    50   ~ 0
LED (WS2812)\n
Text GLabel 2950 3200 0    50   Input ~ 0
LED
$Comp
L power:GND #PWR02
U 1 1 5C084D38
P 2600 3300
F 0 "#PWR02" H 2600 3050 50  0001 C CNN
F 1 "GND" H 2600 3150 50  0000 C CNN
F 2 "" H 2600 3300 50  0001 C CNN
F 3 "" H 2600 3300 50  0001 C CNN
	1    2600 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5C084D61
P 2600 3100
F 0 "#PWR01" H 2600 2950 50  0001 C CNN
F 1 "+5V" V 2615 3228 50  0000 L CNN
F 2 "" H 2600 3100 50  0001 C CNN
F 3 "" H 2600 3100 50  0001 C CNN
	1    2600 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 3100 2950 3100
Wire Wire Line
	2950 3300 2600 3300
$EndSCHEMATC
