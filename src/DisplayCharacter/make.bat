echo off
..\..\tools\sjasmplus .\DisplayCharacter.asm --zxnext=cspect

if ERRORLEVEL 1 goto doexit
mkdir ..\..\build\DisplayCharacter >nul 2>&1
copy /y ..\..\images\tbblue.mmc ..\..\build\DisplayCharacter\tbblue.mmc
copy /y ..\..\images\enNextZX.rom ..\..\build\DisplayCharacter\enNextZX.rom
copy /y ..\..\images\enNxtmmc.rom ..\..\build\DisplayCharacter\enNxtmmc.rom
..\..\tools\hdfmonkey put ..\..\build\DisplayCharacter\tbblue.mmc DisplayCharacter.nex
move DisplayCharacter.nex ..\..\build\DisplayCharacter\DisplayCharacter.nex >nul 2>&1
move DisplayCharacter.map ..\..\build\DisplayCharacter\DisplayCharacter.map >nul 2>&1
:doexit