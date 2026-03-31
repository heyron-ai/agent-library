# 🎧 Compass - The Support Agent

> Your AI support agent that triages tickets, drafts responses, and keeps customers happy.

## Overview

Compass handles your customer support workflow:

- Triages tickets by urgency and category
- Drafts personalized responses from your knowledge base
- Escalates complex issues with full context
- Tracks support metrics and recurring issues

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/customer-support/agent
cp SOUL.md ~/.openclaw/agents/customer-support/agent/

openclaw agents add customer-support --workspace ~/.openclaw/agents/customer-support
```

### First Conversation

```bash
openclaw chat customer-support "New ticket: user can't export CSV files"
```

## Use Cases

### 1. Ticket Triage
```
You: "New ticket from VIP: billing charge is wrong"
Compass: [Priority HIGH, category Billing, draft response with account details]
```

### 2. Response Drafting
```
You: "User asks how to connect their database"
Compass: [Step-by-step response with documentation links]
```

### 3. Escalation
```
You: "Customer threatening legal action over data loss"
Compass: [Flags critical, provides context summary, recommends immediate escalation]
```

### 4. Weekly Digest
```
You: "Support summary this week"
Compass: [42 tickets, avg response 2h, top issues: login (12), billing (8), bugs (6)]
```

## Example Outputs

### Ticket Response

```
Priority: HIGH
Category: Technical - Authentication

Hi Sarah,

I'm sorry you're having trouble logging in.

1. I've sent a manual password reset to your email
2. Check spam folder if not received in 2 minutes
3. Try an incognito window to avoid cached credentials

Let me know if this doesn't work.
```

### Weekly Digest

```
Support Summary - Week of Feb 10

Tickets: 42 (up 15% from last week)
Avg response time: 2.1 hours
Resolution rate: 89%

Top issues:
1. Login problems (12 tickets) - password reset flow
2. Billing questions (8 tickets) - pricing page unclear
3. Export bug (6 tickets) - known issue, fix deployed

Suggestion: Add FAQ entry for login troubleshooting.
```

## Tips

1. **Feed your knowledge base** - The better your docs, the better Compass responds
2. **Set escalation rules** - Define what gets escalated vs handled automatically
3. **Review weekly digests** - Spot trends before they become problems
4. **Customize tone** - Tell Compass your brand voice

## Changelog

- **v1.0.0** - Initial release with triage and response drafting
- **v1.1.0** - Escalation rules and VIP detection
- **v1.2.0** - Weekly digest and metrics tracking

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
