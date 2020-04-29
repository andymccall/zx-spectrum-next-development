echo off
..\..\tools\sjasmplus .\Loops.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\Loops >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\Loops\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\Loops\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\Loops\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\Loops\tbblue.mmc Loops.nex
move Loops.nex ..\..\build\Loops\Loops.nex >nul 2>&1
move Loops.map ..\..\build\Loops\Loops.map >nul 2>&1
:doexit