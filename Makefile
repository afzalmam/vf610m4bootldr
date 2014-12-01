
CC=$(CROSS_COMPILE)gcc
AS=$(CROSS_COMPILE)gcc
OBJCOPY=$(CROSS_COMPILE)objcopy

AFLAGS=-Wall -march=armv7-m -mthumb -msoft-float -mfpu=vfp -c
CFLAGS=-Wall -march=armv7-m -mthumb -msoft-float -mfpu=vfp -fPIC -c

all: vf610m4bootldr

vf610m4bootldr: vf610m4bootldr.o
	$(OBJCOPY) -O binary vf610m4bootldr.o vf610m4bootldr

%.o: %.S
	$(AS) $(AFLAGS) $<

.PHONY : clean
clean:
	-rm -f vf610m4bootldr vf610m4bootldr.o
