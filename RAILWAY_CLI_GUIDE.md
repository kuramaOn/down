# 🚂 Railway CLI Deployment Guide

Complete guide for deploying your bot using Railway CLI.

---

## 📋 Prerequisites

### **1. Install Node.js**
Railway CLI requires Node.js.

**Download:** https://nodejs.org (LTS version)

**Verify installation:**
```bash
node --version
npm --version
```

---

## 🚀 Quick Deploy (Automated)

### **Option 1: Use Batch File** (Windows - Easiest)

Just double-click:
```
deploy_railway.bat
```

This will:
1. ✅ Check Node.js
2. ✅ Install Railway CLI
3. ✅ Login to Railway
4. ✅ Create project
5. ✅ Set BOT_TOKEN
6. ✅ Deploy!

**Time:** 5 minutes

---

## 🛠️ Manual Deployment (Step-by-Step)

### **Step 1: Install Railway CLI**

```bash
npm install -g @railway/cli
```

**Verify installation:**
```bash
railway --version
```

---

### **Step 2: Login to Railway**

```bash
railway login
```

- Browser will open
- Sign in with GitHub
- Authorize Railway CLI
- Return to terminal

---

### **Step 3: Initialize Project**

```bash
# Navigate to your project directory
cd path/to/your/project

# Initialize Railway project
railway init
```

**Follow prompts:**
- Choose "Create a new project"
- Name: `video-downloader-bot` (or any name)
- Template: Empty Project

---

### **Step 4: Set Environment Variables**

```bash
railway variables set BOT_TOKEN=8466259625:AAE7FtwH0I8kUe_B_TytvBSsWV6js5A62rc
```

**Add more variables (optional):**
```bash
railway variables set MAX_FILE_SIZE=209715200
railway variables set LOG_LEVEL=INFO
```

**View all variables:**
```bash
railway variables
```

---

### **Step 5: Deploy**

```bash
railway up
```

This will:
- ✅ Upload your code
- ✅ Build on Railway servers
- ✅ Install dependencies
- ✅ Start your bot

**Wait 2-3 minutes...**

---

### **Step 6: Verify Deployment**

```bash
# View logs
railway logs

# Check status
railway status

# Open dashboard
railway open
```

---

## 📊 Railway CLI Commands

### **Essential Commands:**

```bash
# View live logs
railway logs

# Follow logs (live stream)
railway logs --follow

# Check project status
railway status

# List environment variables
railway variables

# Set variable
railway variables set KEY=VALUE

# Delete variable
railway variables delete KEY

# Open dashboard in browser
railway open

# Restart service
railway restart

# Link existing project
railway link

# Deploy updates
railway up

# Run command on Railway
railway run python bot.py

# SSH into container
railway shell
```

---

## 🔄 Update Your Bot

When you make changes:

```bash
# Commit changes to git
git add .
git commit -m "Updated bot"

# Deploy to Railway
railway up
```

**Or enable auto-deploy from GitHub:**
1. `railway open` (opens dashboard)
2. Go to Settings
3. Connect GitHub repository
4. Enable auto-deploy

---

## 📱 Monitor Your Bot

### **View Logs:**
```bash
railway logs --follow
```

Look for:
```
✅ Application started
✅ Bot handlers configured
✅ HTTP Request: POST .../getMe "200 OK"
```

### **Check Resource Usage:**
```bash
railway status
```

Shows:
- Memory usage
- CPU usage
- Deployment status

---

## 🐛 Troubleshooting

### **Problem: Railway CLI not found**
```bash
npm install -g @railway/cli
```

### **Problem: Login fails**
- Make sure browser allows popups
- Try: `railway logout` then `railway login`

### **Problem: Deployment fails**
```bash
# Check logs
railway logs

# Verify files
railway up --verbose
```

### **Problem: Bot not responding**
```bash
# Check if running
railway status

# View logs
railway logs

# Restart
railway restart
```

### **Problem: Environment variable not set**
```bash
# List variables
railway variables

# Set again
railway variables set BOT_TOKEN=your_token
```

---

## 💰 Cost & Free Tier

### **Railway Free Tier:**
- $5 free credit per month
- ~500 hours of runtime
- 1GB RAM
- 1GB disk
- 100GB bandwidth

### **Your Bot Usage:**
- Estimated: $3/month
- **You get $5 free = FREE!** ✅

### **Monitor Usage:**
```bash
railway open
```
Go to Settings → Usage to see current usage.

---

## 🎯 Quick Reference

### **First Time Setup:**
```bash
npm install -g @railway/cli
railway login
railway init
railway variables set BOT_TOKEN=your_token
railway up
```

### **Update Bot:**
```bash
git add .
git commit -m "Update"
railway up
```

### **Check Status:**
```bash
railway logs --follow
railway status
```

---

## 🔗 Useful Links

- Railway Dashboard: https://railway.app/dashboard
- Railway Docs: https://docs.railway.app
- Railway CLI Docs: https://docs.railway.app/develop/cli
- Railway Discord: https://discord.gg/railway

---

## ✅ Deployment Checklist

```
☐ Node.js installed
☐ Railway CLI installed (npm install -g @railway/cli)
☐ Logged in (railway login)
☐ Project initialized (railway init)
☐ BOT_TOKEN set (railway variables set BOT_TOKEN=...)
☐ Deployed (railway up)
☐ Logs checked (railway logs)
☐ Bot tested on Telegram
☐ Auto-deploy enabled (optional)
```

---

## 🎉 You're Done!

Your bot is now running 24/7 on Railway!

**Next steps:**
- Test bot on Telegram
- Monitor logs: `railway logs --follow`
- Set up auto-deploy from GitHub
- Enjoy your free hosting!

---

**Need help? Check logs with `railway logs` or ask me!**
