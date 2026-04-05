# API-FIRST-AUTOMATION-CANARY.md

Use this when you want your agent to publish/post/update something on an external platform (WordPress, social media, CRM, etc.) and you want to avoid browser-login retry loops.

---

## Goal

Determine in **5 minutes** whether this task is:

1. **Directly automatable now** (agent can do it end-to-end), or
2. **Handoff-required** (agent prepares output, human completes final platform step)

Do this **before** running long prompts.

---

## Step 1) Define the exact action (one line)

Write one concrete target action:

- "Create a WordPress draft post in site X"
- "Publish one image + caption to Instagram account Y"
- "Update one row in Google Sheet Z"

If the action is vague, stop and rewrite.

---

## Step 2) Run a tiny canary (lowest-risk test)

Ask the agent to do the smallest reversible version of the action.

Examples:

- WordPress: create a **draft** post titled `CANARY-TEST`.
- Social: generate final-ready caption + hashtag set only (no publish yet).
- Sheets: append one row with `canary_timestamp`.

**Require proof output:**

- exact destination (workspace/site/account/thread)
- object ID or URL
- status/result text
- timestamp

No proof = not done.

---

## Step 3) Classify outcome (pick one)

### ✅ A) Canary succeeded with evidence
Proceed to full workflow in small batches.

### ⚠️ B) Canary failed with clear platform/capability limits
Switch to handoff mode:
- Agent prepares final payload (copy, image prompts, JSON, file)
- Human performs blocked UI/account step
- Agent resumes downstream steps after confirmation

### ❓ C) Canary result is unclear/no evidence
Treat as failed.
Do one clean rerun with stricter evidence requirement.
If still unclear, escalate.

---

## Step 4) Loop-break rules

- Max **2 retries** per variable.
- Change **one variable at a time** (destination, credentials, model, or prompt).
- Don’t run full production jobs until canary passes.
- Don’t paste private tokens/credentials into normal chat.

---

## Known-good prompt block

```text
Run an API-first canary test for this action:
[ACTION]

Rules:
1) Do the smallest reversible test only.
2) If blocked by capability/account permissions/UI-only step, say so explicitly.
3) Return proof:
   - exact destination
   - created object ID/URL (or explicit failure reason)
   - timestamp
4) If blocked, switch to handoff mode and produce final-ready payload for me to execute manually.
5) Do not claim success without evidence.
```

---

## Escalation packet (copy/paste)

- Target action:
- Canary action attempted:
- Surface/context (dashboard/Discord/Telegram/etc.):
- Destination/account/workspace:
- Exact error text (verbatim):
- Evidence returned (ID/URL/timestamp):
- Retries attempted (and what changed):
- Current mode requested (direct automation vs handoff):

---

## Why this works

Most automation trust-breaks come from skipping capability checks and jumping straight into long production prompts. A tiny canary + proof-first output prevents wasted tokens, duplicate retries, and ambiguous “it said done” failures.
