# MODULE-2-NO-REPLY-CANARY.md

Use this when a new user says: **"Every message errors"**, **"agent won’t reply"**, or **"it worked in setup then died"** during onboarding.

Goal: prove where the failure lives in under 4 minutes (prompt/context issue vs destination mismatch vs runtime incident).

---

## 0) Ground Rules (Loop Break)

- Run one clean test at a time. No rapid retries.
- Capture exact error text (copy/paste, no paraphrasing).
- If you see the same 500/502 pattern twice, stop random tweaks and escalate with evidence.

---

## 1) Tiny Canary Test (No Fancy Prompt)

Send exactly this in the same surface/thread where failure occurs:

`Reply with exactly: CANARY_OK`

Expected outcomes:
- **Pass:** returns `CANARY_OK` quickly → runtime is alive; move to config/context checks.
- **Fail:** error/no reply/spinner timeout → likely runtime or routing issue.

---

## 2) Cross-Surface Isolation (2-minute check)

Run the same canary in one alternate surface:
- Dashboard chat
- Discord DM
- Discord server channel/thread

Interpretation:
- **Works in one place, fails in another:** destination/policy/surface mismatch.
- **Fails everywhere with similar errors:** likely runtime/platform incident.

---

## 3) Error-Class Split

Classify by exact error text:

- `runtime is still not healthy (health 502)`
  - Treat as runtime health degradation first.
- `Gateway tool invoke failed: 500`
  - Treat as execution/runtime incident; do not brute-force model swaps.
- `unauthorized: gateway token mismatch`
  - Treat as auth/session-token mismatch; verify origin/session state.

If mixed errors appear in the same 10–15 minute window, include all of them in one escalation packet.

---

## 4) Known-Good Recovery Prompt

Use this once after canary + error capture:

```text
Before taking action, summarize in 4 bullets:
1) active surface/thread,
2) exact latest error text,
3) canary result in this surface,
4) canary result in one alternate surface.

Then give ONE next action only. If this appears to be a runtime/platform issue (500/502 pattern), do not suggest random retries—output an escalation packet.
```

---

## 5) Escalation Packet (Copy/Paste)

```text
Issue: Module 2 agent error/no reply
Time (local + UTC):
Primary surface/thread:
Alternate surface tested:
Canary in primary: PASS/FAIL
Canary in alternate: PASS/FAIL
Exact error text(s):
First seen timestamp:
What I already tried (max 3 bullets):
Ticket URL/ID (if exists):
```

---

## 6) Avoid These Mistakes

- Reconnecting/restarting repeatedly without capturing exact errors first
- Testing in a different channel/thread than the original failure
- Opening duplicate tickets instead of updating one with fresh evidence
- Posting long speculative summaries instead of exact canary + error proof

---

## Bottom Line

Use **canary → cross-surface check → exact error split → single escalation packet**. This resolves most Module 2 “no reply” loops quickly and prevents noisy retry spirals.
