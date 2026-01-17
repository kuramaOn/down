@echo off
REM ============================================
REM Deploy to Railway.app - Automated Script
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     🚂 DEPLOYING TO RAILWAY.APP 🚂                      ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0D

REM Check if Node.js is installed
echo [1/6] Checking Node.js installation...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed!
    echo.
    echo Please install Node.js from: https://nodejs.org
    echo After installing, run this script again.
    pause
    exit /b 1
)
echo ✅ Node.js found!
echo.

REM Check if Railway CLI is installed
echo [2/6] Checking Railway CLI...
railway --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ⚠️  Railway CLI not found. Installing...
    npm install -g @railway/cli
    if %errorlevel% neq 0 (
        echo ❌ Failed to install Railway CLI!
        pause
        exit /b 1
    )
    echo ✅ Railway CLI installed!
) else (
    echo ✅ Railway CLI already installed!
)
echo.

REM Login to Railway
echo [3/6] Logging in to Railway...
echo.
echo A browser window will open for authentication.
echo Please log in with GitHub.
echo.
pause
railway login
if %errorlevel% neq 0 (
    echo ❌ Login failed!
    pause
    exit /b 1
)
echo ✅ Logged in successfully!
echo.

REM Initialize Railway project
echo [4/6] Initializing Railway project...
railway init
if %errorlevel% neq 0 (
    echo ⚠️  Using existing project...
    railway link
)
echo ✅ Project ready!
echo.

REM Set environment variables
echo [5/6] Setting environment variables...
echo.
echo Setting BOT_TOKEN...
railway variables set BOT_TOKEN=8466259625:AAE7FtwH0I8kUe_B_TytvBSsWV6js5A62rc
if %errorlevel% neq 0 (
    echo ❌ Failed to set environment variables!
    pause
    exit /b 1
)
echo ✅ Environment variables set!
echo.

REM Deploy to Railway
echo [6/6] Deploying to Railway...
echo.
echo This will take 2-3 minutes...
echo.
railway up
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
echo Your bot is now live on Railway.app!
echo.
echo Next steps:
echo 1. View logs: railway logs
echo 2. Check status: railway status
echo 3. Open dashboard: railway open
echo.
echo Test your bot on Telegram now!
echo.
pause
