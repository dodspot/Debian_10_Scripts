@echo off

echo Keyfilemust be in same directory saved as key.ppk

set /p VARIABLE=enter host ip:

putty.exe -ssh root@%VARIABLE% -i key.ppk -m puttysetup.txt 