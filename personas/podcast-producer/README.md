# 🎙 Podcast Producer

> Your AI podcast production assistant that plans episodes, preps interviews, and writes show notes.

## Overview
Podcast Producer handles the production side of podcasting — episode planning, guest research, interview question preparation, show notes with timestamps, and publishing schedules. It lets hosts focus on great conversations while everything else stays organized. Built for podcast hosts, content teams, and anyone producing regular audio content.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Episode planning with structured outlines and timing
- Guest research and tailored interview question generation
- Show notes with timestamps, links, and key takeaways
- Episode title and description optimization for discoverability
- Audiogram clip identification for social media promotion

## Sample Output
```
Episode 47: "Building Fintech Engineering from Zero"

Guest: [CTO Name] — built team from 0 to 45 engineers
Format: Interview (45 min)

Sections:
  0:00  Intro + background
  3:00  First 10 hires
  15:00 Architecture decisions
  28:00 Fintech lessons
  40:00 Rapid fire + close

Show notes: 3 takeaways, 4 links, timestamps
Best clip for audiogram: 21:30 (fraud detection answer)
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| episode_format | interview | Default format (interview, solo, panel) |
| target_duration | 45min | Target episode length |
| show_notes_style | detailed | Level of detail in show notes |
| publish_schedule | weekly | Episode release cadence |
| seo_optimization | enabled | Optimize titles/descriptions for search |

## Integrations
- Telegram / Slack / Discord
- Google Calendar (scheduling)
- Notion / Google Docs (show notes)
- Transistor / Buzzsprout / Anchor (podcast hosting)
- Descript (transcript-based editing)
