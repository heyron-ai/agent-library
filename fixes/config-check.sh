#!/bin/bash
# Config Check — validates your openclaw.json is healthy
# Usage: bash ~/agent-library/fixes/config-check.sh

CONFIG="/root/.openclaw/openclaw.json"

echo "=== Config Health Check ==="

if [ ! -f "$CONFIG" ]; then
    echo "✗ Config file not found at $CONFIG"
    exit 1
fi

if [ ! -s "$CONFIG" ]; then
    echo "✗ Config file is empty (0 bytes) — contact support in #help"
    exit 1
fi

# Validate JSON
if python3 -c "import json; json.load(open('$CONFIG'))" 2>/dev/null; then
    echo "✓ Valid JSON"
else
    echo "✗ Invalid JSON — config is corrupted. Contact support in #help"
    exit 1
fi

# Check for common bad keys
BAD_KEYS=$(python3 -c "
import json
with open('$CONFIG') as f:
    d = json.load(f)
bad = []
if 'channels' in d:
    bad.append('channels (should not be at top level)')
if 'web' in d:
    bad.append('web (should not be at top level)')
if bad:
    print(', '.join(bad))
" 2>/dev/null)

if [ -n "$BAD_KEYS" ]; then
    echo "⚠ Suspicious keys found: $BAD_KEYS"
    echo "  These may cause gateway crashes. Contact support in #help"
else
    echo "✓ No known bad keys"
fi

# Check gateway is running
if pgrep -f "openclaw gateway" > /dev/null; then
    echo "✓ Gateway process is running"
else
    echo "✗ Gateway is not running — it should auto-restart. If not, contact support."
fi

echo ""
echo "Done!"
