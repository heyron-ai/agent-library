# GMAIL-DELIVERY-PROOF-CHECKLIST.md

Use this when your agent says an email was sent, but the recipient says they never got it.

Goal: prove where delivery failed (sender identity, routing, recipient inbox rules, or org security) in under 5 minutes.

---

## 0) One-rule reset (stop loops)

- Do **one** canary send to **one** recipient.
- Do **not** reconnect Gmail repeatedly before collecting evidence.
- Do **not** test with multiple recipients until canary is verified.

---

## 1) Lock sender identity first

Ask your agent:

> "Before sending, confirm the exact From address and alias that will be used. Return it as plain text."

If From address/alias is wrong, fix sender identity first (wrong account/alias = false delivery failures).

---

## 2) Run a canary email test

Ask your agent to send this exact email:

- Subject: `CANARY-EMAIL-{{YYYY-MM-DD-HHMM}}`
- Body: `Canary delivery test. Reply with RECEIVED + timestamp.`

Require output proof from the agent:

- Exact `to` address used
- Exact `from` address used
- Subject line used
- Local timestamp + timezone of send

---

## 3) Recipient-side verification (required)

Have recipient check in this order:

1. Primary inbox
2. Promotions/Updates/Social
3. Spam/Junk
4. All Mail
5. Search by exact subject token: `CANARY-EMAIL-...`

If still missing, check:

- Forwarding rules that auto-move/archive
- Filters that skip inbox
- Organization quarantine/hold (Google Workspace admins)
- Plus-address mismatch (`name+tag@domain.com` vs `name@domain.com`)

---

## 4) Classify the failure (one variable at a time)

### A) Sender identity mismatch
- Agent used wrong account/alias
- Fix Gmail connector account scope and rerun one canary

### B) Recipient routing issue
- Email exists in All Mail/Spam/other tab but not Primary
- Fix recipient filters/rules and retest one canary

### C) Org security/quarantine
- Recipient is workspace-managed and message is held/quarantined
- Escalate with timestamp + subject token to domain admin/support

### D) No trace with correct sender + recipient checks complete
- Treat as connector/runtime incident and escalate with full packet below

---

## 5) Escalation packet (copy/paste)

```
Issue: Gmail send succeeded in agent response, recipient reports no delivery.

Canary Subject Token:
From Address Used:
To Address Used:
Send Time (local + timezone):
Surface/Session (dashboard/DM/server/thread):

Recipient checks completed (Primary/Promotions/Spam/All Mail/search):
Recipient forwarding/filter rules checked: yes/no
Workspace quarantine/hold checked: yes/no
Plus-address mismatch checked: yes/no

Exact agent output after send:
Exact error text (if any):
What changed since last known good:
```

---

## 6) Known-good recovery prompt

Use this prompt when loops start:

> "We are in Gmail delivery triage mode. Do not reconnect anything yet. Step 1: confirm the exact From address/alias you will use. Step 2: send one canary email with subject `CANARY-EMAIL-{{timestamp}}` to [recipient]. Step 3: return proof only: from, to, subject, timestamp/timezone. Step 4: wait for recipient-folder verification result before any next action."

---

If two clean canary tests fail with full proof packet, escalate once with evidence and stop retry loops.
