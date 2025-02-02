@echo off
setlocal EnableDelayedExpansion
color 0A

@rem start para iniciar outras instancias
@rem /realtime para colocar prioridade alta
@rem /min para deixar minimizado e o terminal ficar livre

@rem automaticamente atualiza apps ao abrir com uma instancia aparte para deixar o terminal liberado
start "Auto Update" /realtime /min winget upgrade --all --silent

:menu
color 0A
set autoSaveLocal=H:\Meu Drive\Winget Backup
set autoSaveName=Winget-APLICATIVOS-E-PACOTES-DO-WINDOWS
cls
echo ===========================================================
echo  Desenvolvido por Luis Das Artimanhas e Pingobras S.A
echo  [1] Instalar App           [2] Desinstalar App
echo  [3] Listar Apps            [4] Mostrar info de App
echo  [5] Salvar Apps Instalados [6] Auto Salvar Apps   
echo  [7] Importar Apps          [8] Atualizar Apps
echo  [9] Auto Instalar APPs     [0] Sair
echo ===========================================================
echo.
echo LOCAL DE SALVAMENTO AUTOMATICO: %autoSaveLocal%
echo NOME DO SALVAMENTO AUTOMATICO: %autoSaveName%
echo.

set /p opcao=Insira a opcao: 

if "%opcao%"=="1" (
	set /p app=Insira o nome/ID do pacote que deseja instalar: 
	winget show %app%
	pause 
	winget install %app%

	pause
	goto :menu

) else if "%opcao%"=="2" (
	set /p app=Insira o nome/ID do pacote que deseja desinstalar: 
	winget show %app%
	pause
	start /realtime /min winget uninstall %app%

	pause
	goto :menu

) else if "%opcao%"=="3" (	
	winget list

	pause
	goto :menu

) else if "%opcao%"=="4" (
	set /p app=Insira o nome/ID do pacote que ver informacoes: 
	winget show %app%	

	pause
	goto :menu

) else if "%opcao%"=="5" (
	set /p saveFolder=Insira o caminho da pasta que deseja salvar "C:\Users": 
	set /p saveName=Insira o nome do salvamento "meuAutosave": 

	winget export -o "%saveFolder%\%saveName%.json"
	echo Arquivo salvo em "%saveFolder%\saveName.json"
	start "%saveName%" /max explorer.exe "%saveFolder%"

	pause
	goto :menu

) else if "%opcao%"=="6" ( 
	winget export -o "%autoSaveLocal%\%autoSaveName%.json"
	echo Arquivo salvo em "%autoSaveLocal%\%autoSaveName%.json"
	start "%autoSaveName%" explorer.exe "%autoSaveLocal%"

	pause
	goto :menu

) else if "%opcao%"=="7" ( 

	pause
	goto :menu

) else if "%opcao%"=="8" ( 
	start /realtime /max winget upgrade --all --silent

	pause
	goto :menu

) else if "%opcao%"=="9" ( 
	start /realtime /min winget install Rarlab.WinRAR 
	start /realtime /min winget install CrystalDewWorld.CrystalDiskInfo 
	start /realtime /min winget install MartiCliment.UniGetUI
	start /realtime /min winget install CrystalDewWorld.CrystalDiskInfo
	start /realtime /min winget install CPUID.HWMonitor

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