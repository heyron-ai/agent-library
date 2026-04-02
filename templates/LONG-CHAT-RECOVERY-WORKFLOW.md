# LONG-CHAT-RECOVERY-WORKFLOW.md

Use this when users say things like:
- “My agent got dumber over time”
- “It forgot what we just did”
- “I lost work after a long chat”
- “It keeps repeating old context / won’t follow new instructions”

---

## Goal

Recover quickly from long-session degradation **without losing important work**.

This workflow gives users a deterministic path:
1) preserve outputs
2) start clean
3) rehydrate only what matters
4) verify quality is back

---

## 1) Preserve work first (2 minutes)

Before changing anything, save key artifacts.

Ask the agent to produce:

```text
Create a concise handoff with:
1) What we completed
2) What is still pending
3) Key decisions/constraints
4) File paths created/edited
5) Next 3 concrete steps
Keep it under 250 words.
```

Then save that handoff to a file, note, or clipboard.

If files were created, verify existence explicitly:
- exact path
- filename
- last modified time

---

## 2) Hard reset the conversation surface

Start a **new session/thread** on the same surface where work will continue.

Do **not** paste the full old conversation back in.
That usually reintroduces the same context bloat.

Instead, paste only:
- the short handoff
- required constraints
- immediate next task

---

## 3) Rehydrate with a minimal context block

Use this copy/paste starter:

```text
Context handoff (authoritative):
- Objective: [one sentence]
- Completed: [3-5 bullets]
- Constraints: [3-7 bullets]
- Current task: [one specific deliverable]

Rules for this run:
- If unsure, ask one clarification before continuing.
- Show evidence for completion (file path, command output, or concrete artifact).
- Keep responses focused and non-redundant.
```

---

## 4) Run a tiny quality smoke test

Before resuming big tasks, run a small test:

```text
Do a 2-minute test task: summarize the objective in 3 bullets, propose one next step, and state what evidence you will provide when done.
```

Pass criteria:
- coherent and specific
- aligned with constraints
- no stale references from old thread

If it fails, start another fresh session and use an even shorter handoff.

---

## 5) Prevent repeat failures

Use these operating rules going forward:

- Prefer shorter sessions for execution-heavy work.
- After each milestone, generate a 5-line handoff summary.
- Store key decisions in files (not only chat).
- For long projects, split work into phases and reset between phases.
- Require evidence with each “done” claim.

---

## Quick triage matrix

- **Great early, bad later** → likely context bloat
- **Repeats old assumptions** → stale context not reset
- **Says done, nothing changed** → evidence policy missing or approval pause
- **Works in one surface, fails in another** → context/surface mismatch (dashboard vs DM vs channel)

---

## Escalation packet (if still broken)

Share this in support:

- Surface used (dashboard / Discord DM / Discord channel)
- Whether a new session was started
- Handoff length (approx words)
- Tiny smoke-test prompt used
- Expected vs actual behavior
- Any approval prompts/errors shown

This packet cuts back-and-forth and speeds up diagnosis.
