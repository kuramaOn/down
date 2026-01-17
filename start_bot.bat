@echo off
REM ============================================
REM Video Downloader Bot - Startup Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     🎬 VIDEO DOWNLOADER BOT - STARTUP SCRIPT 🎬         ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

REM Set console colors
color 0A

REM Check if Python is installed
echo [1/5] Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ ERROR: Python is not installed or not in PATH!
    echo Please install Python from https://python.org
    pause
    exit /b 1
)
echo ✅ Python found!
echo.

REM Check if .env file exists
echo [2/5] Checking configuration file...
if not exist .env (
    echo ❌ ERROR: .env file not found!
    echo Creating .env file from template...
    copy .env.example .env >nul 2>&1
    echo.
    echo ⚠️  IMPORTANT: Please edit .env file and add your BOT_TOKEN
    echo.
    notepad .env
    echo.
    echo After saving the .env file, run this script again.
    pause
    exit /b 1
)
echo ✅ Configuration file found!
echo.

REM Check if virtual environment exists, create if not
echo [3/5] Setting up virtual environment...
if not exist venv (
    echo Creating virtual environment...
    python -m venv venv
    echo ✅ Virtual environment created!
) else (
    echo ✅ Virtual environment already exists!
)
echo.

REM Activate virtual environment
echo [4/5] Activating virtual environment...
call venv\Scripts\activate.bat
if %errorlevel% neq 0 (
    echo ❌ ERROR: Failed to activate virtual environment!
    pause
    exit /b 1
)
echo ✅ Virtual environment activated!
echo.

REM Install/Update dependencies
echo [5/5] Installing dependencies...
pip install -r requirements.txt --quiet
if %errorlevel% neq 0 (
    echo ❌ ERROR: Failed to install dependencies!
    pause
    exit /b 1
)
echo ✅ Dependencies installed!
echo.

REM Stop any existing bot instance
echo Checking for existing bot instances...
tasklist /FI "IMAGENAME eq python.exe" /FI "WINDOWTITLE eq *bot.py*" >nul 2>&1
if %errorlevel% equ 0 (
    echo ⚠️  Existing bot instance found. Stopping it...
    taskkill /F /IM python.exe /FI "WINDOWTITLE eq *bot.py*" >nul 2>&1
    timeout /t 2 >nul
)
echo.

REM Start the bot
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 🚀 STARTING BOT...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo Bot is starting... Press Ctrl+C to stop.
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

python bot.py

REM If bot stops, ask to restart
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ⚠️  Bot stopped!
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

:restart_prompt
set /p restart="Do you want to restart the bot? (Y/N): "
if /i "%restart%"=="Y" goto start_bot
if /i "%restart%"=="N" goto end
echo Invalid input. Please enter Y or N.
goto restart_prompt

:start_bot
cls
goto :eof

:end
echo.
echo Thank you for using Video Downloader Bot!
pause
exit /b 0
