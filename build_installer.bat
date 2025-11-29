@echo off
echo ============================================================
echo  File Cleanup Manager - Сборка Инсталлятора v1.1
echo ============================================================
echo.

REM Проверка наличия Inno Setup
if not exist "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" (
    if not exist "C:\Program Files\Inno Setup 6\ISCC.exe" (
        echo ОШИБКА: Inno Setup 6 не найден!
        echo.
        echo Установите Inno Setup 6 с сайта:
        echo https://jrsoftware.org/isdl.php
        echo.
        pause
        exit /b 1
    )
)

REM Определяем путь к ISCC
set "ISCC=C:\Program Files (x86)\Inno Setup 6\ISCC.exe"
if not exist "%ISCC%" set "ISCC=C:\Program Files\Inno Setup 6\ISCC.exe"

echo Шаг 1: Проверка наличия CleanupManager.exe...
if not exist "CleanupManager.exe" (
    echo ОШИБКА: CleanupManager.exe не найден!
    echo Сначала выполните build.bat для компиляции
    pause
    exit /b 1
)
echo ✓ CleanupManager.exe найден

echo.
echo Шаг 2: Проверка installer.iss...
if not exist "installer.iss" (
    echo ОШИБКА: installer.iss не найден!
    pause
    exit /b 1
)
echo ✓ installer.iss найден

echo.
echo Шаг 3: Построка инсталлятора...
"%ISCC%" "installer.iss"

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo ОШИБКА при создании инсталлятора!
    pause
    exit /b 1
)

echo.
echo ============================================================
echo ✓ Инсталлятор успешно создан!
echo.
echo Файл: Output\FileCleanupManagerSetup.exe
echo ============================================================
echo.
pause
