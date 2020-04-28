echo off
..\..\tools\sjasmplus .\Counter.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\Counter >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\Counter\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\Counter\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\Counter\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\Counter\tbblue.mmc Counter.nex
move Counter.nex ..\..\build\Counter\Counter.nex >nul 2>&1
move Counter.map ..\..\build\Counter\Counter.map >nul 2>&1
:doexit