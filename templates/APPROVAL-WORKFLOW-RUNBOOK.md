# APPROVAL-WORKFLOW-RUNBOOK.md

Use this when your agent keeps pausing on **Approval Required** prompts, or when you want a safer, faster way to approve multi-step work.

---

## 1) Quick Triage (30 seconds)

- [ ] Is the requested command exactly what you expected?
- [ ] Does it touch sensitive paths (`~`, `.ssh`, secrets, production files)?
- [ ] Is this one command, or part of a multi-step chain?
- [ ] Do I want **allow-once** or **allow-always** for this scope?

If anything looks unclear, deny and ask the agent to restate the exact command + purpose in plain language.

---

## 2) Golden Rules (prevent 80% of mistakes)

1. **Approve exact text only.**
   - Do not paraphrase.
   - Do not trim chained operators (`&&`, `||`, `|`, `;`) or multiline scripts.
2. **Treat allow-once as one command only.**
   - Expect another prompt for the next elevated step.
3. **Re-read every new prompt.**
   - Similar is not identical; changed flags/paths matter.
4. **Never approve what you can’t explain.**

---

## 3) Safe Approval Sequence

1. Ask the agent to provide:
   - Exact command/script
   - Expected output/artifact
   - Target files/paths
2. Compare with your intent.
3. Approve using the exact current approval line.
4. After completion, require proof:
   - File path + changed lines, or
   - Command output snippet + exit status, or
   - Before/after diff summary.

---

## 4) Multi-Step Work Pattern (recommended)

Use this when a task needs several elevated steps:

- Step A: approve + verify evidence
- Step B: approve + verify evidence
- Step C: approve + verify evidence

Do **not** bulk-approve a plan if each step has different commands or risk profile.

---

## 5) High-Friction Failure Modes

### A) “I already approved this. Why is it asking again?”
Likely causes:
- Command changed (different args/path)
- New privilege boundary
- New step in a chain
- Wrapper script changed

Fix:
- Re-approve exact current command only after re-checking intent.

### B) “Agent says done, but nothing changed”
Likely causes:
- Approved wrong/stale command
- Command failed after approval
- Output wrote to unexpected path

Fix:
- Ask for path-proof evidence (`pwd`, absolute path, changed file/line references).

### C) “Approval loop won’t stop”
Likely causes:
- Agent keeps proposing variants
- You keep approving old copied lines

Fix:
- Require a fresh, minimal command for just the next step.
- Approve only that exact line.

---

## 6) Copy/Paste Prompt (for clean execution)

Use this prompt when an approval loop gets messy:

```text
Before requesting approval, show:
1) the exact command/script you want to run,
2) why it is needed,
3) expected output,
4) exact file paths impacted.
After approval and execution, return evidence: command output snippet + file path/line proof.
Do not claim done without evidence.
```

---

## 7) Escalation Packet (if still stuck)

Collect and share:

- Platform/surface (Dashboard, Discord DM, server channel, thread)
- Local timezone + timestamp of failure
- Exact approval prompt line(s)
- What you approved (allow-once vs allow-always)
- What result you expected vs observed
- Evidence returned (or missing)

---

## Bottom Line

Approval prompts are a safety feature, not a bug. Fastest path: **exact command approval + evidence after each step**.
