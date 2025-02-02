@echo off
:reiniciar
set /p porta=Digite a porta do servidor (8080):
netstat -ano | findstr :%porta%

echo

set /p taskid=Digite o LISTENING do servidor em numeros (LISTENING 26704): 

echo  

taskkill /f /pid %taskid%

echo ====================================================
echo Desenvolvido por Luis Das Artimanhas e Pingobras S.A
echo ====================================================


pause
cls
goto :reiniciar