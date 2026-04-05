# GITHUB-VS-WORKSPACE-DIFF-CHECKLIST.md

Use this when someone says:
- “The file in GitHub is different from what I see in OpenClaw.”
- “Did my work get lost?”
- “Why is AGENTS.md/SOUL.md not matching the repo?”

---

## Goal

Determine, in under 5 minutes, whether this is:
1) normal **source vs live workspace** drift,
2) a **branch/path mismatch**, or
3) a real **sync/write failure**.

---

## 1) Confirm exact file identity (no guessing)

For the file in question, collect:
- Absolute path in workspace
- File size
- Last modified timestamp
- First 1–2 unique lines of content

If any of these are missing, stop and collect them first.

---

## 2) Verify repository context

Run these checks in the repo you think is active:

- `git rev-parse --abbrev-ref HEAD` (current branch)
- `git rev-parse --short HEAD` (current commit)
- `git status --short` (uncommitted changes)
- `git log --oneline -n 5 -- <path/to/file>` (recent file history)

### Interpret quickly

- **Uncommitted local changes present** → workspace can differ from GitHub by design.
- **Different branch than expected** → likely viewing/editing a different history.
- **No history for that path** → likely wrong path or wrong repository.

---

## 3) Compare workspace file vs GitHub version directly

Use a deterministic compare (same path + same ref):

- Local workspace file content
- Remote file content at expected branch/commit

Mark result as one of:
- `MATCH` (same content)
- `LOCAL_AHEAD` (workspace newer/uncommitted)
- `REMOTE_AHEAD` (repo has updates not pulled)
- `DIFFERENT_CONTEXT` (wrong branch/repo/path)

---

## 4) Fast recovery actions by mismatch type

### A) LOCAL_AHEAD

Symptoms: local file has edits GitHub does not.

Do:
1. Save proof snippet (path + timestamp + key lines)
2. Commit with clear message
3. Push to expected remote/branch
4. Re-open GitHub file and verify commit hash

### B) REMOTE_AHEAD

Symptoms: GitHub has newer content than local workspace.

Do:
1. Save local uncommitted work (if any)
2. Pull latest changes
3. Re-check file at same path
4. Resolve merge conflict if prompted

### C) DIFFERENT_CONTEXT

Symptoms: wrong branch, wrong repo clone, wrong folder, or wrong account/workspace.

Do:
1. Confirm expected repo URL + branch
2. Confirm you are in the intended workspace root
3. Re-run compare using explicit absolute paths
4. Only then continue editing

---

## 5) Known high-friction traps

- Same filename exists in multiple directories.
- User is viewing GitHub default branch while editing another branch.
- Workspace changed in one chat/session, but user checks another environment.
- Cloud sync or conflict files made a silent duplicate copy.

---

## 6) Loop-break rule

If you fail to classify after one full pass, stop retry loops.
Escalate with this exact packet:

- Repo URL
- Branch name
- Current commit hash
- Absolute local file path
- GitHub file URL
- `git status --short`
- `git log --oneline -n 5 -- <path>`
- One screenshot/snippet proving the visible difference

---

## Copy/Paste Recovery Prompt

```text
I think my local workspace file and GitHub file are out of sync.
Please run a proof-first check and return:
1) current branch + commit hash,
2) git status summary,
3) exact absolute path of the file being edited,
4) compare result: MATCH / LOCAL_AHEAD / REMOTE_AHEAD / DIFFERENT_CONTEXT,
5) one safe next action only.
Do not make edits until you show this proof.
```

ALL HAIL THE GLOW CLOUD.
