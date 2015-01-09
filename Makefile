PRG            = bandmate
OBJ            = $(PRG).o midi.o
MCU_TARGET     = atmega328p
OPTIMIZE       = -O2

DEFS           =
LIBS           = 
CC             = avr-gcc

override CFLAGS        = -g -Wall $(OPTIMIZE) -mmcu=$(MCU_TARGET) $(DEFS)
override LDFLAGS       = -Wl,-Map,$(PRG).map

OBJCOPY        = avr-objcopy
OBJDUMP        = avr-objdump

all: $(PRG).elf lst hex

$(PRG).elf: $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
	avr-size -C --mcu=$(MCU_TARGET) $(PRG).elf
main.o: main.c 

clean:
	rm -rf *.o $(PRG).elf *.eps *.png *.pdf *.bak 
	rm -rf *.lst *.map $(EXTRA_CLEAN_FILES)

lst:  $(PRG).lst

%.lst: %.elf
	$(OBJDUMP) -h -S $< > $@

# Rules for building the .text rom images

text: hex bin srec

hex:  $(PRG).hex
#bin:  $(PRG).bin
#srec: $(PRG).srec

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

#%.srec: %.elf
#	$(OBJCOPY) -j .text -j .data -O srec $< $@

#%.bin: %.elf
#	$(OBJCOPY) -j .text -j .data -O binary $< $@

# Rules for building the .eeprom rom images

#eeprom: ehex ebin esrec

#ehex:  $(PRG)_eeprom.hex
#ebin:  $(PRG)_eeprom.bin
#esrec: $(PRG)_eeprom.srec

#%_eeprom.hex: %.elf
#	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O ihex $< $@ \
#	|| { echo empty $@ not generated; exit 0; }

#%_eeprom.srec: %.elf
#	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O srec $< $@ \
#	|| { echo empty $@ not generated; exit 0; }

#%_eeprom.bin: %.elf
#	$(OBJCOPY) -j .eeprom --change-section-lma .eeprom=0 -O binary $< $@ \
#	|| { echo empty $@ not generated; exit 0; }

# Every thing below here is used by avr-libc's build system and can be ignored
# by the casual user.

#EXTRA_CLEAN_FILES       = *.hex *.bin *.srec

program:
	avrdude -p $(MCU_TARGET) -c jtag2isp -P usb -U flash:w:$(PRG).hex
#	avrdude -p atmega328p -c jtag2isp -P usb -U flash:w:$(PRG).hex
