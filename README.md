To use:

Install Sublime Text 3

Install Package Control (https://packagecontrol.io/)
Install Terminus using Package Control (https://packagecontrol.io/packages/Terminus)

Manualy install z80asm (https://github.com/psbhlw/sublime-text-z80asm)

Install OpenAL for CSpect

Place the following files in images

enNextZX.rom
enNxtmmc.rom
tbblue.mcc

All available in the 32Mb image at (http://www.zxspectrumnext.online/cspect/)

Place the following files in tools

hdfmonkey.exe (https://github.com/gasman/hdfmonkey)
sjasmplus.exe (https://github.com/z00m128/sjasmplus)

Place the following files in tools\CSpect

CSpect.exe
ay.dll
ay8912.dll
OpenTK.dll
OpenTK.dll.config
Plugin.dll

Once setup, open the Sublime project.

Ctrl-Shift P and choose Terminus: Open Default Shell in Panel

Then cd in src/<project>/

You can then run make and run.  This will load the CSpect emulator where you can browse to the .nex file you've just created.  To delete the build, run clean.