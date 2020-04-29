echo off

SET CWD=%CD%
cd ..\..\build\Input\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=Input.map -mmc=tbblue.mmc
cd  %CWD%