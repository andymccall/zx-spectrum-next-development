echo off

SET CWD=%CD%
cd ..\..\build\ChangeScreenColour\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=ChangeScreenColour.map -mmc=tbblue.mmc
cd  %CWD%