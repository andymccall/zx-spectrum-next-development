echo off

SET CWD=%CD%
cd ..\..\build\Addition\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=Addition.map -mmc=tbblue.mmc
cd  %CWD%