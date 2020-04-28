echo off

SET CWD=%CD%
cd ..\..\build\Counter\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=Counter.map -mmc=tbblue.mmc
cd  %CWD%