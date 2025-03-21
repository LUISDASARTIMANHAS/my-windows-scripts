@echo off
:: Verificar se o script está sendo executado como administrador
openfiles >nul 2>nul
if %errorlevel% neq 0 (
    echo Este script precisa ser executado como administrador.
    echo Tentando reiniciar com privilégios elevados...
    powershell -Command "Start-Process cmd -ArgumentList '/c, %~s0' -Verb runAs"
    exit /b
)

set "zip_file=C:\WhoIs.zip"
set "url=https://download.sysinternals.com/files/WhoIs.zip"

:: Determinar o nome da pasta de extração (sem a extensão .zip)
for %%f in ("%zip_file%") do set "folder_name=%%~nf"

set "target_folder=C:\%folder_name%"  :: Pasta de destino agora tem o nome do arquivo ZIP

:: Verificar se a pasta já existe
if exist "%target_folder%" (
    echo A pasta "%target_folder%" já existe. Nenhuma ação necessária.
    exit /b
)

:: Caso a pasta não exista, baixe o arquivo
echo A pasta "%target_folder%" não existe. Baixando o arquivo WhoIs.zip...
curl -o "%zip_file%" "%url%"

:: Extrair o arquivo ZIP para uma pasta com o nome do ZIP (sem a extensão)
echo Extraindo o arquivo WhoIs.zip para a pasta "%target_folder%"...
powershell -Command "Expand-Archive -Path '%zip_file%' -DestinationPath '%target_folder%'"

:: Adicionar a pasta ao PATH temporariamente para a sessão atual
setx PATH "%PATH%;%target_folder%"

:: Limpar arquivos temporários
del "%zip_file%"

echo Processo concluído com sucesso.
echo Agora você pode digitar 'whois' no CMD para usar a ferramenta.
pause
