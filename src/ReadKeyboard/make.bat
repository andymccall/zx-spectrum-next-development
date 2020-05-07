echo off
..\..\tools\sjasmplus .\ReadKeyboard.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\ReadKeyboard >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\ReadKeyboard\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\ReadKeyboard\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\ReadKeyboard\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\ReadKeyboard\tbblue.mmc ReadKeyboard.nex
move ReadKeyboard.nex ..\..\build\ReadKeyboard\ReadKeyboard.nex >nul 2>&1
move ReadKeyboard.map ..\..\build\ReadKeyboard\ReadKeyboard.map >nul 2>&1
:doexit