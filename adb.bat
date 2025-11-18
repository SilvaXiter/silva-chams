@echo off
setlocal enabledelayedexpansion
title SILVA ADB CHANGER

REM ============================================
REM        SILVA ADB CHANGER - BY NOVA
REM ============================================

cls
echo.
echo  ============================================
echo         SILVA   A D B   C H A N G E R
echo  ============================================
echo.

REM ===== SET NEW PORT HERE =====
set "NEW_PORT=5555"

REM ===== CONFIG PATHS =====
set "CONFIG_MSI5=C:\ProgramData\BlueStacks_msi5\bluestacks.conf"
set "CONFIG_NXT=C:\ProgramData\BlueStacks_nxt\bluestacks.conf"

set "TARGET="

echo Searching for BlueStacks configuration...
echo.

if exist "%CONFIG_MSI5%" (
    set "TARGET=%CONFIG_MSI5%"
    echo [FOUND] MSI App Player config:
    echo        %TARGET%
) else if exist "%CONFIG_NXT%" (
    set "TARGET=%CONFIG_NXT%"
    echo [FOUND] BlueStacks 5 config:
    echo        %TARGET%
) else (
    echo [ERROR] No bluestacks.conf found.
    echo Make sure BlueStacks is installed.
    pause
    exit /b 1
)

echo.
echo Creating backup...

set "BACKUP=%TARGET%.bak.%DATE:~10,4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%"
copy "%TARGET%" "%BACKUP%" >nul

echo [OK] Backup saved as:
echo      %BACKUP%
echo.

set "TEMPFILE=%TARGET%.tmp"

echo Updating adb_port to %NEW_PORT% ...
echo.

(
  for /f "usebackq delims=" %%A in ("%TARGET%") do (
    set "LINE=%%A"

    echo !LINE! | findstr /c:"adb_port=" >nul
    if !errorlevel! == 0 (
        for /f "tokens=1* delims==" %%I in ("!LINE!") do (
            set "LEFT=%%I"
            echo !LEFT!^="%NEW_PORT%"
        )
    ) else (
        echo !LINE!
    )
  )
) > "%TEMPFILE%"

move /y "%TEMPFILE%" "%TARGET%" >nul

echo --------------------------------------------
echo ✔ All adb_port entries updated to "%NEW_PORT%"
echo ✔ Config patched successfully
echo.
echo If anything breaks, restore from backup:
echo %BACKUP%
echo --------------------------------------------
echo.

pause