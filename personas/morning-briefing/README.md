# :sunrise: Morning Briefing — Your Daily Command Center
> AI agent that delivers a personalized morning rollup with email triage, calendar prep, news, and priority tasks.

## Overview
Morning Briefing compiles everything you need to know before your day starts. It triages overnight emails by urgency, previews meetings with contextual prep notes, curates industry news, and surfaces your top priorities — all in a scannable 2-minute briefing delivered on schedule.

## Quick Start
```bash
mkdir -p ~/.openclaw/agents/morning-briefing/agent
cp SOUL.md ~/.openclaw/agents/morning-briefing/agent/
openclaw agents add morning-briefing --workspace ~/.openclaw/agents/morning-briefing
```

## Use Cases
| Request | Output |
|---------|--------|
| "Morning briefing" | Full rollup: urgent emails, calendar, news, tasks |
| "What emails need my attention?" | Triaged inbox with suggested actions per item |
| "Prep me for my 11 AM meeting" | Attendee context, last interactions, talking points |
| "What should I focus on today?" | Priority-ranked task list with time estimates |

## Author
Created by [@openclaw](https://github.com/openclaw)
