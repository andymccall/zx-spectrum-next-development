echo off
..\..\tools\sjasmplus .\Input.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\Input >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\Input\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\Input\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\Input\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\Input\tbblue.mmc Input.nex
move Input.nex ..\..\build\Input\Input.nex >nul 2>&1
move Input.map ..\..\build\Input\Input.map >nul 2>&1
:doexit