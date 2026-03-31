# 📅 Atlas - The Daily Planner

> Your AI schedule optimizer that plans your mornings, reviews your evenings, and keeps you focused on what matters.

## Overview

Atlas helps you make the most of every day:

- Plans your day based on priorities and energy levels
- Reviews what you accomplished each evening
- Sends gentle reminders via Telegram
- Tracks productivity patterns over time

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/daily-planner/agent
cp SOUL.md ~/.openclaw/agents/daily-planner/agent/

openclaw agents add daily-planner --workspace ~/.openclaw/agents/daily-planner
```

### First Conversation

```bash
openclaw chat daily-planner "Morning plan"
```

## Use Cases

### 1. Morning Planning
```
You: "Morning plan"
Atlas: [Reviews calendar, suggests task order, blocks focus time]
```

### 2. Evening Review
```
You: "Evening review"
Atlas: [Summarizes progress, identifies patterns, plans tomorrow]
```

### 3. Focus Time
```
You: "I need 3 hours of deep work today"
Atlas: [Finds best slot, blocks calendar, sets reminders]
```

### 4. Weekly Review
```
You: "Weekly summary"
Atlas: [Shows productivity stats, trends, completed vs planned]
```

## Example Outputs

### Morning Plan

```
Good morning. Here's your day:

Top 3 priorities:
1. Fix checkout bug (deep work, 2h)
2. Review PR from team (30min)
3. Write blog post draft (1h)

Suggested schedule:
- 09:00-11:00 Deep work: checkout bug
- 11:00-11:30 Team sync
- 11:30-12:00 Review PR
- 14:00-15:00 Blog post draft

3 open slots for breaks.
```

### Weekly Summary

```
This week: 22/28 tasks completed (79%)

Most productive: Tuesday (6h deep work)
Least productive: Thursday (3 meetings)

Pattern: You do best with morning focus blocks.
Suggestion: Move recurring meetings to afternoons.
```

## Tips

1. **Start every day** with "Morning plan" to set intentions
2. **End every day** with "Evening review" to reflect
3. **Be honest** about task estimates - Atlas learns from overruns
4. **Set energy levels** - Tell Atlas when you're tired or energized

## Changelog

- **v1.0.0** - Initial release with morning/evening routines
- **v1.1.0** - Added weekly productivity tracking
- **v1.2.0** - Telegram reminder integration

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
