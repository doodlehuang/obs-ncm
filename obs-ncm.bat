@echo off
chcp 936&&cls
:searchpid
for /f %%i in ('powershell -c "echo (Get-Process cloudmusic | where MainWindowTitle -CMatch " - ").Id"') do set pid=%%i
if "%pid%"=="+" (echo 未找到目标进程！请打开网易云音乐并播放音乐，然后再试！&pause&goto searchpid)
echo 已自动找到目标进程（PID: %pid%）
:main
for /f "tokens=10 delims=," %%i in ('tasklist /v /FI "pid eq %pid%" /FO csv') do powershell -c "out-file -inputobject ('%%i' -split ' - ') -encoding utf8 titletest.txt"
goto main