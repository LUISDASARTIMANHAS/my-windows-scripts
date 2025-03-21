@echo off
setlocal EnableDelayedExpansion
color 9F
git config http.postBuffer 524288000
git config http.lowSpeedTime 600

:menu
color 9F
cls
echo ===========================================================
echo  Desenvolvido por Luis Das Artimanhas e Pingobras S.A
echo  [1] Ver Configuracoes da Conta    [2]Conectar Git E Github
echo  [3] Auto Conectar Git E Github    [0] Sair
echo ===========================================================
echo.
echo USUARIO ATUAL: %email%
echo EMAIL ATUAL: %user%
echo.

set /p opcao=Insira a opcao: 

if "%opcao%"=="1" (    
	git config --list
	pause
    goto :menu

) else if "%opcao%"=="2" (
	echo.
	set /p user=Digite seu usuario do github: 
	set /p email=Digite seu email cadastrado no github: 
	echo ====================================================
	echo ..................Confirmar Dados:...................
	echo usuario:..........%user%
	echo email:............%email%
	echo ====================================================
	pause
	echo.
	git config --global user.name %user%
	git config --global user.email %email%
	echo Conectado ao Git e Github!!
	echo.

    pause
    goto :menu

)else if "%opcao%"=="3" (
	echo.
	echo AUTO CONFIGURAR GIT!
	git config --global user.name LUISDASARTIMANHAS
	git config --global user.email luisaugustodesouza785@gmail.com
	echo Conectado ao Git e Github!!
	git config --global user.name
	git config --global user.email
	echo.

    pause
    goto :menu

) else if "%opcao%"=="0" (
    echo ====================================================
	echo Desenvolvido por Luis Das Artimanhas e Pingobras S.A
	echo ====================================================
    echo Saindo...

    pause
    exit
) else (
    echo Opcao invalida. Tente novamente.

	pause
    goto :menu
)
