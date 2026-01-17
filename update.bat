@echo off
REM ============================================
REM Video Downloader Bot - Update Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     📥 UPDATING VIDEO DOWNLOADER BOT 📥                 ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0D

REM Check if git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Git is not installed. Cannot update from repository.
    echo.
    echo Update dependencies only? (Y/N)
    set /p update_deps="> "
    if /i "%update_deps%"=="Y" goto update_deps
    exit /b 1
)

echo [1/3] Pulling latest changes from GitHub...
git pull origin main
if %errorlevel% neq 0 (
    echo ❌ Failed to pull changes. Check your internet connection.
    pause
    exit /b 1
)
echo ✅ Code updated!
echo.

:update_deps
echo [2/3] Activating virtual environment...
if not exist venv (
    echo ❌ Virtual environment not found! Run setup.bat first.
    pause
    exit /b 1
)
call venv\Scripts\activate.bat
echo ✅ Virtual environment activated!
echo.

echo [3/3] Updating dependencies...
pip install -r requirements.txt --upgrade
if %errorlevel% neq 0 (
    echo ❌ Failed to update dependencies!
    pause
    exit /b 1
)
echo ✅ Dependencies updated!
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ UPDATE COMPLETE!
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo Restart the bot to apply changes.
echo Run: restart_bot.bat
echo.
pause
