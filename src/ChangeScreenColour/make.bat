echo off
..\..\tools\sjasmplus .\ChangeScreenColour.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\ChangeScreenColour >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\ChangeScreenColour\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\ChangeScreenColour\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\ChangeScreenColour\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\ChangeScreenColour\tbblue.mmc ChangeScreenColour.nex
move ChangeScreenColour.nex ..\..\build\ChangeScreenColour\ChangeScreenColour.nex >nul 2>&1
move ChangeScreenColour.map ..\..\build\ChangeScreenColour\ChangeScreenColour.map >nul 2>&1
:doexit