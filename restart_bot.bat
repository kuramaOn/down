@echo off
REM ============================================
REM Video Downloader Bot - Restart Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     🔄 RESTARTING VIDEO DOWNLOADER BOT 🔄               ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0E

echo [1/2] Stopping bot...
call stop_bot.bat

echo.
echo [2/2] Starting bot...
timeout /t 3 >nul
call start_bot.bat
