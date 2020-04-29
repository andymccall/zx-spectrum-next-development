echo off

SET CWD=%CD%
cd ..\..\build\Scrolling\
..\..\tools\CSpect\CSpect.exe -r -brk -w3 -zxnext -nextrom -map=Scrolling.map -mmc=tbblue.mmc
cd  %CWD%