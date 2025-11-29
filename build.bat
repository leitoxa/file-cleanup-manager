@echo off
echo ========================================
echo   Сборка C# версии (Native Windows)
echo ========================================
echo.

REM Путь к компилятору .NET Framework 4.x (есть в Win 7/8/10/11)
set CSC=C:\Windows\Microsoft.NET\Framework64\v4.0.30319\csc.exe

if not exist "%CSC%" (
    echo Ошибка: Компилятор csc.exe не найден!
    echo Проверьте путь: %CSC%
    pause
    exit /b
)

echo Компиляция CleanupManager.exe...
"%CSC%" /target:winexe /out:CleanupManager.exe ^
    /r:System.Windows.Forms.dll ^
    /r:System.Drawing.dll ^
    /r:System.ServiceProcess.dll ^
    /r:System.Configuration.Install.dll ^
    /r:System.Web.Extensions.dll ^
    /r:Microsoft.VisualBasic.dll ^
    CleanupManager.cs

if errorlevel 1 (
    echo.
    echo ОШИБКА КОМПИЛЯЦИИ!
    pause
) else (
    echo.
    echo ========================================
    echo   УСПЕШНО!
    echo ========================================
    echo Файл создан: CleanupManager.exe
    echo Размер: Около 15-20 КБ (да, килобайт!)
    echo.
    dir CleanupManager.exe
    echo.
    pause
)
