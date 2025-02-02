@ECHO OFF
:repeat
arp -a | findstr 192.168.6
timeout /t 30
goto :repeat 
