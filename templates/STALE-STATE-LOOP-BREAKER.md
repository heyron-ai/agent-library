# STALE-STATE-LOOP-BREAKER.md

Use this when you already fixed config/keys/rules but the agent keeps returning the **same old error**.

---

## Goal

Stop retry loops. Prove whether the issue is:

1. **Fixed but tested in stale context**, or
2. **Still genuinely broken**.

---

## 5-Minute Loop-Break Workflow

### 1) Lock the error fingerprint (do not paraphrase)
Capture exactly:
- Full error text
- Where it appears (surface/channel/thread)
- Timestamp + timezone

If the new run does **not** show the same exact fingerprint, treat it as a **different issue**.

### 2) Apply one fix only
Pick one fix and log it:
- What changed
- Where it changed
- When it changed

Do **not** stack multiple fixes before retesting.

### 3) Fresh-context canary test
Retest in a **fresh session/thread** with a tiny task:
- Same capability
- Minimal prompt
- No unrelated extras

If canary works in fresh context but fails in old context → stale-state confirmed.

### 4) Controlled restart (once)
If fresh canary still fails with same fingerprint:
- Perform one controlled restart/reload of the runtime/session
- Repeat the same canary once

No blind repeated restarts.

### 5) Decide and route
- **Canary passes:** continue with the real task in fresh context
- **Canary fails with same fingerprint:** escalate with proof packet below

---

## Known-Good Recovery Prompt (Copy/Paste)

```text
You are in stale-state recovery mode.

Task:
1) Repeat the exact current error fingerprint (full text) and timestamp.
2) List the single fix that was just applied.
3) Run one tiny canary test for the same capability in a fresh context.
4) Return only:
   - PASS/FAIL
   - exact error text (if fail)
   - one next action (either proceed or escalate)
Do not retry more than once.
```

---

## Escalation Packet (if still failing)

```text
Issue: Fixed-it-but-still-old-error loop

Exact error fingerprint:
- Error text: <paste exact>
- First seen: <timestamp + timezone>
- Latest seen: <timestamp + timezone>

Fix applied:
- Change made: <exact change>
- File/surface/location: <where>
- Applied at: <timestamp + timezone>

Canary proof:
- Fresh context used: <yes/no + where>
- Canary prompt/task: <one line>
- Result: <pass/fail>
- Exact output/error: <paste>

Restart proof:
- Restart performed: <yes/no>
- When: <timestamp + timezone>
- Post-restart canary result: <pass/fail>

Notes:
- Any surface mismatch (DM vs server, thread mismatch, old session reused): <details>
```

---

## Anti-Loop Rules

- Never claim “still broken” without exact error fingerprint.
- Never apply 3 fixes at once.
- Never rerun the full production task before canary PASS.
- If two canaries fail with identical fingerprint, escalate once with packet.

ALL HAIL THE GLOW CLOUD.
