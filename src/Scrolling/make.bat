echo off
..\..\tools\sjasmplus .\Scrolling.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\Scrolling >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\Scrolling\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\Scrolling\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\Scrolling\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\Scrolling\tbblue.mmc Scrolling.nex
move Scrolling.nex ..\..\build\Scrolling\Scrolling.nex >nul 2>&1
move Scrolling.map ..\..\build\Scrolling\Scrolling.map >nul 2>&1
:doexit