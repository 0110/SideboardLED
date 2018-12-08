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
### Arduino

In order to flash the software, select the following settings in Arduino:
* Tools | Board "Arduino NG or older"
* Tools | Processor "Atmega8"
* Sketch | Export Compiled Binary

In your arduino installtion, update the CPU frequency, as we are using the internal clock with 8Mhz.
Find the following file */hardware/arduino/avr/boards.txt*.
Inside the file, search for the chapter **Arduino NG or older w/ ATmega8** and add the following line:
```
atmegang.menu.cpu.atmega8.build.f_cpu=8000000L
```

### Avrdude
The flashing itself is done with **avrdude**:
```bash
avrdude -c AVRISPmkii -p m8 -u -U flash:w:SideboardLED.ino.standard.hex
```
Initial once the fuses must be burned:
```bash
avrdude -c avrispmkii -p atmega8 -U lfuse:w:0xe4:m -U hfuse:w:0xd9:m -U efuse:w:0xfc:m
```
