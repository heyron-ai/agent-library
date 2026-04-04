# TICKET-REOPEN-EVIDENCE-PACKET

Use this when support marked your issue **resolved** but the problem is still reproducible.

Goal: reopen once, with enough proof that support can act immediately (instead of asking 6 follow-ups).

---

## 1) Reproduce Once (Fresh)

Do one clean retest before reopening.

- Start a **fresh session/thread** in the same surface where the issue happens.
- Run the **smallest possible canary** that should succeed.
- If it fails, capture evidence and stop retry loops.

> Do not spam retries. One high-quality repro beats ten noisy ones.

---

## 2) Capture the 6 Required Facts

Include all six. Missing any of these usually causes back-and-forth.

1. **Expected behavior** (1 sentence)
2. **Actual behavior** (1 sentence)
3. **Exact error text** (copy/paste, no paraphrase)
4. **Where it happened** (Dashboard / Discord DM / Discord channel / thread / other)
5. **When it happened** (timestamp + timezone)
6. **Repro steps** (numbered, minimal)

---

## 3) Context Integrity Checks (Quick)

Before reopening, rule out context mismatch:

- Same account/workspace as original ticket
- Same destination/surface being tested
- No stale old thread carrying unrelated context
- If config changed, note exactly what changed + when

If any of these differ from the original report, say so explicitly.

---

## 4) Reopen Message Template (Copy/Paste)

```text
Reopening this ticket — issue is still reproducible.

Expected:
[one sentence]

Actual:
[one sentence]

Exact error text:
[full error text]

Where:
[surface + channel/thread if applicable]

When:
[YYYY-MM-DD HH:MM TZ]

Minimal repro steps:
1) ...
2) ...
3) ...

What I already tried:
- Fresh session/thread: [yes/no]
- One clean retest only: [yes/no]
- Any config changes since last update: [none OR list]

Please continue from this repro state.
```

---

## 5) Loop-Break Rules

Use these to avoid getting stuck:

- **No duplicate reopen messages** unless new evidence appears.
- If support asks for the same info again, resend with clearer formatting (don’t argue).
- If the ticket is re-marked resolved without addressing your exact repro, reply once with updated timestamp + same repro packet.

---

## 6) High-Friction Cases

### A) “Works in DM, fails in server channel”
Include both results side-by-side and the exact channel/thread.

### B) “It worked yesterday”
Include what changed since then (model, key, settings, permissions, destination, new thread).

### C) “No explicit error, just silence”
Include proof of canary attempt and what did/didn’t appear (typing indicator, empty response, timeout behavior).

---

## 7) Escalation-Ready Add-ons (Optional but strong)

If available, add:

- Screenshot of error state
- Job/ticket/thread ID
- Last known good timestamp
- Comparison test (works in one surface, fails in another)

---

## Bottom Line

When a ticket is closed too early, **reopen with one clean repro packet**.
That gives support a concrete, actionable failure state and reduces delay.
