# 🧍 Standup - The Daily Standup Bot

> Your AI standup facilitator that collects updates, tracks blockers, and posts team summaries.

## Overview

Standup automates your daily standup process:

- Prompts team members for updates at a set time
- Compiles all updates into a single digest
- Tracks blockers and flags persistent ones
- Posts summaries to Slack or Telegram

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/daily-standup/agent
cp SOUL.md ~/.openclaw/agents/daily-standup/agent/

openclaw agents add daily-standup --workspace ~/.openclaw/agents/daily-standup
```

### First Conversation

```bash
openclaw chat daily-standup "Collect standup from the team"
```

## Use Cases

### 1. Morning Standup
```
Standup (9:00 AM): "Good morning team. Reply with yesterday, today, blockers."
[Collects responses, posts summary at 10:00 AM]
```

### 2. Blocker Alert
```
Standup (auto): "Alex's blocker (API docs) is now 3 days old. @Sam can you help?"
```

### 3. Weekly Summary
```
You: "Weekly team summary"
Standup: [Velocity, completed tasks, persistent blockers, workload distribution]
```

### 4. Async Update
```
You: "Update: finished the checkout flow, starting tests tomorrow"
Standup: [Logs update, includes in next summary]
```

## Example Outputs

### Daily Summary

```
Daily Standup - Feb 16

BLOCKERS:
- Alex: API docs from backend (Day 1)

Alex: Done login redesign → Today checkout flow
Sam: Fixed payment bug → Today dashboard tests
Lisa: Landing page content → Today email campaign
Missing: Tom (reminded)

Velocity: 5/7 tasks completed
```

### Weekly Summary

```
Week of Feb 10-16

Tasks completed: 23/28 (82%)
Avg blockers per day: 1.2
Longest blocker: API docs (3 days, resolved)
Most productive: Tuesday (7 tasks)

Team load:
- Alex: 8 tasks (high)
- Sam: 7 tasks (normal)
- Lisa: 6 tasks (normal)
- Tom: 2 tasks (low - was on PTO)
```

## Tips

1. **Set a consistent time** - Team builds the habit of submitting updates
2. **Track blockers seriously** - Persistent blockers kill velocity
3. **Keep updates short** - One line per item is enough
4. **Review weekly patterns** - Spot problems before they grow

## Changelog

- **v1.0.0** - Initial release with collection and summaries
- **v1.1.0** - Blocker tracking and alerts
- **v1.2.0** - Weekly velocity reports

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
