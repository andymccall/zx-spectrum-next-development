echo off

SET CWD=%CD%
cd ..\..\build\Graphics\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=Graphics.map -mmc=tbblue.mmc
cd  %CWD%