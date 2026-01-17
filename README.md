# 🎬 Video Downloader Bot - Enhanced Edition

A robust Telegram bot for downloading videos from YouTube, TikTok, and Instagram with advanced error handling, rate limiting, and security features.

## ✨ Features

- 🎥 **Multi-Platform Support**
  - YouTube (360p video, MP3 audio)
  - TikTok (original quality)
  - Instagram (posts & reels)

- 🛡️ **Security & Reliability**
  - No hardcoded secrets
  - Input validation & sanitization
  - Rate limiting (per-user & global)
  - Resource management
  - Comprehensive error handling

- 📊 **User Experience**
  - Quality selection for YouTube
  - File size estimation
  - Download progress tracking
  - Thumbnail previews
  - Smart recommendations

## 🚀 Quick Start

### Prerequisites

- Python 3.11+
- FFmpeg installed
- Telegram Bot Token (from [@BotFather](https://t.me/BotFather))

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo>
   cd video-downloader-bot
   ```

2. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Configure environment**
   ```bash
   cp .env.example .env
   # Edit .env and add your BOT_TOKEN
   nano .env
   ```

4. **Run the bot**
   ```bash
   python bot.py
   ```

## ⚙️ Configuration

### Required

| Variable | Description | Example |
|----------|-------------|---------|
| `BOT_TOKEN` | Telegram bot token from @BotFather | `1234567890:ABC...` |

### Optional

| Variable | Default | Description |
|----------|---------|-------------|
| `MAX_FILE_SIZE` | `209715200` | Max download size (200MB) |
| `DOWNLOAD_TIMEOUT` | `30` | Download timeout in seconds |
| `MAX_RETRIES` | `3` | Max retry attempts |
| `RATE_LIMIT_REQUESTS` | `5` | Max requests per period |
| `RATE_LIMIT_PERIOD` | `10` | Rate limit period (seconds) |
| `MAX_CONCURRENT_DOWNLOADS` | `10` | Global concurrent downloads |
| `MAX_DOWNLOADS_PER_USER` | `2` | Per-user concurrent downloads |
| `LOG_LEVEL` | `INFO` | Logging level |

## 📖 Usage

1. Start a chat with your bot on Telegram
2. Send `/start` to see the welcome message
3. Send a video URL from a supported platform
4. For YouTube: Select quality (360p video or MP3 audio)
5. Wait for the download and receive your video

### Supported URL Formats

```
# YouTube
https://youtube.com/watch?v=VIDEO_ID
https://youtu.be/VIDEO_ID
https://youtube.com/shorts/VIDEO_ID

# TikTok
https://tiktok.com/@username/video/VIDEO_ID
https://vm.tiktok.com/SHORT_CODE

# Instagram
https://instagram.com/p/POST_ID
https://instagram.com/reel/REEL_ID
```

## 🐳 Docker Deployment

### Using Docker Compose

```bash
# Set your bot token
export BOT_TOKEN="your_token_here"

# Start the bot
docker-compose up -d

# View logs
docker-compose logs -f

# Stop the bot
docker-compose down
```

### Update docker-compose.yml

```yaml
environment:
  - BOT_TOKEN=${BOT_TOKEN}
  - MAX_FILE_SIZE=209715200
  - RATE_LIMIT_REQUESTS=10
```

## 🏗️ Project Structure

```
video-downloader-bot/
├── bot.py                    # Main bot application
├── config.py                 # Configuration management
├── exceptions.py             # Custom exceptions
├── validators.py             # Input validation
├── rate_limiter.py          # Rate limiting logic
├── resource_manager.py      # Resource management
├── utils.py                 # Utility functions
├── monitoring.py            # Health monitoring script
├── requirements.txt         # Production dependencies
├── requirements-dev.txt     # Development dependencies
├── Dockerfile               # Docker image
├── docker-compose.yml       # Docker Compose config
├── deploy.sh                # Deployment script
├── .env.example             # Environment template
├── .gitignore               # Git ignore rules
├── README.md                # This file
└── IMPROVEMENTS.md          # Detailed improvements log
```

## 🔧 Development

### Install Development Dependencies

```bash
pip install -r requirements-dev.txt
```

### Code Quality Tools

```bash
# Format code
black bot.py

# Lint code
flake8 bot.py
pylint bot.py

# Type checking
mypy bot.py

# Security scan
bandit -r .
```

### Run Tests

```bash
pytest
pytest --cov  # With coverage
```

## 📊 Monitoring

### View Logs

```bash
# Real-time logs
tail -f bot.log

# Error logs only
grep ERROR bot.log

# User activity
grep "User.*sent message" bot.log
```

### Health Check

```bash
# Using monitoring script
python monitoring.py
```

## 🛡️ Security Features

- ✅ No hardcoded secrets
- ✅ Environment variable validation
- ✅ Input sanitization
- ✅ URL validation & sanitization
- ✅ Path traversal prevention
- ✅ Rate limiting
- ✅ Resource limits
- ✅ Safe error messages (no stack traces to users)

## 🐛 Troubleshooting

### Bot won't start

```bash
# Check if BOT_TOKEN is set
echo $BOT_TOKEN

# Verify Python version
python --version  # Should be 3.11+

# Check dependencies
pip install -r requirements.txt
```

### "Rate limit exceeded" errors

Adjust rate limits in `.env`:
```bash
RATE_LIMIT_REQUESTS=10
RATE_LIMIT_PERIOD=60
```

### "Resource limit reached" errors

Increase concurrent download limits:
```bash
MAX_CONCURRENT_DOWNLOADS=20
MAX_DOWNLOADS_PER_USER=3
```

### Downloads failing

1. Check FFmpeg is installed: `ffmpeg -version`
2. Verify URL is supported
3. Check bot logs for detailed errors
4. Ensure file size is under limits

## 📈 Performance Tips

1. **Adjust rate limits** based on your server capacity
2. **Increase concurrent downloads** for powerful servers
3. **Monitor resource usage** with `htop` or similar
4. **Use Redis** for rate limiting in production (future enhancement)
5. **Enable debug logging** when troubleshooting: `LOG_LEVEL=DEBUG`

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes with tests
4. Run code quality checks
5. Submit a pull request

## 📄 License

[Your License Here]

## 🙏 Acknowledgments

- [python-telegram-bot](https://github.com/python-telegram-bot/python-telegram-bot)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- [FFmpeg](https://ffmpeg.org/)

## 📞 Support

- **Issues**: [GitHub Issues](your-repo/issues)
- **Discussions**: [GitHub Discussions](your-repo/discussions)
- **Email**: your-email@example.com

---

**Made with ❤️ by [Your Name]**

**Version**: 2.0.0 (Enhanced Edition)
**Last Updated**: 2024
