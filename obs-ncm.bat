@echo off
chcp 936&&cls
:searchpid
for /f %%i in ('powershell -c "echo (Get-Process cloudmusic | where MainWindowTitle -CMatch " - ").Id"') do set pid=%%i
if "%pid%"=="+" (echo δ�ҵ�Ŀ����̣�������������ֲ��������֣�Ȼ�����ԣ�&pause&goto searchpid)
echo ���Զ��ҵ�Ŀ����̣�PID: %pid%��
:main
for /f "tokens=10 delims=," %%i in ('tasklist /v /FI "pid eq %pid%" /FO csv') do powershell -c "out-file -inputobject ('%%i' -split ' - ') -encoding utf8 titletest.txt"
goto main