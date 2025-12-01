@ECHO OFF

REM ==========================================================================
REM Script desenvolvido por Bruno Santos em 2025.11.24 para acesso ao Drummer 
REM ==========================================================================

:MENU
CLS

ECHO .
ECHO ============================================
ECHO    Selecione a Versão que deseja iniciar:
ECHO ============================================
ECHO 1. Drummer Link 9
ECHO 2. Drummer 9
ECHO 3. Drummer Link 10
ECHO 4. Drummer 10
ECHO 5. Sair
ECHO .
SET /p OPCAO=Escolha uma opcao de (1 - 4):

IF /I "%OPCAO%"=="1" GOTO OPCAO1
IF /I "%OPCAO%"=="2" GOTO OPCAO2
IF /I "%OPCAO%"=="3" GOTO OPCAO3
IF /I "%OPCAO%"=="4" GOTO OPCAO4
IF /I "%OPCAO%"=="5" GOTO FIM
GOTO ERRO

:OPCAO1
START notepad.exe
GOTO MENU


xcopy \\10.20.2.42\DRUMMER c:\Drummer /i /d /z /y

xcopy \\10.20.2.42\DRUMMER\Translations c:\Drummer\Translations /i /d /z /y

xcopy \\10.20.2.42\DRUMMER\Help c:\Drummer\Help /i /d /z /y

xcopy \\10.20.2.42\DRUMMER\DataModel c:\Drummer\DataModel /i /d /z /y

REM xcopy \\10.20.2.42\DRUMMER\Client c:\Drummer\Client /i /d /z /y

cd /d c:\Drummer

start "" Drummer.exe