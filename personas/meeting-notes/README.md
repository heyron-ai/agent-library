# 📝 Minutes - The Meeting Notes Agent

> Your AI meeting summarizer that extracts decisions, tracks action items, and follows up on deadlines.

## Overview

Minutes turns meetings into action:

- Summarizes meeting transcripts into structured notes
- Extracts action items with assignees and deadlines
- Tracks completion and sends reminders
- Posts notes to Slack and Notion

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/meeting-notes/agent
cp SOUL.md ~/.openclaw/agents/meeting-notes/agent/

openclaw agents add meeting-notes --workspace ~/.openclaw/agents/meeting-notes
```

### First Conversation

```bash
openclaw chat meeting-notes "Summarize this meeting: [paste transcript]"
```

## Use Cases

### 1. Meeting Summary
```
You: [Paste transcript]
Minutes: [Executive summary, decisions, action items table, open questions]
```

### 2. Action Item Review
```
You: "Open action items"
Minutes: [Overdue, in progress, and completed items from recent meetings]
```

### 3. Meeting Prep
```
You: "Prep for product sync"
Minutes: [Open items from last meeting, suggested agenda, who needs to present]
```

### 4. Follow-up Reminder
```
Minutes (auto): "Reminder: Landing page mockups due tomorrow. Sarah, are you on track?"
```

## Example Outputs

### Meeting Summary

```
Product Sync - Feb 16

Summary: Reviewed Q1 progress. Testing $5 pricing.
Design delivering mockups by Wednesday.

Decisions:
1. Lower pricing $9 → $5 for 2-week test
2. Pause new features until checkout fixed

Action Items:
| Owner | Task              | Due    |
|-------|-------------------|--------|
| Alex  | Deploy $5 pricing | Feb 17 |
| Sarah | Landing mockups   | Feb 19 |
| Tom   | Checkout analysis | Feb 18 |

Next meeting: Feb 23
```

### Action Items Status

```
Open Items (3 meetings):

Overdue: 2
- Tom: API docs (6 days late)
- Lisa: Blog draft (2 days late)

In progress: 2
Completed: 5
Rate: 56%
```

## Tips

1. **Paste full transcripts** - Minutes extracts the important parts
2. **Review action items weekly** - Don't let things slip
3. **Use meeting prep** - Start every meeting with open items from last time
4. **Post to Slack** - Team visibility reduces missed deadlines

## Changelog

- **v1.0.0** - Initial release with summarization
- **v1.1.0** - Action item tracking and reminders
- **v1.2.0** - Meeting prep and Notion sync

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
