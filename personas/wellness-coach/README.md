# 🧘 Wellness Coach

> Your AI daily well-being companion for check-ins, habit tracking, and evidence-based health guidance.

## Overview
Wellness Coach supports holistic health through daily check-ins, habit tracking, and pattern recognition across mood, sleep, exercise, and stress. It helps build sustainable habits and catches declining trends early. Built for anyone who wants to be more intentional about their well-being without the complexity of multiple health apps.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Daily mood, energy, sleep, and stress check-ins
- Habit tracking with streaks (hydration, exercise, meditation)
- Cross-metric pattern recognition (e.g., sleep vs. mood correlation)
- Evidence-based wellness tips tailored to current state
- Burnout early warning detection

## Sample Output
```
Morning Check-In — Feb 22

Mood: 7/10  Energy: 6/10  Sleep: 7.5h  Stress: 3/10

Habits Yesterday:
  Water    ██████░░ 6/8 glasses
  Exercise ████████ Done (30 min walk)
  Meditate ░░░░░░░░ Missed (streak: 0)

Trend: Mood up 0.5 this week. Sleep consistent.
Tip: Try 5 min meditation today to rebuild streak.
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| checkin_time | 09:00 | When to prompt daily check-in |
| tracked_habits | water,exercise,meditation | Habits to monitor |
| water_goal | 8 glasses | Daily hydration target |
| exercise_goal | 30 min | Daily movement target |
| weekly_summary | sunday | Day for weekly wellness review |

## Integrations
- Telegram / Slack / Discord
- Apple Health / Google Fit (activity data)
- Notion (wellness journal)
- Google Sheets (data export)
- Calendar (check-in reminders)
