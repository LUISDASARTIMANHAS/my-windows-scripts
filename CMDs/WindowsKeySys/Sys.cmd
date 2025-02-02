@echo off
set "saveFiles=%~dp0"

:menu
color 0A
cls
echo ===========================================================
echo  Desenvolvido por Luis Das Artimanhas e Pingobras S.A
echo  [1] Verificar Ativacao     [2] Ver key do Windows
echo  [3] Ativar Manualmente     [4] Ver Key do Windows Avanc.
echo  [5] Ativar Via CMD         [6] Desinstalar Key e ativacao
echo                      [0] Sair
echo ===========================================================
echo.


set /p opcao=Insira a opcao: 

if %opcao% == 1 (
    slmgr/xpr
    slmgr /dli
    slmgr /dti

    pause
    goto :menu

) else if %opcao% == 2 (
    wmic path softwareLicensingService get OA3xOriginalProductKey >> "%saveFiles%Windows-Original-Key.txt"
    start "%saveFiles%Windows-Original-Key.txt"

    pause
    goto :menu
) else if %opcao% == 3 (
    start SLUI 3

    pause
    goto :menu
) else if %opcao% == 4 (
    start regedit
    echo INSIRA HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform
    echo PROCURE POR BackupProductKeyDefault
    msg * /time:15 INSIRA HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform
    msg * /time:15 PROCURE POR BackupProductKeyDefault
    

    pause
    goto :menu
) else if %opcao% == 5 (
    set /p key=Insira a Key: 
    set /p key=Comfirme a Key: 
    slmgr /rearm
    slmgr /ipk %key%

    pause
    goto :menu
) else if %opcao% == 6 (
    slmgr /rearm
    slmgr /rilc
    slmgr /upk

    pause
    goto :menu
) else if %opcao% == 0 (
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