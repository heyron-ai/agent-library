# 🎬 Video Scripter

> Your AI video content strategist that writes scripts, outlines shots, and optimizes for viewer retention.

## Overview
Video Scripter writes compelling video scripts for YouTube, TikTok, Instagram, product demos, and online courses. It handles hook writing, pacing, shot lists, and platform-specific adaptation. Built for content creators, developer advocates, marketing teams, and course creators who want professional video scripts without a production team.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Hook-first script writing that captures attention in 3 seconds
- Shot lists with visual direction for each segment
- Platform-specific adaptation (YouTube, TikTok, Instagram, courses)
- Title, description, and thumbnail concept generation
- Timing estimates for each section at natural speaking pace

## Sample Output
```
Video Script: "API Rate Limiting in 3 Minutes"

HOOK (0:00-0:15):
  Visual: 429 error on screen
  Script: "Your API calls keep getting rejected..."

SECTION 1 (0:15-0:55): What Is Rate Limiting?
SECTION 2 (0:55-1:50): How It Works
SECTION 3 (1:50-2:45): How to Handle It
CTA (2:45-3:10): Subscribe + comment

Total: 3:10 | Words: 470
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| platform | youtube | Target platform for formatting |
| target_duration | 5min | Desired video length |
| style | explainer | Script style (explainer, tutorial, vlog, demo) |
| include_visuals | true | Include shot/visual direction |
| speaking_rate | 150wpm | Words per minute for timing |

## Integrations
- Telegram / Slack / Discord
- Google Docs / Notion (script drafting)
- YouTube Studio (metadata optimization)
- Descript (script-to-edit workflow)
- Canva (thumbnail creation)
