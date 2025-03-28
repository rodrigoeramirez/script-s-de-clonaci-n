
@echo off
:: BatchGotAdmin
:: -------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Debes ejecutar este script como administrador.
    pause
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:: --------------------------------------

rem Aquí comienza el script


:: Verificar y eliminar el usuario "tt"
net user tt >nul 2>&1
if %errorlevel% EQU 0 (
    echo Eliminando usuario "tt"...
    net user tt /delete
) else (
    echo El usuario "tt" no existe.
)

:: Verificar y eliminar el usuario "rr"
net user rr >nul 2>&1
if %errorlevel% EQU 0 (
    echo Eliminando usuario "rr"...
    net user rr /delete
) else (
    echo El usuario "rr" no existe.
)

:: Habilitar la cuenta de administrador
net user administrador /active:yes

:: Establecer la contraseña de la cuenta de administrador como "Soportet23."
net user administrador Soportet23.
cls


REM Definir el tiempo de cuenta regresiva en segundos
set "tiempo=7"

REM Cuenta regresiva
REM for /l %%i in (%tiempo%,-1,1) do (
REM    cls
REM    echo Usuario "tt" eliminado y cuenta de Administrador habilitada con la clave "Soportet23."
REM    echo Cerrando sesion en: %%i segundos
REM    timeout /t 1 /nobreak >nul
REM )

:: Comando para cerrar sesion
shutdown -l









