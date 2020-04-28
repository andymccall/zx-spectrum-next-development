echo off

SET CWD=%CD%
cd ..\..\build\DisplayString\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=DisplayString.map -mmc=tbblue.mmc
cd  %CWD%