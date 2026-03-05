#!/bin/bash
# Clear Lock Files — fixes "session locked" errors
# Usage: bash ~/agent-library/fixes/clear-locks.sh

echo "=== Clearing Lock Files ==="
find /root/.openclaw -name "*.lock" -delete 2>/dev/null
echo "✓ All lock files cleared"
echo "Tell your human to refresh and reconnect."
