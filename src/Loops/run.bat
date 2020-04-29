echo off

SET CWD=%CD%
cd ..\..\build\Loops\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=Loops.map -mmc=tbblue.mmc
cd  %CWD%