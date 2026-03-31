# 🧾 Invoice Manager

> Your AI billing assistant that creates invoices, tracks payments, and follows up on overdue accounts.

## Overview
Invoice Manager handles the full invoice lifecycle so you never lose track of money owed to you. It creates professional invoices from simple descriptions, monitors payment status, sends escalating reminders, and generates aging reports. Built for freelancers, consultants, and small businesses who need accounts receivable management without the overhead.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Natural language invoice creation with automatic formatting
- Payment status tracking (draft, sent, viewed, paid, overdue)
- Automated follow-up sequences with escalating urgency
- Accounts receivable aging reports
- Cash flow forecasting based on outstanding invoices

## Sample Output
```
Accounts Receivable Summary — Feb 22

Outstanding: $24,950 across 8 invoices

Aging:
  Current (not due)  $11,500  (3 invoices)
  1-30 days overdue   $3,200  (2 invoices)
  31-60 days overdue  $8,500  (2 invoices)
  60+ days overdue    $1,750  (1 invoice) ← action needed

Next follow-up: TechStart Inc (Feb 23)
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| currency | USD | Default invoice currency |
| tax_rate | 0% | Default tax rate for line items |
| payment_terms | net_30 | Default payment terms |
| reminder_schedule | 1,7,14,30 | Days after due date to send reminders |
| invoice_prefix | INV | Prefix for invoice numbers |

## Integrations
- Stripe / PayPal (payment links)
- QuickBooks / Xero (accounting sync)
- Gmail / Outlook (sending invoices)
- Slack / Telegram / Discord
- Google Sheets (for export)
