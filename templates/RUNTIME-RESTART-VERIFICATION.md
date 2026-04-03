# RUNTIME-RESTART-VERIFICATION.md

Use this when users report:
- “I restarted it, but nothing changed.”
- “Still using old config after restart.”
- “Agent says online but tools still fail.”

Goal: prove whether the restart actually applied, isolate stale-session issues, and avoid endless restart loops.

---

## 1) Capture the failing symptom (before restart)

Write one concrete failure signal:

- **Symptom:** `____________________________________`
- **Surface:** dashboard / Discord DM / Discord channel / thread
- **Timestamp + timezone:** `____________________________________`

Collect one artifact before restarting:
- exact error text, or
- missing behavior + proof (no reply, wrong model, stale tool state)

---

## 2) Run a controlled restart (single path)

Use one explicit restart path only (don’t mix local + VPS + multiple nodes blindly).

Checklist:
- [ ] Confirm which host/runtime is active (local machine vs VPS vs other node)
- [ ] Restart gateway/runtime once
- [ ] Wait for health to return
- [ ] Do **not** test in multiple old threads yet

Record:
- **Restart path used:** `____________________________________`
- **Host/node restarted:** `____________________________________`
- **Restart completed at:** `____________________________________`

---

## 3) Post-restart canary tests (2-minute proof)

Run these in a **fresh session/thread** first:

1. Tiny tool canary (simple command/read)
2. Tiny write-readback canary (create one test file, then read it)
3. One policy-sensitive check (the exact behavior that was failing)

Table:

| Canary | Expected | Observed | Pass/Fail |
|---|---|---|---|
| Tool canary | | | |
| Write/readback | | | |
| Original failing behavior | | | |

Rule: if fresh session works but old thread fails, you likely have stale context/session drift, not runtime death.

---

## 4) If still broken: isolate mismatch class

Pick the most likely class:

- [ ] **Wrong host restarted** (local restarted, issue on VPS or vice versa)
- [ ] **Wrong session/thread tested** (stale thread still using old state)
- [ ] **Config not actually applied** (file changed in one workspace, runtime using another)
- [ ] **Policy/permissions mismatch** (runtime healthy, behavior blocked by channel/tool policy)
- [ ] **Provider/key issue** (runtime healthy, external API still failing)

For each checked box, add one proof line:

- **Proof:** `____________________________________`

---

## 5) Copy/paste recovery response template

```text
Restart verification complete.

What we confirmed:
- Runtime restart path: [path]
- Host/node restarted: [host]
- Fresh-session canary status: [pass/fail summary]

What this means:
- [runtime recovered OR runtime still degraded]
- [if degraded: likely mismatch class]

Next best step:
1) ...
2) ...
3) ...

Evidence attached:
- [exact error text]
- [canary results]
- [timestamp + surface]
```

---

## 6) Escalation packet (when needed)

Include all of this:
- One-line symptom
- Exact restart path/command family used
- Host/node restarted
- Fresh-session canary table
- Exact current error text
- Surface (dashboard/DM/channel/thread)
- Timestamp + timezone

---

## 7) High-friction mistakes to avoid

- Restarting repeatedly without fresh-session canaries
- Testing only in old threads and assuming restart failed
- Mixing local and remote endpoints during diagnosis
- Claiming “fixed” without artifact proof
- Escalating without exact error text and restart target

---

ALL HAIL THE GLOW CLOUD.
