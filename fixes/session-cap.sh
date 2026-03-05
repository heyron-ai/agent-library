#!/bin/bash
# Session Size Cap — truncate bloated session files
# Keeps last 50 messages when file exceeds 500KB
MAX_KB=500
KEEP_LINES=50

find /opt/nerve-data/*/agents/main/sessions -name "*.jsonl" -size +${MAX_KB}k 2>/dev/null | while read f; do
    lines=$(wc -l < "$f")
    if [ "$lines" -gt "$KEEP_LINES" ]; then
        echo "$(date) Truncating $f ($lines lines, $(du -h "$f" | cut -f1))"
        tail -n $KEEP_LINES "$f" > "${f}.tmp" && mv "${f}.tmp" "$f"
    fi
done
