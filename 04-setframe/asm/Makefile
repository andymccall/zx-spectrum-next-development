# ----------------------------
# Makefile Options
# ----------------------------

SJASMPLUS       = sjasmplus
SJASMPLUS_FLAGS = --zxnext=cspect
RM              = rm -f
CSPECTEMU       = ${HOME}/development/tools/cspect/CSpect.exe
IMAGE           = ${HOME}/development/tools/sn-emulator/sn-emulator-22.10a.img

default: all

all:
	@echo "Building project..."
	mkdir -p bin
	mkdir -p lst
	mkdir -p sld
	$(SJASMPLUS) $(SJASMPLUS_FLAGS) --fullpath --outprefix=bin/ --lst=lst/setframe.lst --sld=sld/setframe.sld src/main.asm

clean:
	@echo "Cleaning project..."
	rm -rf bin
	rm -rf lst
	rm -rf sld
	rm -rf *.bin

run:
	@echo "Launching emulator..."
	MONO_IOMAP=all mono ${CSPECTEMU} -tv -zxnext -s28 -w4 -mmc=${IMAGE} bin/setframe.nex >/dev/null 2>&1