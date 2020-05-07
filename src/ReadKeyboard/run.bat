echo off

SET CWD=%CD%
cd ..\..\build\ReadKeyboard\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=ReadKeyboard.map -mmc=tbblue.mmc
cd  %CWD%