# CLIENT-DATA-REDACTION-CHECKLIST.md

Use this before you paste client/customer data into an agent.

## Goal
Share only the **minimum necessary** details for the task while protecting personal, financial, legal, and account-level data.

## 2-Minute Redaction Flow

### 1) Define the task in one line
- What are you asking the agent to do?
- What exact output do you need?

If the task can be completed without raw personal data, do that first.

### 2) Classify data before pasting
Mark each item as:
- **SAFE** — public info, generic examples, non-identifying details
- **LIMITED** — internal business context that is not personally identifying
- **REDACT** — anything identifying, financial, legal, credential-related, or medical

### 3) Never paste these directly
- API keys, passwords, recovery codes, session tokens
- Full names + email + phone + address in one block
- Payment card numbers, bank/account details, tax IDs
- Government IDs, passport/driver’s-license numbers
- Medical records or highly sensitive client notes
- Private links that reveal account/session access

### 4) Replace sensitive values with placeholders
Use consistent tokens so the agent can still reason correctly:
- `[CLIENT_NAME]`
- `[CLIENT_EMAIL]`
- `[ORDER_ID]`
- `[INVOICE_TOTAL]`
- `[ADDRESS_CITY]`
- `[DATE_YYYY_MM_DD]`

### 5) Keep precision where needed
Redact identifiers, but keep structure:
- Keep date formats, currency formats, and sequence/order
- Keep issue chronology (what happened first/next)
- Keep relevant error codes/messages

### 6) Ask for a redaction check before processing
Paste this prompt first:

```text
Before solving this, identify any sensitive fields in my message and propose a redacted version. Do not use or repeat raw secrets. Then complete the task using only redacted placeholders.
```

### 7) Output safety contract (add to prompt)
```text
Do not echo sensitive values. If needed, reference placeholders only. If you think more private data is required, ask for the smallest specific field and explain why.
```

## Known-Good Working Prompt

```text
Task: [one-line task]
Output needed: [exact format]

Use this redacted data only:
[paste redacted block]

Rules:
1) Do not request or output secrets unless absolutely required.
2) If blocked, ask for the minimum additional field only.
3) Return final answer with placeholders preserved.
```

## Fast Self-Check (30 seconds)
Before sending, confirm:
- [ ] No credentials/tokens/passwords included
- [ ] No full identity bundle (name + contact + address + account IDs)
- [ ] Only minimum fields needed for the task
- [ ] Placeholders are consistent and readable
- [ ] Prompt includes “do not echo sensitive values” rule

## If You Already Shared Too Much
1. Stop and avoid adding more details.
2. Ask the agent to summarize only redacted placeholders.
3. Rotate/replace any exposed credentials immediately.
4. Move the task to a private/safe channel if currently in a shared chat.
5. Use a fresh prompt with a strict redaction contract.

## Escalation Packet (if something still feels unsafe)

```text
Issue type: [overshared data / secret echoed / unsafe request for more data]
Where it happened: [dashboard / DM / server channel / thread]
Timestamp + timezone:
What was requested:
What was shared (redacted summary only):
What the agent returned (redacted):
What safeguard prompt you used:
```

---

Use this checklist every time you handle customer/client data. Redaction first, execution second.
