# 🚀 Render Deployment Guide - Video Downloader Bot

## ⚠️ Important Notes for Render Free Tier

**Render Free Tier Limitations:**
- ⚠️ **Sleeps after 15 minutes of inactivity** (wakes up on next request)
- ⚠️ **750 hours/month** (enough for 24/7 if only 1 service)
- ⚠️ **512 MB RAM** limit
- ⚠️ **No persistent storage** (downloads are temporary)
- ⚠️ **Restarts every 7 days** automatically

**For TRUE 24/7 uptime, you need Render Starter ($7/month) or use a VPS.**

---

## 📋 Prerequisites

1. **Render Account** - Sign up at https://render.com
2. **Render CLI** - Install: `npm install -g render`
3. **Git** - Must be installed
4. **GitHub Account** (optional but recommended)

---

## 🎯 Deployment Steps

### **Step 1: Initialize Git Repository**

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit for Render deployment"
```

### **Step 2: Create GitHub Repository (Recommended)**

```bash
# Create a new repository on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/video-downloader-bot.git
git branch -M main
git push -u origin main
```

### **Step 3: Deploy Using Render CLI**

```bash
# Login to Render
render login

# Create new service
render services create

# Follow prompts:
# - Name: video-downloader-bot
# - Environment: Python 3
# - Build Command: pip install -r requirements.txt
# - Start Command: python bot.py
```

### **Step 4: Set Environment Variables**

```bash
# Set your bot token
render config:set BOT_TOKEN=YOUR_BOT_TOKEN_HERE

# Verify it's set
render config:get BOT_TOKEN
```

### **Step 5: Deploy**

```bash
# Deploy from current directory
render deploy

# Or deploy from GitHub
# (Link your GitHub repo in Render dashboard)
```

---

## 🌐 Alternative: Deploy via Render Dashboard

### **Option A: Deploy from GitHub**

1. **Push code to GitHub**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/video-downloader-bot.git
   git push -u origin main
   ```

2. **Go to Render Dashboard**: https://dashboard.render.com

3. **Click "New +" → "Web Service"**

4. **Connect GitHub repository**

5. **Configure:**
   - **Name**: `video-downloader-bot`
   - **Environment**: `Python 3`
   - **Region**: `Oregon (US West)` or closest to you
   - **Branch**: `main`
   - **Build Command**: `pip install -r requirements.txt`
   - **Start Command**: `python bot.py`
   - **Plan**: `Free`

6. **Add Environment Variables**:
   - Click "Environment" tab
   - Add `BOT_TOKEN` with your token value
   - Other variables are optional (have defaults)

7. **Click "Create Web Service"**

---

## 🔧 Environment Variables

Required:
- `BOT_TOKEN` - Your Telegram bot token from @BotFather

Optional (have defaults):
- `MAX_FILE_SIZE=209715200` (200MB)
- `DOWNLOAD_TIMEOUT=30`
- `MAX_RETRIES=3`
- `RATE_LIMIT_REQUESTS=5`
- `RATE_LIMIT_PERIOD=10`
- `MAX_CONCURRENT_DOWNLOADS=10`
- `MAX_DOWNLOADS_PER_USER=2`
- `LOG_LEVEL=INFO`

---

## ⚠️ Render Free Tier - Sleep Issue Solution

Render free tier **sleeps after 15 minutes of inactivity**. Solutions:

### **Option 1: Use UptimeRobot (Free)**
Keep your bot awake with HTTP pings:
1. Sign up at https://uptimerobot.com
2. Add monitor with your Render URL
3. Set interval to 10 minutes

### **Option 2: Upgrade to Render Starter ($7/month)**
- No sleep
- Better performance
- 1 GB RAM
- True 24/7 uptime

### **Option 3: Use Background Worker (Not Web Service)**
Deploy as a **Background Worker** instead:
1. In `render.yaml`, change `type: web` to `type: worker`
2. Workers don't sleep!
3. Re-deploy

---

## 📊 Monitoring Your Bot

### **View Logs**
```bash
# CLI
render logs

# Or in dashboard
Dashboard → Your Service → Logs
```

### **Check Status**
```bash
render services:list
```

### **Restart Service**
```bash
render services:restart video-downloader-bot
```

---

## 🐛 Troubleshooting

### **Bot not responding**
1. Check logs: `render logs`
2. Verify BOT_TOKEN is set correctly
3. Check if service is sleeping (free tier)

### **Out of memory errors**
- Reduce `MAX_CONCURRENT_DOWNLOADS` to 5
- Reduce `MAX_FILE_SIZE` to 100MB
- Consider upgrading plan

### **Downloads failing**
- Check yt-dlp version is latest
- TikTok may require updates
- Check file size limits

---

## 🚀 After Deployment

1. **Test your bot**: Send it a YouTube URL
2. **Monitor logs**: Watch for errors
3. **Set up UptimeRobot**: Keep it awake (free tier)
4. **Share bot**: Give username to users

---

## 💰 Cost Comparison

| Plan | Cost | RAM | Sleep? | Uptime |
|------|------|-----|--------|--------|
| **Free** | $0 | 512MB | Yes (15 min) | ~95% with UptimeRobot |
| **Starter** | $7/mo | 1GB | No | 99.9% |
| **Standard** | $25/mo | 4GB | No | 99.9% |

---

## 📝 Quick Commands Cheat Sheet

```bash
# Deploy
render deploy

# View logs
render logs --tail

# Restart
render services:restart video-downloader-bot

# Set env var
render config:set KEY=VALUE

# List services
render services:list

# Shell access
render shell
```

---

## ✅ Deployment Checklist

- [ ] Git repository initialized
- [ ] All files committed
- [ ] GitHub repository created (optional)
- [ ] Render account created
- [ ] Service created on Render
- [ ] BOT_TOKEN environment variable set
- [ ] Service deployed successfully
- [ ] Bot responding to commands
- [ ] Logs showing no errors
- [ ] UptimeRobot configured (free tier)

---

## 🆘 Need Help?

- **Render Docs**: https://render.com/docs
- **Render Community**: https://community.render.com
- **Bot Issues**: Check bot.log in your deployment

**Your bot should be live in 3-5 minutes after deployment! 🎉**
