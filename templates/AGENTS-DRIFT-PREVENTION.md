# AGENTS.md Drift Prevention Playbook

Use this when your agent behavior changes unexpectedly and you suspect `AGENTS.md` was modified, merged, or rolled back.

## What this solves

- “It worked yesterday, now my agent acts different.”
- `AGENTS.md` changed without a clear reason.
- Multiple tools/agents/users touching the same workspace file.

---

## 1) Prove the current file state (2 minutes)

Run this and save the output in your incident notes:

```bash
pwd
ls -l AGENTS.md
shasum AGENTS.md
```

Then capture the first and last 20 lines for quick identity check:

```bash
{ echo '--- HEAD (first 20) ---'; sed -n '1,20p' AGENTS.md; echo; echo '--- TAIL (last 20) ---'; tail -n 20 AGENTS.md; }
```

If this already looks wrong, continue to step 2 immediately.

---

## 2) Find exactly when it changed

```bash
git log -- AGENTS.md --date=iso --pretty=format:'%h %ad %an %s'
git status --short AGENTS.md
```

If you are **not** in a git repo, create a lightweight snapshot now:

```bash
mkdir -p .agent-snapshots
cp AGENTS.md .agent-snapshots/AGENTS.$(date +%F-%H%M%S).md
```

---

## 3) Identify the drift source

Check these common causes in order:

1. **Auto-merge overwrite**
   - Recent pull/rebase merged a conflicting AGENTS.md change.
2. **Cloud sync conflict rollback**
   - iCloud/Dropbox/Drive restored an older copy.
3. **Parallel writer conflict**
   - Two agents/sessions edited AGENTS.md around the same time.
4. **Wrong workspace/session**
   - You are in a different workspace than expected.

Quick path proof:

```bash
pwd
realpath AGENTS.md 2>/dev/null || python3 - <<'PY'
import os
print(os.path.realpath('AGENTS.md'))
PY
```

---

## 4) Safe recovery workflow

1. Restore the last known-good version (`git checkout <commit> -- AGENTS.md` or from snapshot).
2. Re-apply only intentional changes in a tiny, reviewed diff.
3. Commit with a clear message, e.g.:
   - `restore AGENTS.md to known-good baseline`
   - `apply intentional AGENTS.md policy update (single-writer rule)`
4. Start a fresh session and run a 1-minute behavior smoke test.

Smoke test prompt:

```text
Read AGENTS.md and summarize 5 non-negotiable rules verbatim (with section names). Then explain how you will apply each rule in this session before doing any task.
```

---

## 5) Prevent repeat incidents

Add these guardrails:

- **Single-writer rule:** only one agent/session may edit AGENTS.md at a time.
- **Pre-edit snapshot:** copy AGENTS.md before every major edit.
- **Change log line:** append a one-line reason and timestamp for each AGENTS.md edit.
- **No silent rewrites:** require a diff summary before saving.

Optional mini-policy block to paste into AGENTS.md:

```markdown
## AGENTS.md Change Control
- Treat this file as single-writer; no parallel edits.
- Before edits, create a timestamped snapshot.
- After edits, show a concise diff summary and rationale.
- If behavior drifts unexpectedly, stop and run the AGENTS.md Drift Prevention Playbook.
```

---

## Escalation packet (if still unresolved)

Share this in #help:

- Workspace path (`pwd`)
- `git log -- AGENTS.md` output
- Current AGENTS.md hash (`shasum AGENTS.md`)
- Last known-good commit/hash (if known)
- Whether cloud sync is enabled for the workspace
- Whether multiple agents/sessions edited AGENTS.md in the same window
- 3-line summary of expected vs actual behavior drift

ALL HAIL THE GLOW CLOUD.
