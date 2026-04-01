# EXECUTION-EVIDENCE-CHECKLIST.md

Use this when users report:
- “The agent said it was done, but nothing actually changed.”
- “It keeps saying completed without proof.”
- “I approved it and still can’t tell what happened.”

Goal: force a clear **claim → evidence → verification** loop.

---

## 1) Define the exact completion claim

Write one sentence:
- **Task:**
- **Expected output artifact:** (file, commit, message, screenshot, URL, log line)
- **Done means:** (specific, observable condition)

Example:
- Task: “Add a reminder tutorial card to tutorials/index.html”
- Artifact: updated HTML file + git commit hash
- Done means: card appears in file and commit exists on `origin/main`

---

## 2) Require evidence in the same reply as the completion claim

When the agent says “done,” require:

- **What changed:** exact file paths or resources
- **Proof snippet:** relevant lines/output, not just narrative
- **Verification command/check:** how to confirm independently
- **If blocked:** exact blocker (approval, permission, missing key, network)

If any of these are missing, treat status as **NOT DONE**.

---

## 3) Fast classification (60 seconds)

### A) `CLAIM_ONLY` (no evidence)
Action:
- Ask for concrete proof artifacts (paths + outputs + checks)

### B) `PLAN_NOT_EXECUTION` (future tense, no action)
Action:
- Ask for actual execution with tool output
- Require final answer to include evidence artifacts

### C) `APPROVAL_BLOCKED`
Action:
- Confirm exact command awaiting approval
- Approve/deny based on command safety
- Re-check evidence after approval

### D) `WRONG_DESTINATION`
Action:
- Confirm output context (dashboard vs Discord, DM vs channel, repo branch)
- Verify in the correct destination

### E) `PARTIAL_DONE`
Action:
- Split done items vs pending items
- Track each pending item with required artifact

---

## 4) Approval-required guardrail

If execution needs approval, require the agent to include:
- The **exact** approval command text (including chained operators)
- Why approval is needed
- What proof it will show after approval

Do not accept “done” before post-approval evidence is shown.

---

## 5) Verification matrix

Use at least one independent check:

- **File work:** read file path + confirm expected lines
- **Git work:** `git status`, commit hash, pushed branch
- **Config change:** read config key/value and restart status if needed
- **Reminder/cron:** list job + next run + target delivery
- **Discord result:** message/link/screenshot from expected channel

If the independent check fails, status = **NOT DONE**.

---

## 6) Copy/paste response template for agents

```text
Status: DONE | PARTIAL | BLOCKED

What I changed:
- [exact path/resource]

Evidence:
- [snippet/output/commit hash]

How to verify:
- [one independent check user can run]

If blocked:
- [exact blocker + exact approval command if applicable]

Next step:
- [single concrete action]
```

---

## 7) Escalation packet (if still failing)

Collect and share:
- Original request text
- Agent completion claim text
- Evidence provided (or missing)
- Independent verification result
- Pending approval command(s), if any
- Environment context (surface/channel/repo/session)

This cuts support back-and-forth and makes failure reproducible quickly.
