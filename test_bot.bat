@echo off
REM ============================================
REM Video Downloader Bot - Test Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     🧪 TESTING VIDEO DOWNLOADER BOT 🧪                  ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0F

echo Activating virtual environment...
if not exist venv (
    echo ❌ Virtual environment not found! Run setup.bat first.
    pause
    exit /b 1
)
call venv\Scripts\activate.bat
echo.

echo Running unit tests...
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

python test_bot.py

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo Tests complete!
echo.
pause
