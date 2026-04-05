# GOOGLE-WORKSPACE-CONNECTOR-CANARY.md

Use this when Google Drive/Gmail/Calendar says **"connected"** but your agent still can’t read, send, or list anything.

Goal: prove the exact failure in **5 minutes** before retry loops.

---

## 0) Rules (read first)

- Change **one variable at a time** (account, surface, scope, then retest)
- Don’t reconnect 10 times in a row without a proof step
- Capture exact error text (copy/paste, no paraphrase)
- Use one active chat surface during testing (Dashboard **or** Discord/Telegram), not both

---

## 1) Identity Proof (2 minutes)

Ask your agent to return:

1. Active surface/session context
2. Which Google account is currently authorized
3. Which connector scopes/capabilities are visible right now

If any item is missing/unclear, stop and reconnect once with the correct account.

---

## 2) Tiny Canary Tests (run in this order)

### A) Drive canary

"List exactly 3 files from my Google Drive root and return: file name + modified time."

### B) Gmail canary

"Create a draft email to myself with subject 'CANARY-{{today}}' and body 'google connector canary'. Return draft ID."

### C) Calendar canary

"List next 3 events in my primary calendar for the next 7 days with start times + timezone."

If a canary fails, return:

- Exact failing step
- Exact raw error text
- Whether this fails in one surface or all surfaces

---

## 3) Fast Mismatch Checks

### Account mismatch

- Authorized wrong Google account
- Personal account vs Workspace account mismatch

### Scope mismatch

- Connected with limited scopes (e.g., read-only when send/write is needed)
- Consent flow interrupted before all scopes were granted

### Surface/session mismatch

- Connected in one surface but testing in another stale session
- Old thread/session still using stale auth context

### Window/timezone mismatch (Calendar)

- Looking at wrong date range
- Wrong timezone interpretation

---

## 4) One Clean Reconnect (only once)

Do exactly one controlled reconnect:

1. Disconnect connector
2. Reconnect with the intended Google account
3. Complete consent/security prompts fully
4. Start a fresh session
5. Re-run all 3 canaries

If still failing, escalate with evidence below.

---

## 5) Escalation Packet (copy/paste)

```text
Google Workspace Connector Escalation

Surface tested:
Session/thread link or ID:
Google account used (masked):
Connector(s): Drive / Gmail / Calendar

Drive canary result:
Gmail canary result:
Calendar canary result:

Exact error text:
When it happened (local + UTC):
What changed right before failure:

Reconnect attempted once? yes/no
Post-reconnect canary results:

Expected behavior:
Actual behavior:
```

---

## 6) Loop-Break Rule

If the same exact error repeats after one controlled reconnect + fresh session, **stop retrying** and escalate with packet evidence.

Repeated reconnects without new evidence waste time and can trigger additional security/rate checks.
