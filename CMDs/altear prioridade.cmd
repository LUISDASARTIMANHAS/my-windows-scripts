@ECHO OFF
@rem possiveis valores: 
@rem Realtime
@rem Above normal
@rem Normal
@rem Below normal
@rem Low

set /p program=Programa que vai receber a prioridade (notepad) 
wmic process where name="%program%.exe" call setpriority "Realtime"
wmic process where name="explorer.exe" call setpriority "Realtime"
wmic process where name="code.exe" call setpriority "Realtime"
wmic process where name="streaming_client.exe" call setpriority "Realtime"
wmic process where name="steamwebhelper.exe" call setpriority "Realtime"
pause