@echo off
REM ============================================
REM Video Downloader Bot - Stop Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     🛑 STOPPING VIDEO DOWNLOADER BOT 🛑                 ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0C

echo Searching for running bot instances...
echo.

REM Find and kill Python processes running bot.py
tasklist /FI "IMAGENAME eq python.exe" 2>nul | find /i "python.exe" >nul
if %errorlevel% neq 0 (
    echo ℹ️  No Python processes found.
    echo The bot is not running.
    echo.
    pause
    exit /b 0
)

echo Found Python processes. Stopping bot...
echo.

REM Kill all Python processes (be careful!)
taskkill /F /IM python.exe >nul 2>&1

if %errorlevel% equ 0 (
    echo ✅ Bot stopped successfully!
) else (
    echo ⚠️  Could not stop bot. It may not be running.
)

echo.
echo Cleaning up lock files...
if exist bot_instance.lock (
    del bot_instance.lock
    echo ✅ Lock file removed.
) else (
    echo ℹ️  No lock file found.
)

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ Bot stopped!
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
pause
