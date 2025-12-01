@echo off
REM ===========================================================================
REM  Script desenvolvido por Bruno Santos em 2025.11.24 para acesso ao Drummer 
REM ===========================================================================

TITLE Drummer - Atualizador e Launcher

REM MODE CON: COLS=50 LINES=40

ECHO Verificando conexao com o servidor...
REM Tenta listar a pasta jogando o resultado no "lixo" (>nul)
DIR "\\10.20.2.42\drummer" >nul 2>&1

REM Verifica o codigo de erro da tentativa acima (0 = Sucesso, 1 = Erro)
IF %ERRORLEVEL% EQU 0 (
    ECHO Acesso confirmado.
    TIMEOUT /T 2 >nul /NOBREAK
REM Drummer9
SET Src9=\\10.20.2.42\DRUMMER
SET Dst9=c:\Drummer
SET Src9trans=\\10.20.2.42\DRUMMER\Translations
SET Dst9trans=c:\Drummer\Translations
SET Src9help=\\10.20.2.42\DRUMMER\Help
SET Dst9help=c:\Drummer\Help
SET Src9data=\\10.20.2.42\DRUMMER\DataModel
SET Dst9data=c:\Drummer\DataModel
REM SET Src9client=\\10.20.2.42\DRUMMER\Client
REM SET Dst9client=c:\Drummer\Client

REM Drummer10
SET Src10=\\10.20.2.42\DRUMMER_10
SET Dst10=c:\Drummer_10
SET Src10trans=\\10.20.2.42\DRUMMER_10\Translations
SET Dst10trans=c:\Drummer_10\Translations
SET Src10help=\\10.20.2.42\DRUMMER_10\Help
SET Dst10help=c:\Drummer_10\Help
SET Src10data=\\10.20.2.42\DRUMMER_10\DataModel
SET Dst10data=c:\Drummer_10\DataModel
REM SET Src10client=\\10.20.2.42\DRUMMER_10\Client
REM SET Dst10client=c:\Drummer_10\Client

SET flag=/i /d /z /y
) ELSE (
    ECHO FALHA: Nao foi possivel acessar a pasta de rede.
    TIMEOUT /T 10
    GOTO EOF

)
COLOR 0A
:MENU
CLS
ECHO .
ECHO  _____                                                                  _____ 
ECHO ( ___ )                                                                ( ___ ) 
ECHO  |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | 
ECHO  |   | ██████╗  ██████╗ ██╗   ██╗███╗   ███╗███╗   ███╗███████╗██████╗  |   | 
ECHO  |   | ██ ╔══██╗██╔══██╗██║   ██║████╗ ████║████╗ ████║██╔════╝██╔══██╗ |   | 
ECHO  |   | ██ ║  ██║██████╔╝██║   ██║██╔████╔██║██╔████╔██║█████╗  ██████╔╝ |   | 
ECHO  |   | ██ ║  ██║██╔══██╗██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  ██╔══██╗ |   | 
ECHO  |   | ██████╔╝ ██║  ██║╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗██║  ██║ |   | 
ECHO  |   | ╚═════╝  ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝ |   | 
ECHO  |   |                                                                  |   |
ECHO  |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| 
ECHO (_____)                                                                (_____)
ECHO ===============================================
ECHO ||                 DRUMMER                   ||
ECHO ===============================================
ECHO ||      Selecione a Versao desejada          ||
ECHO ||   Digitando o numero que esta entre [ ]   ||
ECHO ===============================================
ECHO ||                                           ||
ECHO ||   Versao  9                               ||
ECHO ||        |______[1] Drummer Link            ||
ECHO ||        |______[2] Drummer                 ||
ECHO ||                                           ||
ECHO ||-------------------------------------------||
ECHO ||                                           ||
ECHO ||   Versao 10                               ||
ECHO ||        |______[3] Drummer Link            ||
ECHO ||        |______[4] Drummer                 ||
ECHO ||                                           || 
ECHO ||-------------------------------------------||
ECHO ||                                           ||
ECHO ||               [5] Sair                    ||
ECHO ||                                           || 
ECHO ===============================================
ECHO .
SET /p OPCAO=Escolha uma opcao de (1 - 5):

IF /i "%OPCAO%"=="1" GOTO OPCAO1
IF /i "%OPCAO%"=="2" GOTO OPCAO2
IF /i "%OPCAO%"=="3" GOTO OPCAO3
IF /i "%OPCAO%"=="4" GOTO OPCAO4
IF /i "%OPCAO%"=="5" GOTO FIM
GOTO ERRO

:OPCAO1
ECHO Atualizando Drummer 9...
IF NOT EXIST "%Dst9%" MD "%Dst9%"
XCOPY "%Src9%" "%Dst9%" %Flag%

IF NOT EXIST "%Dst9trans%" MD "%Dst9trans%"
XCOPY "%Src9trans%" "%Dst9trans%" %Flag%

IF NOT EXIST "%Dst9help%" MD "%Dst9help%"
XCOPY "%Src9help%" "%Dst9help%" %Flag%

IF NOT EXIST "%Dst9data%" MD "%Dst9data%"
XCOPY "%Src9data%" "%Dst9data%" %Flag%

REM IF NOT EXISTS "%Dst9client%" MD "%Dst9client%"
REM XCOPY "%Src9client%" "%Dst9client%" %Flag%

CD /d "%Dst9%"
START "" DrummerLink.exe
GOTO FIM

:OPCAO2
ECHO Atualizando Drummer 9...
IF NOT EXIST "%Dst9%" MD "%Dst9%"
XCOPY "%Src9%" "%Dst9%" %Flag%

IF NOT EXIST "%Dst9trans%" MD "%Dst9trans%"
XCOPY "%Src9trans%" "%Dst9trans%" %Flag%

IF NOT EXIST "%Dst9help%" MD "%Dst9help%"
XCOPY "%Src9help%" "%Dst9help%" %Flag%

IF NOT EXIST "%Dst9data%" MD "%Dst9data%"
XCOPY "%Src9data%" "%Dst9data%" %Flag%

REM IF NOT EXISTS "%Dst9client%" MD "%Dst9client%"
REM XCOPY "%Src9client%" "%Dst9client%" %Flag%

CD /d "%Dst9%"
START "" Drummer.exe
GOTO FIM

:OPCAO3
ECHO Atualizando Drummer 10...
IF NOT EXIST "%Dst10%" MD "%Dst10%"
XCOPY "%Src10%" "%Dst10%" %Flag%

IF NOT EXIST "%Dst10trans%" MD "%Dst10trans%"
XCOPY "%Src10trans%" "%Dst10trans%" %Flag%

IF NOT EXIST "%Dst10help%" MD "%Dst10help%"
XCOPY "%Src10help%" "%Dst10help%" %Flag%

IF NOT EXIST "%Dst10data%" MD "%Dst10data%"
XCOPY "%Src10data%" "%Dst10data%" %Flag%

REM IF NOT EXISTS "%Dst10client%" MD "%Dst10client%"
REM XCOPY "%Src10client%" "%Dst10client%" %Flag%

CD /d "%Dst10%"
START "" DrummerLink.exe
GOTO FIM

:OPCAO4
ECHO Atualizando Drummer 10...
IF NOT EXIST "%Dst10%" MD "%Dst10%"
XCOPY "%Src10%" "%Dst10%" %Flag%

IF NOT EXIST "%Dst10trans%" MD "%Dst10trans%"
XCOPY "%Src10trans%" "%Dst10trans%" %Flag%

IF NOT EXIST "%Dst10help%" MD "%Dst10help%"
XCOPY "%Src10help%" "%Dst10help%" %Flag%

IF NOT EXIST "%Dst10data%" MD "%Dst10data%"
XCOPY "%Src10data%" "%Dst10data%" %Flag%

REM IF NOT EXISTS "%Dst10client%" MD "%Dst10client%"
REM XCOPY "%Src10client%" "%Dst10client%" %Flag%

CD /d "%Dst10%"
START "" Drummer.exe
GOTO FIM

:ERRO
ECHO.
ECHO Opcao Invalida. Tente Novamente.
PAUSE
GOTO MENU

:FIM
TIMEOUT /5
EXIT