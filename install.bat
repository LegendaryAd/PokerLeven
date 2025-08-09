@echo off
:: Instala git si no está
where git >nul 2>&1
if errorlevel 1 (
    echo Git no encontrado, instalando...
    winget install --silent GIT.GIT
    echo Git instalado. Por favor, cierra y abre esta consola para continuar.
    pause
    exit /b 1
)

set "BALATRO_PATH=%USERPROFILE%\AppData\Roaming\Balatro"
set "MODS_PATH=%BALATRO_PATH%\Mods"
set "MODS_BACKUP=%BALATRO_PATH%\Mods_backup"

echo Creando carpeta: %MODS_PATH%
mkdir "%MODS_PATH%" 2>nul

echo Creando carpeta de backup: %MODS_BACKUP%
mkdir "%MODS_BACKUP%" 2>nul

echo Haciendo copia de seguridad de Mods...
xcopy "%MODS_PATH%\*" "%MODS_BACKUP%\" /E /I /Y >nul

echo Limpiando carpeta Mods original...
rd /S /Q "%MODS_PATH%"
mkdir "%MODS_PATH%"

echo Cambiando directorio...
cd /d "%MODS_PATH%"
if errorlevel 1 (
    echo No se pudo cambiar al directorio %MODS_PATH%
    pause
    exit /b 1
)

echo Procesando repositorios...

rem smods
if not exist "smods" (
    echo Clonando smods...
    git clone https://github.com/Steamodded/smods.git
) else (
    echo Actualizando smods...
    cd smods
    git pull
    cd ..
)

rem Talisman
if not exist "Talisman" (
    echo Clonando Talisman...
    git clone https://github.com/SpectralPack/Talisman.git
) else (
    echo Actualizando Talisman...
    cd Talisman
    git pull
    cd ..
)

rem PokerLeven
if not exist "PokerLeven" (
    echo Clonando PokerLeven...
    git clone https://github.com/DecoXFE/PokerLeven.git
) else (
    echo Actualizando PokerLeven...
    cd PokerLeven
    git pull
    cd ..
)

pause
