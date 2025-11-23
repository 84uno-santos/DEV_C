@echo off
REM ============================================
REM Script de configuração inicial do Git/GitHub
REM ============================================

echo Configurando GitHub...

REM Perguntar nome de usuário
set /p GITUSER=Digite seu nome de usuário do GitHub: 
git config --global user.name "%GITUSER%"

REM Perguntar email
set /p GITEMAIL=Digite seu email do GitHub: 
git config --global user.email "%GITEMAIL%"

REM Usar o diretório onde o BAT está salvo
set REPODIR=%~dp0
echo Diretório de trabalho definido como: %REPODIR%

cd /d "%REPODIR%"

REM Perguntar repositório remoto
set /p REMOTEURL=Digite a URL do repositório remoto (ex: https://github.com/usuario/repositorio.git): 

REM Inicializar repositório e adicionar remoto
git init
git remote add origin "%REMOTEURL%"

REM Definir branch principal como 'main'
git config --global init.defaultBranch main
git clone "%REMOTEURL%"

echo Configuração concluída!
pause