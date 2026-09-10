EESchema Schematic File Version 4
LIBS:usb2517_pinlevel-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
Sheet 1 1
Title "USB2517 Seven-Port 12V Self-Powered USB 2.0 Hub"
Comment1 "Pin-level connectivity; 2A-capable hardware, USB BC1.2 limit 1.5A"
$EndDescr
$Comp
L USB2517_JZX U1
U 1 1 1
P 8000 5000
F 0 "U1" H 8000 6900 60  0000 C CNN
F 1 "USB2517-JZX" H 8000 3000 60 0000 C CNN
F 2 "usb_hub:USB2517_JZX_QFN64_EP" H 8000 5000 50 0001 C CNN
	1    8000 5000
	1 0 0 -1
$EndComp
Text Label 6800 3600 0    35   ~ 0
USBDN1_DM
Text Label 6800 3420 0    35   ~ 0
USBDN1_DP
Text Label 6800 3240 0    35   ~ 0
USBDN2_DM
Text Label 6800 3060 0    35   ~ 0
USBDN2_DP
Text Label 6800 2880 0    35   ~ 0
VDDA33
Text Label 6800 2700 0    35   ~ 0
USBDN3_DM
Text Label 6800 2520 0    35   ~ 0
USBDN3_DP
Text Label 6800 2340 0    35   ~ 0
USBDN4_DM
Text Label 6800 2160 0    35   ~ 0
USBDN4_DP
Text Label 6800 1980 0    35   ~ 0
VDDA33
Text Label 6800 1800 0    35   ~ 0
USBDN5_DM
Text Label 6800 1620 0    35   ~ 0
USBDN5_DP
Text Label 6800 1440 0    35   ~ 0
CFG_SEL2
Text Label 6800 1260 0    35   ~ 0
LED_B7_N
Text Label 6800 1080 0    35   ~ 0
LED_A7_N
Text Label 6800 900 0    35   ~ 0
LED_B6_N
Text Label 7300 3100 0    35   ~ 0
LED_A6_N
Text Label 7390 3100 0    35   ~ 0
LED_B5_N
Text Label 7480 3100 0    35   ~ 0
TEST
Text Label 7570 3100 0    35   ~ 0
PRTPWR4
Text Label 7660 3100 0    35   ~ 0
OCS4_N
Text Label 7750 3100 0    35   ~ 0
OCS3_N
Text Label 7840 3100 0    35   ~ 0
PRTPWR3
Text Label 7930 3100 0    35   ~ 0
VDD33CR
Text Label 8020 3100 0    35   ~ 0
VDD18
Text Label 8110 3100 0    35   ~ 0
PRTPWR2
Text Label 8200 3100 0    35   ~ 0
OCS2_N
Text Label 8290 3100 0    35   ~ 0
OCS1_N
Text Label 8380 3100 0    35   ~ 0
PRTPWR1
Text Label 8470 3100 0    35   ~ 0
PRTPWR5
Text Label 8560 3100 0    35   ~ 0
LED_A5_N
Text Label 8650 3100 0    35   ~ 0
LED_B4_N
Text Label 9200 3700 0    35   ~ 0
LED_A4_N
Text Label 9200 3880 0    35   ~ 0
LED_B3_N_GANG_EN
Text Label 9200 4060 0    35   ~ 0
OCS5_N
Text Label 9200 4240 0    35   ~ 0
PRTPWR7
Text Label 9200 4420 0    35   ~ 0
OCS7_N
Text Label 9200 4600 0    35   ~ 0
OCS6_N
Text Label 9200 4780 0    35   ~ 0
PRTPWR6
Text Label 9200 4960 0    35   ~ 0
SDA_SMBDATA
Text Label 9200 5140 0    35   ~ 0
SCL_SMBCLK
Text Label 9200 5320 0    35   ~ 0
HS_IND_CFG_SEL1
Text Label 9200 5500 0    35   ~ 0
RESET_N
Text Label 9200 5680 0    35   ~ 0
VBUS_DET
Text Label 9200 5860 0    35   ~ 0
LOCAL_PWR
Text Label 9200 6040 0    35   ~ 0
VDD33
Text Label 9200 6220 0    35   ~ 0
LED_A3_N
Text Label 9200 6400 0    35   ~ 0
LED_B2_N_BOOST1
Text Label 8700 6900 0    35   ~ 0
LED_A2_N
Text Label 8610 6900 0    35   ~ 0
LED_B1_N_BOOST0
Text Label 8520 6900 0    35   ~ 0
LED_A1_N
Text Label 8430 6900 0    35   ~ 0
VDDA33
Text Label 8340 6900 0    35   ~ 0
USBDN6_DM
Text Label 8250 6900 0    35   ~ 0
USBDN6_DP
Text Label 8160 6900 0    35   ~ 0
USBDN7_DM
Text Label 8070 6900 0    35   ~ 0
USBDN7_DP
Text Label 7980 6900 0    35   ~ 0
VDDA33
Text Label 7890 6900 0    35   ~ 0
USBUP_DM
Text Label 7800 6900 0    35   ~ 0
USBUP_DP
Text Label 7710 6900 0    35   ~ 0
XTAL2
Text Label 7620 6900 0    35   ~ 0
XTAL1
Text Label 7530 6900 0    35   ~ 0
VDD18PLL
Text Label 7440 6900 0    35   ~ 0
RBIAS
Text Label 7350 6900 0    35   ~ 0
VDD33PLL
Text Notes 800 800 0 70 ~ 0
J1 MOLEX 480370001 UPSTREAM
Text Notes 800 1050 0 45 ~ 0
VBUS_UP, USBUP_DM, USBUP_DP, GND
Text Notes 800 2100 0 70 ~ 0
Y1 24MHz + C1/C2
Text Notes 800 2350 0 45 ~ 0
XTAL1, XTAL2, GND
Text Notes 800 3200 0 70 ~ 0
U2 AP2112K-3.3
Text Notes 800 3450 0 45 ~ 0
5V_LOCAL -> 3V3
Text Notes 800 4300 0 70 ~ 0
J9 PHOENIX 1715721
Text Notes 800 4550 0 45 ~ 0
12V_IN, GND
Text Notes 800 5500 0 70 ~ 0
U10 TPS548B22RVF
Text Notes 800 5750 0 45 ~ 0
12V_IN -> 5V_LOCAL, 15A
Text Notes 11200 700 0 70 ~ 0
J2-J8 GCT USB1086
Text Notes 11200 950 0 45 ~ 0
VBUS_P1..7, USB1..7 D+/D-, GND
Text Notes 11200 2500 0 70 ~ 0
U3-U9 AP22653
Text Notes 11200 2750 0 45 ~ 0
5V_LOCAL -> VBUS_P1..7; PRTPWR/OCS
Text Notes 11200 4300 0 70 ~ 0
D1-D8 USBLC6-2SC6
Text Notes 11200 4550 0 45 ~ 0
ESD on every USB pair
Text Notes 11200 5800 0 70 ~ 0
CONFIGURATION
Text Notes 11200 6050 0 45 ~ 0
CFG_SEL2=0, CFG_SEL1=0, CFG_SEL0=0; LOCAL_PWR=1
$EndSCHEMATC
