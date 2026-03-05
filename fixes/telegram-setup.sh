#!/bin/bash
# Telegram Setup — safely adds Telegram bot config and restarts gateway
# Usage: bash telegram-setup.sh <BOT_TOKEN>

if [ -z "$1" ]; then
    echo "Usage: bash telegram-setup.sh <bot-token>"
    echo "Get your token from @BotFather on Telegram"
    exit 1
fi

TOKEN="$1"
CONFIG="/root/.openclaw/openclaw.json"

# Validate token format
if ! echo "$TOKEN" | grep -qE '^[0-9]+:[A-Za-z0-9_-]+$'; then
    echo "ERROR: Invalid bot token format. Should look like: 7123456789:AAF1234..."
    exit 1
fi

# Validate existing config
if ! python3 -c "import json; json.load(open('$CONFIG'))" 2>/dev/null; then
    echo "ERROR: Current config is corrupted. Contact support in #help"
    exit 1
fi

# Backup config
cp "$CONFIG" "${CONFIG}.bak"

# Add telegram config
python3 -c "
import json
with open('$CONFIG') as f:
    cfg = json.load(f)
if 'channels' not in cfg:
    cfg['channels'] = {}
cfg['channels']['telegram'] = {'botToken': '$TOKEN'}
with open('$CONFIG', 'w') as f:
    json.dump(cfg, f, indent=2)
print('Config updated.')
"

# Validate the new config
if ! python3 -c "import json; json.load(open('$CONFIG'))" 2>/dev/null; then
    echo "ERROR: Config corrupted during write. Restoring backup..."
    cp "${CONFIG}.bak" "$CONFIG"
    exit 1
fi

# Restart gateway by killing the process (watchdog auto-restarts it)
echo "Restarting gateway..."
pkill -f "openclaw gateway" 2>/dev/null
sleep 5

# Verify gateway came back
if pgrep -f "openclaw gateway" > /dev/null; then
    echo "✅ Telegram connected! Open Telegram, find your bot, and send /start"
else
    echo "⚠️ Gateway didn't restart. Restoring backup..."
    cp "${CONFIG}.bak" "$CONFIG"
    pkill -f "openclaw gateway" 2>/dev/null
    echo "Config restored. Contact support in #help"
fi
