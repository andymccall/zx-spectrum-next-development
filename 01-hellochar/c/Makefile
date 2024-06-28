# ----------------------------
# Makefile Options
# ----------------------------

Z88DK           = zcc
Z88DK_FLAGS     = -clib=classic -lndos -create-app -subtype=nex +zxn
RM              = rm -f
CSPECTEMU       = ${HOME}/development/tools/cspect/CSpect.exe
IMAGE           = ${HOME}/development/tools/sn-emulator/sn-emulator-22.10a.img

default: all

all:
	@echo "Building project..."
	mkdir -p bin
	$(Z88DK) $(Z88DK_FLAGS) src/main.c -o bin/hellochar.bin
	rm bin/hellochar.bin
	
clean:
	@echo "Cleaning project..."
	rm -rf bin

run:
	@echo "Launching emulator..."
	MONO_IOMAP=all mono ${CSPECTEMU} -tv -zxnext -s28 -w4 -mmc=${IMAGE} bin/hellochar.nex >/dev/null 2>&1