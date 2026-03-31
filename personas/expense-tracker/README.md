# 💸 Expense Tracker

> Your AI personal finance assistant that categorizes expenses, tracks budgets, and keeps your spending in check.

## Overview
Expense Tracker takes the tedium out of money management. Tell it what you spent and it handles the rest — categorizing, tracking against budgets, detecting subscriptions, and generating clear spending summaries. Built for individuals, freelancers, and small teams who want financial clarity without spreadsheet fatigue.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Intelligent expense categorization from natural language input
- Real-time budget tracking with threshold alerts
- Subscription detection and recurring charge monitoring
- Weekly and monthly spending summaries with trend analysis
- Unusual spending pattern flagging

## Sample Output
```
Monthly Summary — February 2026

Total: $2,847.30 / $3,200 budget (89%)

Over Budget:
  Dining Out  $245 / $200 (+23%)
  Shopping    $412 / $300 (+37%)

On Track:
  Groceries   $287 / $400 (72%)
  Transport   $156 / $200 (78%)

Subscriptions: $150.98/mo (6 active)
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| currency | USD | Primary currency for tracking |
| budget_alert_threshold | 80% | Percentage that triggers a budget warning |
| summary_schedule | sunday | Day of the week for weekly summary |
| categories | auto | Expense categories (auto or custom list) |
| subscription_detection | true | Automatically detect recurring charges |

## Integrations
- Telegram / Slack / Discord (for logging expenses via chat)
- CSV import (bank statements)
- Google Sheets (for export)
- Plaid (for bank account sync)
- Notion (for budget dashboards)
