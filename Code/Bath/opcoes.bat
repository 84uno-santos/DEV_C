@ECHO OFF
:MENU
CLS
ECHO.
ECHO ==================================
ECHO     MENU DE TAREFAS
ECHO ==================================
ECHO 1. Abrir o Bloco de Notas
ECHO 2. Abrir a Calculadora
ECHO 3. Exibir Data e Hora
ECHO 4. Sair
ECHO.
SET /P OPCAO=Escolha uma opcao (1-4): 

IF /I "%OPCAO%"=="1" GOTO OPCAO1
IF /I "%OPCAO%"=="2" GOTO OPCAO2
IF /I "%OPCAO%"=="3" GOTO OPCAO3
IF /I "%OPCAO%"=="4" GOTO FIM
GOTO ERRO

:OPCAO1
START notepad.exe
GOTO MENU

:OPCAO2
START calc.exe
GOTO MENU

:OPCAO3
ECHO.
DATE /T
TIME /T
PAUSE
GOTO MENU

:ERRO
ECHO.
ECHO Opcao Invalida. Tente novamente.
PAUSE
GOTO MENU

:FIM
EXIT