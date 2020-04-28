echo off
..\..\tools\sjasmplus .\DisplayString.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\DisplayString >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\DisplayString\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\DisplayString\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\DisplayString\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\DisplayString\tbblue.mmc DisplayString.nex
move DisplayString.nex ..\..\build\DisplayString\DisplayString.nex >nul 2>&1
move DisplayString.map ..\..\build\DisplayString\DisplayString.map >nul 2>&1
:doexit