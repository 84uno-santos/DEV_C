@echo off
setlocal enabledelayedexpansion
title Configurador de Ambiente Git

:: ============================================================
:: MENU DE ENTRADA DE DADOS
:: ============================================================
cls
echo.
echo ========================================================
echo       CONFIGURADOR AUTOMATICO DE REPOSITORIO GIT
echo ========================================================
echo.

:ASK_FOLDER
set /p "FOLDER_NAME=1. Digite o nome da PASTA a ser criada: "
if "%FOLDER_NAME%"=="" goto ASK_FOLDER

:ASK_USER
set /p "GIT_USER=2. Digite o NOME DE USUARIO (user.name): "
if "%GIT_USER%"=="" goto ASK_USER

:ASK_EMAIL
set /p "GIT_EMAIL=3. Digite o EMAIL (user.email): "
if "%GIT_EMAIL%"=="" goto ASK_EMAIL

:ASK_REPO
set /p "GIT_REPO=4. Digite a URL do REPOSITORIO (Clone URL): "
if "%GIT_REPO%"=="" goto ASK_REPO

echo.
echo ========================================================
echo PREPARANDO AMBIENTE...
echo ========================================================

:: ============================================================
:: 1. CRIACAO DA PASTA
:: ============================================================
if not exist "%FOLDER_NAME%" (
    echo [+] Criando pasta "%FOLDER_NAME%"...
    mkdir "%FOLDER_NAME%"
) else (
    echo [!] A pasta "%FOLDER_NAME%" ja existe.
    echo     O Git pode reclamar se ela nao estiver vazia.
)

:: Entra na pasta (o /d garante que funcione mesmo mudando de unidade de disco)
cd /d "%FOLDER_NAME%"

:: ============================================================
:: 2. LOCALIZAR GIT BASH
:: ============================================================
set "GIT_BASH=C:\Program Files\Git\git-bash.exe"

if not exist "%GIT_BASH%" (
    echo.
    echo [ERRO CRITICO] O Git Bash nao foi encontrado no caminho padrao:
    echo %GIT_BASH%
    echo.
    echo Pressione qualquer tecla para sair...
    pause >nul
    exit
)

:: ============================================================
:: 3. EXECUTAR GIT BASH
:: ============================================================
echo [+] Abrindo Git Bash e clonando...

:: Monta o comando para ser executado dentro do Bash
:: A sequência é: Clone no dir atual (.) -> Configura User -> Configura Email -> Mantém bash aberto
start "" "%GIT_BASH%" -c "echo '--- Clonando Repositorio ---'; git clone '%GIT_REPO%' .; echo '--- Configurando Credenciais Locais ---'; git config user.name '%GIT_USER%'; git config user.email '%GIT_EMAIL%'; echo '--- Concluido! ---'; exec bash"

:: Fecha a janela do CMD, pois o Git Bash ja abriu
exit
