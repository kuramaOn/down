@echo off
REM ============================================
REM Video Downloader Bot - Setup Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     🔧 VIDEO DOWNLOADER BOT - SETUP WIZARD 🔧           ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0B

REM Check Python
echo [Step 1/4] Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python not found!
    echo.
    echo Please install Python 3.8+ from:
    echo https://www.python.org/downloads/
    echo.
    echo Make sure to check "Add Python to PATH" during installation!
    pause
    exit /b 1
)
python --version
echo ✅ Python is installed!
echo.

REM Create virtual environment
echo [Step 2/4] Creating virtual environment...
if exist venv (
    echo ⚠️  Virtual environment already exists!
    set /p recreate="Do you want to recreate it? (Y/N): "
    if /i "%recreate%"=="Y" (
        echo Removing old virtual environment...
        rmdir /s /q venv
        python -m venv venv
        echo ✅ Virtual environment recreated!
    ) else (
        echo ✅ Using existing virtual environment!
    )
) else (
    python -m venv venv
    echo ✅ Virtual environment created!
)
echo.

REM Activate and install dependencies
echo [Step 3/4] Installing dependencies...
call venv\Scripts\activate.bat
echo Upgrading pip...
python -m pip install --upgrade pip --quiet
echo Installing requirements...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies!
    pause
    exit /b 1
)
echo ✅ All dependencies installed successfully!
echo.

REM Setup .env file
echo [Step 4/4] Setting up configuration...
if exist .env (
    echo ⚠️  .env file already exists!
    set /p overwrite="Do you want to reconfigure? (Y/N): "
    if /i not "%overwrite%"=="Y" (
        echo Keeping existing configuration.
        goto skip_env
    )
)

echo Creating .env file from template...
copy .env.example .env >nul 2>&1
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo 🔑 BOT TOKEN REQUIRED
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo To get your bot token:
echo 1. Open Telegram and search for @BotFather
echo 2. Send /newbot to create a new bot (or /token for existing)
echo 3. Copy the token provided
echo.
set /p token="Enter your BOT_TOKEN: "

if "%token%"=="" (
    echo ❌ No token provided! Please edit .env file manually.
    notepad .env
) else (
    REM Update .env file with token
    powershell -Command "(Get-Content .env) -replace 'BOT_TOKEN=.*', 'BOT_TOKEN=%token%' | Set-Content .env"
    echo ✅ Token saved to .env file!
)

:skip_env
echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ SETUP COMPLETE!
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo Next steps:
echo 1. Run start_bot.bat to start your bot
echo 2. Send /start to your bot on Telegram
echo 3. Send a video URL to test
echo.
echo Configuration file: .env
echo To change settings, edit the .env file
echo.
pause
