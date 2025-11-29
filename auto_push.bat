@echo off
echo ========================================
echo   Auto Push to GitHub
echo ========================================
echo.

cd /d %~dp0

echo Adding all changes...
git add .

echo.
echo Creating commit...
set /p message="Enter commit message (or press Enter for default): "

if "%message%"=="" (
    git commit -m "Update: version 1.2.2"
) else (
    git commit -m "%message%"
)

echo.
echo Pushing to GitHub...
git push

echo.
echo ========================================
echo   Completed!
echo ========================================
pause
