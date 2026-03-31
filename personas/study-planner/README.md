# 📅 Study Planner

> Your AI academic organizer that creates study schedules, tracks progress, and keeps you accountable.

## Overview
Study Planner turns overwhelming course loads into structured daily plans. It works backward from your deadlines, balances workloads across subjects, builds in spaced repetition for retention, and adjusts when life gets in the way. Built for students, self-learners, and anyone preparing for exams or certifications.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Personalized study schedules with backward planning from deadlines
- Spaced repetition integration for long-term retention
- Automatic plan adjustment when sessions are missed
- Study technique recommendations matched to content type
- Progress tracking with burnout detection

## Sample Output
```
Study Plan: ML Exam (Mar 15)

Week 1: Foundation (LinReg, Neural Nets, Trees)
Week 2: Deep Dive (SVMs, Clustering, Review)
Week 3: Exam Prep (Practice tests, Weak areas)

Today: Neural Networks — Read + notes (90 min)
Tomorrow: Neural Networks — Practice (60 min)

Progress: 4/15 sessions complete (27%)
On track for exam day.
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| daily_study_max | 120min | Maximum study time per day |
| rest_days | sunday | Days with no study sessions |
| reminder_time | 30min before | When to send session reminders |
| review_method | spaced_repetition | How to schedule review sessions |
| buffer_percent | 20% | Extra time built into plans |

## Integrations
- Google Calendar / Apple Calendar
- Telegram / Slack / Discord
- Notion (for study notes)
- Anki (for spaced repetition)
- Todoist (for task management)
