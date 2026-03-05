#!/bin/bash
# Session Reset — clears the current session to fix stuck/looping agents
# Usage: bash ~/agent-library/fixes/session-reset.sh

SESSIONS_DIR="/root/.openclaw/agents/main/sessions"

echo "=== Session Reset ==="

# Remove lock files
find "$SESSIONS_DIR" -name "*.lock" -delete 2>/dev/null
echo "✓ Cleared lock files"

# Find and remove oversized session files (>500KB)
find "$SESSIONS_DIR" -name "*.jsonl" -size +500k | while read f; do
    echo "  Removing bloated session: $f ($(du -h "$f" | cut -f1))"
    rm "$f"
done
echo "✓ Cleared bloated sessions"

echo ""
echo "Done! Tell your human to refresh their browser and reconnect."
