# RUNTIME-500-502-INCIDENT-TRIAGE.md

Use this when your agent suddenly throws errors like:

- `runtime is still not healthy (health 502)`
- `Gateway tool invoke failed: 500`
- model switch fails even on known-good models

Goal: **separate local/session issues from probable platform/runtime incidents in under 5 minutes**.

---

## 1) Capture Exact Evidence First (No Guessing)

Before retries, capture:

- Exact error text (copy/paste, no paraphrase)
- Local time + timezone
- Surface used (Dashboard / Discord DM / Discord server / Telegram)
- Action that triggered it (model switch, tool run, file write, etc.)

If possible, collect **both** first failure and latest failure timestamps.

---

## 2) Run a Tiny Canary (One Variable at a Time)

Ask the agent:

> "Run a tiny no-tool canary: reply with exactly `CANARY_OK` and current runtime status if available. Then stop."

Interpretation:

- **Canary fails with 500/502** → likely runtime/platform-side issue
- **Canary succeeds but your task fails** → likely task/config/session-specific issue

Do not run broad prompts yet.

---

## 3) Fresh Session Retest (Loop Break)

Start a fresh session/thread and run only:

1. The same tiny canary
2. One known-good minimal action (e.g., short plain-text response)

If both fail similarly, this strongly points to runtime health issues over prompt quality.

---

## 4) Model-Switch Isolation (If Relevant)

If failures happen during model changes:

- Test one **known-good same-family** model first
- Temporarily remove complex fallback chains
- Retry once in fresh session

If switching still fails with 500 while canary is unstable, treat as runtime incident.

---

## 5) Runtime/Service Recovery (Single Clean Attempt)

Do **one** clean restart/recovery attempt (per your environment process).

Then rerun:

- tiny canary
- one minimal known-good action

If still failing with same error class, **stop retry loops** and escalate.

---

## 6) Escalation Packet (Copy/Paste)

```txt
Issue: Runtime/model action failing with 500/502

First seen (local time + timezone):
Latest seen:

Surface/context:
Action attempted:

Exact error #1:
Exact error #2 (if different):

Fresh session canary result:
Minimal known-good action result:

Any restart/recovery attempted: yes/no
If yes, what changed after restart:

Model involved (if model-switch related):
Fallbacks enabled during test: yes/no

Notes:
```

---

## Common Mistakes to Avoid

- Repeating large prompts before canary test
- Mixing multiple config changes at once
- Assuming model ID is bad without runtime-health proof
- Retrying blindly for long periods instead of escalating with evidence

---

## Known-Good Recovery Prompt

```txt
Treat this as a 500/502 incident triage.
1) Return exact current error text (if present).
2) Run tiny canary: reply only CANARY_OK plus runtime-status note.
3) If canary fails, stop and output escalation packet fields with what you know.
4) If canary passes, run one minimal known-good action and report pass/fail.
Do not run broad tasks yet.
```

Use this file as a fast loop-break when incident symptoms appear cluster-wide or persist across fresh sessions.
