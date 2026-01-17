#!/bin/bash
# Render startup script for Video Downloader Bot

echo "🚀 Starting Video Downloader Bot on Render..."

# Check if BOT_TOKEN is set
if [ -z "$BOT_TOKEN" ]; then
    echo "❌ ERROR: BOT_TOKEN environment variable is not set!"
    exit 1
fi

echo "✅ Environment variables loaded"
echo "📦 Python version: $(python --version)"
echo "📊 Memory available: $(free -h | awk '/^Mem:/ {print $7}') free"

# Run the bot
echo "🤖 Starting bot..."
python bot.py
