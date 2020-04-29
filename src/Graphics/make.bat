echo off
..\..\tools\sjasmplus .\Graphics.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\Graphics >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\Graphics\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\Graphics\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\Graphics\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\Graphics\tbblue.mmc Graphics.nex
move Graphics.nex ..\..\build\Graphics\Graphics.nex >nul 2>&1
move Graphics.map ..\..\build\Graphics\Graphics.map >nul 2>&1
:doexit