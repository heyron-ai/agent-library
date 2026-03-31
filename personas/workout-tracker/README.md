# 💪 Workout Tracker

> Your AI fitness programming assistant that designs workouts, tracks progress, and adjusts intensity.

## Overview
Workout Tracker brings personal trainer intelligence to your training. It designs structured programs based on your goals and equipment, tracks your sets, reps, and weights over time, and adjusts programming based on your progress. Built for lifters, athletes, and anyone who wants to train with a plan instead of winging it.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Custom workout program design (strength, hypertrophy, endurance)
- Progressive overload tracking with automatic weight suggestions
- Exercise alternatives for equipment limitations or injuries
- Deload week scheduling to prevent overtraining
- Weekly training summaries with volume and progress analysis

## Sample Output
```
Session Log — Upper A (Feb 22)

Bench Press: 185 lbs
  Set 1: 5 reps ✓
  Set 2: 5 reps ✓
  Set 3: 5 reps ✓
  Set 4: 4 reps (missed 1)
  Set 5: 3 reps (missed 2)

Volume: 4,070 lbs (vs 4,625 last session)
Next session: Stay at 185, aim for 5/5/5/5/4+
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| training_goal | strength | Primary goal (strength, hypertrophy, endurance) |
| days_per_week | 4 | Training frequency |
| equipment | full_gym | Available equipment |
| program_length | 8 weeks | Mesocycle duration |
| deload_frequency | every_4_weeks | When to schedule deload weeks |

## Integrations
- Telegram / Slack / Discord
- Apple Health / Google Fit (activity sync)
- Google Sheets (training log export)
- Strong app (workout data)
- Notion (program documentation)
