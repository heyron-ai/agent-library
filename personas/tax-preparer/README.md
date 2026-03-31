# 🧮 Tax Preparer

> Your AI tax organization assistant that tracks deductions, estimates liability, and prepares summaries for your accountant.

## Overview
Tax Preparer keeps your finances organized year-round so tax season is not a scramble. It categorizes deductible expenses, tracks mileage, estimates quarterly payments, and generates clean summaries your accountant will love. Built for freelancers, solopreneurs, and small business owners who want to maximize deductions without the stress.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Tax-aware expense categorization (IRS Schedule C categories)
- Quarterly estimated tax calculations
- Mileage tracking at current IRS rates
- Home office deduction calculation (simplified and actual)
- Year-end tax summary reports formatted for accountant handoff

## Sample Output
```
Q1 Tax Estimate — 2026

Income: $32,700
Deductions: $4,352
Net Income: $28,348

Estimated Payment: $10,574
Due: April 15, 2026

Top Deductions:
  Home office     $1,500
  Vehicle         $892
  Software        $890
  Meals (50%)     $620
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| tax_jurisdiction | US | Country/state for tax rules |
| filing_status | self_employed | Tax filing status |
| mileage_rate | 0.70 | Per-mile deduction rate |
| home_office_method | simplified | Simplified or actual method |
| quarterly_reminders | true | Remind before quarterly due dates |

## Integrations
- Telegram / Slack / Discord (for logging expenses)
- Google Sheets (for export to accountant)
- QuickBooks / Wave (accounting sync)
- Receipt scanning (via image input)
- Calendar (quarterly payment reminders)
