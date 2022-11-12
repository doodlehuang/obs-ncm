@echo off
for /f %%i in ('powershell -c "echo (Get-Process cloudmusic | where MainWindowTitle -CMatch " - ").Id"') do set pid=%%i
:main
for /f "tokens=10 delims=," %%i in ('tasklist /v /FI "pid eq %pid%" /FO csv') do powershell -c "out-file -inputobject '%%i' -encoding utf8 titletest.txt"
goto main