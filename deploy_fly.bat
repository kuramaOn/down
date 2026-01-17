@echo off
REM ============================================
REM Deploy to Fly.io - Automated Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     ✈️  DEPLOYING TO FLY.IO ✈️                          ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0E

REM Check if flyctl is installed
echo [1/5] Checking Fly CLI installation...
fly version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Fly CLI is not installed!
    echo.
    echo Installing Fly CLI...
    powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"
    
    if %errorlevel% neq 0 (
        echo ❌ Failed to install Fly CLI!
        echo.
        echo Please install manually:
        echo powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"
        pause
        exit /b 1
    )
    
    echo ✅ Fly CLI installed!
    echo ⚠️  Please restart this script for changes to take effect.
    pause
    exit /b 0
)
echo ✅ Fly CLI found!
echo.

REM Login to Fly.io
echo [2/5] Logging in to Fly.io...
echo.
echo A browser window will open for authentication.
echo.
pause
fly auth login
if %errorlevel% neq 0 (
    echo ❌ Login failed!
    pause
    exit /b 1
)
echo ✅ Logged in successfully!
echo.

REM Launch app (if not already launched)
echo [3/5] Checking if app exists...
fly status >nul 2>&1
if %errorlevel% neq 0 (
    echo App not found. Launching new app...
    echo.
    fly launch --no-deploy
    if %errorlevel% neq 0 (
        echo ❌ Failed to launch app!
        pause
        exit /b 1
    )
    echo ✅ App launched!
) else (
    echo ✅ App already exists!
)
echo.

REM Set BOT_TOKEN
echo [4/5] Setting BOT_TOKEN...
fly secrets set BOT_TOKEN=8466259625:AAE7FtwH0I8kUe_B_TytvBSsWV6js5A62rc
if %errorlevel% neq 0 (
    echo ❌ Failed to set BOT_TOKEN!
    pause
    exit /b 1
)
echo ✅ BOT_TOKEN set!
echo.

REM Deploy
echo [5/5] Deploying to Fly.io...
echo.
echo This will take 3-5 minutes...
echo.
fly deploy
if %errorlevel% neq 0 (
    echo ❌ Deployment failed!
    echo.
    echo Check the error messages above.
    pause
    exit /b 1
)

echo.
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ DEPLOYMENT SUCCESSFUL!
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo Your bot is now live on Fly.io!
echo.
echo Next steps:
echo 1. Check status: fly status
echo 2. View logs: fly logs -f
echo 3. Test your bot on Telegram!
echo.
pause
