# SUPPORT-ROUTING-QUICKMAP.md

Use this when users are unsure **where** to ask for help and keep bouncing between channels.

## Goal
Route users to the correct support path on the first try, with enough evidence for fast triage.

## 60-Second Routing Decision

1. **If it’s an active breakage/error** (agent fails, no reply, setup blocked):
   - Send to: **https://heyron.ai/support**
   - Require: exact error text + one tiny repro prompt + where it failed (dashboard/DM/server)

2. **If it’s a quick usage question** (how-to, best practice, clarification):
   - Send to: **hop-in-help**
   - Ask for: one-sentence goal + what they already tried

3. **If they already have a ticket and need follow-up/escalation:**
   - Send to: **The-Bunny-Signal**
   - Require: ticket URL/ID + one fresh repro result

4. **If they need fix-specific triage flow:**
   - Send to: **The-FixIt-Den**
   - Ask for: exact error + timestamp/timezone + surface

## Copy/Paste Message for Users

```text
Got you — fastest path:

• Active error/blocker: open https://heyron.ai/support
• Quick “how do I…” question: use hop-in-help
• Already have a ticket: post in The-Bunny-Signal with your Ticket URL/ID
• Fix-specific triage flow: use The-FixIt-Den

Please include:
1) exact error text
2) where it failed (dashboard / Discord DM / server)
3) tiny repro prompt used
4) timestamp + timezone
```

## Anti-Loop Rules

- Do **not** open duplicate tickets for the same issue.
- If no response yet, follow up in the **same** ticket/thread with one fresh repro result.
- Avoid “it’s broken” only messages — always include exact error text.
- Redact API keys/tokens/secrets before posting screenshots.

## Minimal Evidence Packet

```text
Issue summary:
Exact error text:
Where it failed (dashboard / DM / server):
Tiny repro prompt:
Result:
Timestamp + timezone:
Ticket URL/ID (if exists):
```

## Done Criteria

- User is routed to exactly one active path.
- User posts a complete evidence packet.
- No duplicate-ticket/thread loop created.
