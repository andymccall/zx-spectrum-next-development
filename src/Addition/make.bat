echo off
..\..\tools\sjasmplus .\Addition.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\Addition >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\Addition\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\Addition\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\Addition\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\Addition\tbblue.mmc Addition.nex
move Addition.nex ..\..\build\Addition\Addition.nex >nul 2>&1
move Addition.map ..\..\build\Addition\Addition.map >nul 2>&1
:doexit