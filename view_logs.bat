@echo off
REM ============================================
REM Video Downloader Bot - Log Viewer
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     📋 BOT LOGS VIEWER 📋                               ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0A

if not exist bot.log (
    echo ℹ️  No log file found. The bot hasn't been run yet.
    echo.
    pause
    exit /b 0
)

echo Opening bot.log...
echo Press Ctrl+C to stop viewing logs.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.

REM Display last 50 lines and follow
powershell -Command "Get-Content bot.log -Tail 50 -Wait"
