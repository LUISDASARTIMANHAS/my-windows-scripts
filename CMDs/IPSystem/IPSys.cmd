@echo off
setlocal EnableDelayedExpansion
set "saveFiles=%~dp0"

:menu
setlocal EnableDelayedExpansion
color 0A
cls
echo ===========================================================
echo  Desenvolvido por Luis Das Artimanhas e Pingobras S.A
echo  [1] Pingar IP/Domain     [2] Buscar IP (LAN)
echo  [3] Rastrear rota        [4] Whois(Info sobre o IP/Domain)
echo  [5] Mapear Portas        [6] Mostrar Roteamento
echo  [7] Buscar e Moni. Porta [8] Executar tudo
echo                      [0] Sair
echo ===========================================================
echo.


set /p opcao=Insira a opcao: 

if %opcao% == 1 (
    set /p ender=Digite o endereco que deseja pingar."192.168.1.1" 
    set /p tempo=Digite a quantidade de vezes que deseja pingar."5" 

    echo DADOS:..............
    echo IP..................%ender%
    echo TEMPO...............%tempo%

    ping %ender% -n %tempo%
    echo salvando dados em %saveFiles%ping-logs-%ender%.txt
    ping %ender% -n %tempo% >> "%saveFiles%ping-logs-%ender%.txt"

    pause
    goto :menu

) else if %opcao% == 2 (
    set /p ip=Digite o ip que deseja buscar na LAN."192.168.1.1" 

    echo O Buscar Retornou: 
    ipconfig | findstr %ip%

    pause
    goto :menu
) else if %opcao% == 3 (
    set /p rastrearRota=Digite o ip que deseja rastrear."192.168.1.1" 

    echo O Rastrear Retornou: 
    tracert %rastrearRota%
    echo salvando dados em %saveFiles%tracert-logs-%rastrearRota%.txt
    tracert %rastrearRota% >> "%saveFiles%tracert-logs-%rastrearRota%.txt"

    pause
    goto :menu
) else if %opcao% == 4 (
    set /p whoisIP=Digite o ip que deseja obter informacoes."192.168.1.1" 

    echo O Whois Retornou: 
    Whois %whoisIP% -v
    echo salvando dados em %saveFiles%whois-logs.txt
    Whois %whoisIP% -v >> "%saveFiles%whois-logs.txt"

    pause
    goto :menu
) else if %opcao% == 5 (

    netstat -ano -f
    echo salvando dados em %saveFiles%network-stats.txt
    netstat -ano -f >> "%saveFiles%network-stats.txt"

    pause
    goto :menu
) else if %opcao% == 6 (

    netstat -f -r
    echo salvando dados em %saveFiles%table-routes.txt
    netstat -f -r >> "%saveFiles%table-routes.txt"

    pause
    goto :menu
)  else if %opcao% == 7 (
    set /p port=Digite a porta que deseja buscar ou monitorar. "8080" 
    echo Buscando E Monitorando %port%. Prescione CTRL + C para parar.
    netstat -ano 10 | findstr :%port%
    
    pause
    goto :menu
) else if %opcao% == 8 (
    set /p ender=Digite o endereco."192.168.1.1" ou "google.com" 
    set /p ender=Confirme o endereco. 

    echo ===== ping ===== >> "%saveFiles%all-search.txt"
    ping %ender% -n 10
    echo salvando dados em %saveFiles%all-search.txt
    ping %ender% -n 10 >> "%saveFiles%all-search.txt"
    
    echo. >> "%saveFiles%all-search.txt"
    echo ===== Rastreamento de Rota ===== >> "%saveFiles%all-search.txt"
    tracert %ender%
    echo salvando dados em %saveFiles%all-search.txt
    tracert %ender% >> "%saveFiles%all-search.txt"
    
    echo. >> "%saveFiles%all-search.txt"
    echo ===== Whois ===== >> "%saveFiles%all-search.txt"
    Whois %ender% -v
    echo salvando dados em %saveFiles%all-search.txt
    Whois %ender% -v >> "%saveFiles%all-search.txt"
    
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
