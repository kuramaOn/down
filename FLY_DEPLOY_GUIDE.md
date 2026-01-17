# 🚀 FLY.IO DEPLOYMENT GUIDE - VIDEO DOWNLOADER BOT

## ✅ Why Fly.io?

- 🆓 **FREE forever** - 3 shared VMs included
- ⏰ **Runs 24/7** - No sleep issues
- 💾 **256MB RAM** per VM (enough for your bot)
- 🌍 **Global deployment** - Choose your region
- 🤖 **Perfect for bots** - No health check issues!

---

## 📋 STEP-BY-STEP DEPLOYMENT

### **STEP 1: Install Fly CLI**

#### **Windows (PowerShell):**
```powershell
powershell -Command "iwr https://fly.io/install.ps1 -useb | iex"
```

#### **Mac/Linux:**
```bash
curl -L https://fly.io/install.sh | sh
```

**Verify installation:**
```bash
fly version
```

---

### **STEP 2: Sign Up and Login**

#### **Sign up (first time):**
```bash
fly auth signup
```
- Browser opens
- Create account (email or GitHub)
- Verify email

#### **Login (if you have account):**
```bash
fly auth login
```
- Browser opens
- Log in with your credentials

---

### **STEP 3: Launch Your App**

Navigate to your project folder and run:

```bash
fly launch --no-deploy
```

**You'll be asked several questions:**

#### **Question 1: App name**
```
? Choose an app name (leave blank to generate one): 
```
**Answer:** `video-downloader-bot` (or leave blank for auto-generated)

#### **Question 2: Organization**
```
? Choose an organization:
```
**Answer:** Select `personal` (your default org)

#### **Question 3: Region**
```
? Choose a region for deployment:
```
**Answer:** Select closest to you:
- **fra** - Frankfurt, Germany (Europe/Asia)
- **iad** - Virginia, USA (Americas)
- **sin** - Singapore (Asia)

#### **Question 4: PostgreSQL**
```
? Would you like to set up a PostgreSQL database?
```
**Answer:** `N` (No - we don't need a database)

#### **Question 5: Redis**
```
? Would you like to set up a Redis database?
```
**Answer:** `N` (No - we don't need Redis)

**Fly will create `fly.toml` (already exists) and configure your app!**

---

### **STEP 4: Set BOT_TOKEN**

**Set your bot token as a secret:**

```bash
fly secrets set BOT_TOKEN=8466259625:AAE7FtwH0I8kUe_B_TytvBSsWV6js5A62rc
```

**Verify it's set:**
```bash
fly secrets list
```

You should see:
```
NAME       DIGEST
BOT_TOKEN  xxxx...
```

---

### **STEP 5: Deploy!**

```bash
fly deploy
```

**What happens:**
```
==> Building image
    Step 1/5: FROM python:3.11-slim
    Step 2/5: WORKDIR /app
    Step 3/5: COPY requirements.txt .
    Step 4/5: RUN pip install -r requirements.txt
    Step 5/5: COPY . .
    
==> Pushing image to registry
==> Creating release
==> Monitoring deployment

✅ Deployment successful!
```

**This takes 3-5 minutes**

---

### **STEP 6: Check Status**

```bash
fly status
```

**You should see:**
```
App
  Name     = video-downloader-bot
  Owner    = personal
  Status   = running ✅
  Hostname = video-downloader-bot.fly.dev

Instances
  ID       PROCESS VERSION REGION DESIRED STATUS
  xxx      app     1       fra    run     running ✅
```

---

### **STEP 7: View Logs**

```bash
fly logs
```

**You should see:**
```
2026-01-17 10:00:00 Configuration loaded successfully
2026-01-17 10:00:01 Bot initialization completed
2026-01-17 10:00:02 Starting Video Downloader Bot...
2026-01-17 10:00:03 Application started ✅
```

**Live logs (follow):**
```bash
fly logs -f
```

---

## ✅ TEST YOUR BOT

1. Open Telegram
2. Find your bot
3. Send `/start`
4. Send a TikTok or YouTube URL
5. Bot downloads and sends! ✅

---

## 📊 FLY.IO FREE TIER

**What you get FREE:**
- 3 shared-cpu VMs (1vCPU, 256MB RAM each)
- 160GB/month bandwidth
- Runs 24/7
- No credit card required for free tier

**Your bot uses:**
- 1 VM (~100MB RAM)
- Minimal bandwidth
- **Result: FREE!** ✅

---

## 🔧 USEFUL FLY COMMANDS

```bash
# View status
fly status

# View logs
fly logs
fly logs -f  # Follow (live)

# Restart app
fly restart

# SSH into container
fly ssh console

# Check secrets
fly secrets list

# Set new secret
fly secrets set KEY=value

# Unset secret
fly secrets unset KEY

# Scale (change VM size)
fly scale memory 512  # Increase to 512MB

# Stop app (pause)
fly scale count 0

# Start app (resume)
fly scale count 1

# Deploy updates
fly deploy

# Open dashboard
fly open
```

---

## 🚀 UPDATE YOUR BOT

When you make code changes:

```bash
# 1. Commit changes
git add .
git commit -m "Updated bot"

# 2. Deploy to Fly.io
fly deploy

# 3. Check logs
fly logs -f
```

**Fly.io auto-builds from your local files (not GitHub)**

---

## 🐛 TROUBLESHOOTING

### **Problem: "fly command not found"**
**Solution:**
- Restart terminal/PowerShell
- Or add to PATH manually

### **Problem: Bot not starting**
**Solution:**
```bash
fly logs
```
Look for errors and check BOT_TOKEN is set:
```bash
fly secrets list
```

### **Problem: "Out of memory"**
**Solution:**
```bash
fly scale memory 512
```
Increases RAM to 512MB (still free tier)

### **Problem: Need to change region**
**Solution:**
```bash
fly regions set fra  # Change to Frankfurt
fly deploy
```

---

## 💡 PRO TIPS

1. **Use `fly logs -f`** - See real-time activity
2. **Set secrets, not env vars** - For sensitive data like BOT_TOKEN
3. **Scale memory if needed** - Up to 512MB stays free
4. **Deploy from local** - Faster than GitHub
5. **Check status regularly** - `fly status`

---

## 🎯 COMPARISON

| Platform | Setup | Free? | Sleep? | Complexity |
|----------|-------|-------|--------|------------|
| **Fly.io** | CLI | ✅ Forever | ❌ Never | ⭐⭐ Medium |
| Koyeb | Web | ✅ Forever | ❌ Never | ⭐ Easy |
| Railway | CLI | $5 credit | ❌ Never | ⭐⭐ Medium |
| Render | Web | ✅ | ✅ 15min | ⭐ Easy |

**Fly.io = Best for CLI users, true free forever!**

---

## ✅ DEPLOYMENT CHECKLIST

```
□ Fly CLI installed
□ Logged in to Fly.io (fly auth login)
□ Launched app (fly launch --no-deploy)
□ Set BOT_TOKEN (fly secrets set BOT_TOKEN=...)
□ Deployed (fly deploy)
□ Checked status (fly status) - running ✅
□ Viewed logs (fly logs) - Application started ✅
□ Tested on Telegram - working ✅
```

---

## 🔗 USEFUL LINKS

- Fly.io Dashboard: https://fly.io/dashboard
- Fly.io Docs: https://fly.io/docs
- Fly.io Discord: https://fly.io/discord
- Your app: https://video-downloader-bot.fly.dev

---

## 🎊 YOU'RE DONE!

Your bot is now:
- ✅ Running 24/7 on Fly.io
- ✅ 100% FREE forever
- ✅ No health check issues
- ✅ Easy to update with `fly deploy`

**Enjoy your deployed bot!** 🚀
