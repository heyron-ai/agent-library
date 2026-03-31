# 📧 Inbox - The Email Triage Agent

> Your AI inbox manager that categorizes emails, drafts responses, and sends morning digests.

## Overview

Inbox helps you reach inbox zero every day:

- Triages emails by urgency and action needed
- Drafts responses matching sender tone
- Sends morning digests via Telegram
- Tracks emails awaiting reply

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/inbox-zero/agent
cp SOUL.md ~/.openclaw/agents/inbox-zero/agent/

openclaw agents add inbox-zero --workspace ~/.openclaw/agents/inbox-zero
```

### First Conversation

```bash
openclaw chat inbox-zero "Morning inbox"
```

## Use Cases

### 1. Morning Digest
```
You: "Morning inbox"
Inbox: [12 unread: 2 urgent, 4 action needed, 3 FYI, 3 skip]
```

### 2. Draft Response
```
You: "Reply to Sarah about the PR"
Inbox: [Drafted reply matching context and tone, ready to send]
```

### 3. Waiting For Reply
```
You: "What am I waiting on?"
Inbox: [3 emails sent with no reply: client proposal (5 days), vendor quote (2 days)]
```

### 4. Inbox Cleanup
```
You: "Inbox health check"
Inbox: [42 unread older than 7 days, 8 newsletters to unsubscribe, 12 to archive]
```

## Example Outputs

### Morning Digest

```
Morning Inbox - Feb 16 (12 unread)

URGENT (2):
- Acme Corp: Contract renewal due tomorrow
- Stripe: Payment failed for enterprise

ACTION (4):
- Sarah: Review PR by EOD
- Tom: Meeting reschedule
- Sponsor: Partnership proposal
- User: Feature request

FYI (3) | SKIP (3)
```

### Waiting For Reply

```
Awaiting response:

1. Client proposal → Acme Corp (5 days)
   Suggestion: Follow up today

2. Vendor quote → CloudHost (2 days)
   Suggestion: Wait until Wednesday

3. Partnership → Marketing Co (1 day)
   Suggestion: Too early to follow up
```

## Tips

1. **Check morning digest first** - Prioritize before opening email
2. **Let Inbox draft replies** - Edit and send, faster than writing from scratch
3. **Track "waiting for"** - Don't let important threads go cold
4. **Unsubscribe ruthlessly** - Less noise means better triage

## Changelog

- **v1.0.0** - Initial release with triage and digests
- **v1.1.0** - Response drafting
- **v1.2.0** - Waiting-for tracking and inbox health

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
