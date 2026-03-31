# CONTEXT-LIMIT-RESCUE.md

Use this when users report errors like:
- `context limit exceeded`
- `prompt too long`
- Agent stalls after very long messages

---

## 1) Quick Triage (60 seconds)

- Is the user pasting huge logs/screenshots/transcripts in one turn?
- Is `SOUL.md` or `AGENTS.md` very long (novel-sized)?
- Is the agent being asked to do too many tasks in one prompt?
- Is the model set to a smaller context model?

If yes to any of the above, apply the rescue flow below.

---

## 2) Rescue Flow (Copy/Paste)

**Step A — Shrink instructions**
- Keep `SOUL.md` to ~1–2 pages max
- Keep `AGENTS.md` focused on operating rules only
- Move long reference content to separate files and link to them

**Step B — Chunk the work**
- Split one giant ask into smaller steps
- Prefer: "Step 1 only" → review → "Step 2"
- Avoid multi-goal mega-prompts

**Step C — Summarize before continuing**
Ask the agent:

> "Summarize the current state in 8 bullets and list next 3 actions. Then continue with only action 1."

This compresses context and resets clarity.

**Step D — Replace raw dumps with structured snippets**
Instead of pasting full logs, send:
- 20–50 relevant lines
- Error text exactly
- What changed right before failure
- One known-good run if available

**Step E — Switch model if needed**
If workload is inherently large (long docs/code), use a model with larger context window.

---

## 3) Known-Good Prompt Pattern

Use this template:

> Goal: [single concrete outcome]\
> Context: [short, relevant facts only]\
> Constraints: [must/avoid]\
> Output: [exact format wanted]\
> Scope for this turn: [only one step]

---

## 4) Fast Verification

After cleanup, run this test:

1. Send a short prompt with one objective.
2. Confirm the agent responds without context-limit errors.
3. Add one additional chunk of context.
4. Confirm it still responds normally.

If failures return, reduce prompt size again and re-check model choice.

---

## 5) Escalation Packet (if still broken)

Share this in #help:

- Error message (exact text)
- Approximate prompt size (small / medium / huge)
- Which files are loaded (`SOUL.md`, `AGENTS.md`, etc.)
- Model used
- What already tried from this playbook
- Timestamp + timezone

---

## Why this works

Most context-limit issues are input-shape problems, not account problems. Smaller instructions + chunked workflow + structured snippets resolve the majority of cases quickly.