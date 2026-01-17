@echo off
REM ============================================
REM Video Downloader Bot - Deploy to GitHub
REM ============================================

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║                                                          ║
echo ║     🚀 DEPLOY TO GITHUB 🚀                              ║
echo ║                                                          ║
echo ╚══════════════════════════════════════════════════════════╝
echo.

color 0D

REM Check if git is initialized
if not exist .git (
    echo ⚠️  Git repository not initialized!
    echo.
    set /p init_git="Initialize git repository? (Y/N): "
    if /i "%init_git%"=="Y" (
        git init
        echo ✅ Git repository initialized!
    ) else (
        exit /b 1
    )
)

echo.
echo [1/4] Checking git status...
git status
echo.

echo [2/4] Adding all files...
git add .
if %errorlevel% neq 0 (
    echo ❌ Failed to add files!
    pause
    exit /b 1
)
echo ✅ Files added!
echo.

echo [3/4] Creating commit...
set /p commit_msg="Enter commit message: "
if "%commit_msg%"=="" set commit_msg="Update bot code"
git commit -m "%commit_msg%"
if %errorlevel% neq 0 (
    echo ⚠️  Nothing to commit or commit failed!
    pause
    exit /b 1
)
echo ✅ Commit created!
echo.

echo [4/4] Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ⚠️  Push failed. Make sure you've set up remote origin.
    echo.
    echo To set up GitHub remote:
    echo git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
    echo.
    pause
    exit /b 1
)
echo ✅ Pushed to GitHub!
echo.

echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo ✅ DEPLOYMENT COMPLETE!
echo ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
echo.
echo Your code is now on GitHub!
echo Render will auto-deploy if connected.
echo.
pause
