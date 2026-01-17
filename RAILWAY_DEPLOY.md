# 🚂 Railway.app Deployment Guide - FREE 24/7 Hosting

## ✅ Why Railway?

- 🆓 **$5 FREE credit per month** (enough for small bots)
- ⚡ **No sleep** - runs 24/7
- 🔄 **Auto-deploy** from GitHub
- 💾 **1GB RAM** on free tier
- 🎯 **Easy setup** - 5 minutes

---

## 📋 Step-by-Step Deployment

### **Step 1: Sign Up for Railway**

1. Go to: https://railway.app
2. Click **"Login"** or **"Start a New Project"**
3. **Sign in with GitHub** (easiest)
4. Verify your account (may need to add credit card for $5 free credit, but **NO CHARGES**)

---

### **Step 2: Create New Project**

1. Click **"New Project"**
2. Select **"Deploy from GitHub repo"**
3. Choose: **kuramaOn/down**
4. Railway will automatically detect Python and start building

---

### **Step 3: Add Environment Variables**

1. Click on your deployment
2. Go to **"Variables"** tab
3. Click **"New Variable"**
4. Add:
   ```
   BOT_TOKEN = 8466259625:AAE7FtwH0I8kUe_B_TytvBSsWV6js5A62rc
   ```
5. Click **"Add"**

---

### **Step 4: Deploy!**

1. Railway will automatically build and deploy
2. Wait 2-3 minutes
3. Check logs - should see "Application started"
4. **Your bot is live 24/7!** ✅

---

## 📊 Railway Free Tier Limits

- **$5 credit per month** (~500 hours of runtime)
- **1GB RAM**
- **1GB disk space**
- **100GB bandwidth**

**Enough for a small bot running 24/7!**

---

## 🔍 Monitoring Your Bot

### **View Logs:**
1. Click on your service
2. Go to **"Deployments"** tab
3. Click on latest deployment
4. View live logs

### **Restart:**
1. Go to **"Settings"**
2. Click **"Restart"**

---

## 💰 Cost Estimate

For a simple bot:
- **Runtime**: ~$3/month
- **You get**: $5 free credit
- **Result**: **FREE with $2 leftover!** ✅

---

## 🎯 Quick Start Commands

Already have Railway CLI? Run:

```bash
# Install Railway CLI
npm i -g @railway/cli

# Login
railway login

# Link project
railway link

# Add environment variable
railway variables set BOT_TOKEN=YOUR_TOKEN_HERE

# Deploy
railway up
```

---

## ⚠️ Important Notes

- Free credit resets every month
- If you exceed $5, service pauses (no surprise charges)
- Can upgrade anytime for more resources
- Verify account with credit card (no charges) to get full $5

---

## 🆘 Troubleshooting

**Bot not starting?**
- Check logs for errors
- Verify BOT_TOKEN is set
- Make sure Python version is correct

**Out of credit?**
- Check usage in dashboard
- Free credit resets monthly
- Consider upgrading ($5/month for unlimited)

---

## 🔗 Useful Links

- Railway Dashboard: https://railway.app/dashboard
- Railway Docs: https://docs.railway.app
- Railway Discord: https://discord.gg/railway

---

## ✅ Deployment Checklist

☐ Railway account created
☐ GitHub connected
☐ Project created from repo
☐ BOT_TOKEN added
☐ Deployment successful
☐ Bot tested on Telegram
☐ Monitoring logs

---

**Your bot will be live in 5 minutes! 🎉**
