@echo off
color 0A
setlocal EnableDelayedExpansion
:menu
cls
echo =================================================================
echo  Criado e Desenvolvido Por LUIS DAS ARTIMANHAS e PINGOBRAS S.A
echo   [1] Mostrar Arquivos        [2] Definir Local e arquivo
echo   [3] Deletar Arquivo         [4] Deletar Varios
echo                          [0] Sair
echo =================================================================
echo.
echo local Definido: %local%
echo Arquivo Definido: %arq%
echo.

set /p opcao=Insira a opcao: 

if "%opcao%"=="1" (    
	dir "%local%"

	pause
    	goto menu

) else if "%opcao%"=="2" (
	set /p local=Insira a localizacao do arquivo: 
	set /p arq=Insira o nome do arquivo: 

    	goto menu

) else if "%opcao%"=="3" (
	echo "%local%\%arq%" 
	pause 
	del /p /f "%local%\%arq%"
	dir "%local%"

    	pause
    	goto menu

) else if "%opcao%"=="4" (
	set /p arq=Insira o nome do arquivo: 
	del /p /f "%local%\*%arq%"
	dir "%local%"

    	pause
    	goto menu

) else if "%opcao%"=="0" (
	echo =================================================================
    	echo   Criado e Desenvolvido Por LUIS DAS ARTIMANHAS e PINGOBRAS S.A
	echo =================================================================
    	echo Saindo...

    	pause
	net stop sshd
    	exit

) else (
    	echo Opcao invalida. Tente novamente.

	pause
    	goto menu
)