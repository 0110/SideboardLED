# SideboardLED
Sprit: ollpe never dies

Another tiny project to control a WS2812 stripe via an Arduino based microcontroller.
## Hardware
* Atmega8
* 75 WS2812LEDs
* USB Serial converter

Programmer, e.g.:
* AVRISPmkii

## Software
In order to flash the software, select the following settings in Arduino:
* Tools | Board "Arduino NG or older"
* Tools | Processor "Atmega8"

The flashing itself is done with **avrdude**:
```bash
avrdude -c AVRISPmkii -p m8 -u -U flash:w:SideboardLED.ino.standard.hex
```
Initial once the fuses must be burned:
```bash
avrdude -c avrispmkii -p atmega8 -U lfuse:w:0xee:m -U hfuse:w:0xd9:m -U efuse:w:0xfc:m
```
