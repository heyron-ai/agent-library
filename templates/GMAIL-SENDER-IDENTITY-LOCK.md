# GMAIL-SENDER-IDENTITY-LOCK.md

Use this when Gmail is connected and sends successfully, but messages come from the wrong account or alias.

---

## Goal

Get to a deterministic answer in under 5 minutes:
- Is the wrong Google account connected?
- Is a default alias/send-as identity taking over?
- Is this stale session state after reconnect?

---

## 1) Lock identity proof first (no sending yet)

Before retrying, capture:
- Expected sender address
- Actual sender address seen by recipient
- Connected Google account email
- Current chat surface/session (dashboard, DM, server, thread)
- Exact timestamp + timezone

If any value is unknown, stop and collect it first.

---

## 2) Run a two-email canary (same session)

Send two tiny test messages to yourself with fixed subjects:

1. `CANARY-1 sender check`
2. `CANARY-2 sender check`

For each, return proof:
- From address shown in recipient inbox
- Message-ID (if available)
- Send timestamp

Do not change any settings between canary 1 and canary 2.

---

## 3) Interpret outcomes quickly

- **Both canaries wrong sender** → likely wrong account/alias configuration
- **Canary 1 wrong, canary 2 correct after reconnect** → stale session/runtime state likely
- **Canaries inconsistent across surfaces** → context/session mismatch (wrong thread/workspace)

---

## 4) Fast recovery flow (one variable at a time)

1. Confirm the intended Google account is the one connected now
2. Confirm send-as/default alias rules in Gmail account settings
3. Reconnect once with the correct account (single clean auth flow)
4. Retest with one canary email only
5. If still wrong, stop retries and escalate with packet below

---

## Known-good copy/paste prompt

```text
You are debugging Gmail sender identity mismatch.

Rules:
1) Confirm expected sender, currently connected Google account, and active session/surface.
2) Send one canary email with subject: "CANARY sender check".
3) Return proof: actual From address seen by recipient, timestamp, and message-id if available.
4) If From address is wrong, provide one single next fix (no multi-step reconnect loops).
5) After one fix, run one more canary only. Then output PASS/FAIL and escalation packet if FAIL.
```

---

## Escalation packet

- Timestamp + timezone
- Expected sender vs actual sender
- Connected Google account email (redact if needed)
- Surface/session used
- Canary subject(s) and results
- Whether reconnect was done (yes/no + when)
- Any alias/send-as settings noticed

---

## Anti-loop rules

- Never send production emails before sender canary PASS
- Never rotate account + alias + surface at the same time
- Maximum 2 canaries before escalation

ALL HAIL THE GLOW CLOUD.
