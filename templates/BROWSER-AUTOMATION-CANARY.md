# BROWSER-AUTOMATION-CANARY.md

Use this when users say things like:
- “I installed Chromium but it still can’t click.”
- “The agent can read pages, but can’t submit/login/publish.”
- “It keeps saying done, but the browser task didn’t happen.”

---

## Goal

In **5 minutes**, prove whether the current session can perform the exact browser action, or whether this task needs a human handoff.

---

## Step 1) Define one concrete browser action

Write one tiny, verifiable action:

- “Open page X and click button Y”
- “Log in and save one draft”
- “Fill one form field and stop before submit”

If it’s vague, rewrite it.

---

## Step 2) Run a tiny canary (not full workflow)

Ask for the smallest reversible test first.

**Required proof output:**
- exact page URL used
- exact action attempted
- observable result (what changed on page)
- one screenshot or text evidence
- timestamp

No proof = not done.

---

## Step 3) Classify result

### ✅ A) Canary succeeded with evidence
Proceed in small batches.

### ⚠️ B) Canary failed with capability/auth/checkpoint limits
Switch to handoff mode:
- Agent prepares final-ready payload (steps, copy, fields, assets)
- Human performs blocked browser step
- Agent resumes immediately after confirmation

### ❓ C) Canary unclear / vague “done” claim
Treat as failed. Re-run once with stricter proof requirement.

---

## Step 4) Loop-break rules

- Max **2 retries** per variable.
- Change only one variable at a time (session, account, browser context, destination).
- Do **not** run full production prompts before canary passes.
- Don’t keep reinstalling browser tooling without proof that session capability changed.

---

## Known-good prompt block

```text
Run a browser-automation canary for this action:
[ACTION]

Rules:
1) Perform only the smallest reversible step.
2) Return proof:
   - exact URL
   - exact action attempted
   - observable result
   - screenshot or explicit failure text
   - timestamp
3) If blocked (auth/CAPTCHA/policy/capability), say exactly what is blocked.
4) If blocked, switch to handoff mode and give me the minimal manual step + resume instruction.
5) Do not claim success without evidence.
```

---

## Escalation packet (copy/paste)

- Surface/context (dashboard / Discord / thread):
- Browser action attempted:
- URL/domain:
- Exact error text (verbatim):
- Proof returned (screenshot/text/timestamp):
- What changed between retries:
- Current status (automatable vs handoff-required):

---

## Why this works

Most browser-task failures are capability or checkpoint mismatch, not “bad prompts.”
A tiny canary + proof-first output prevents token burn, fake completion claims, and endless retry loops.
