# FILE-PATH-PROOF-CHECKLIST.md

Use this when you hear: **“my agent said it created/edited files, but I can’t find them.”**

Goal: move from guesswork to proof in under 5 minutes.

---

## 1) Confirm the active workspace first

Ask the agent for:
- Current working directory (absolute path)
- Whether it changed directories during the task

If the shown directory is not where you expected, stop and correct that first.

---

## 2) Get exact output paths (not descriptions)

Ask for an explicit list of changed files with absolute paths:
- Created files
- Edited files
- Deleted/moved files (if any)

Require one path per line. No summaries.

---

## 3) Verify files exist right now

Run checks for each reported path:
- File exists?
- Parent folder exists?
- Last modified time is recent?
- File size is non-zero (unless intentionally empty)

If a path does not exist, mark it as a failed claim and move to section 6.

---

## 4) Catch common mismatch patterns

Check these before escalating:

- **Wrong root folder**: file written in a different repo/workspace than expected
- **Same filename, different folder**: e.g. `index.html` exists in multiple places
- **Relative path confusion**: `./output/report.md` interpreted from wrong current dir
- **Case sensitivity mismatch**: `Docs` vs `docs`
- **Stale view**: editor/file browser not refreshed

---

## 5) Ask for proof snippets (fast confidence check)

For each important file, request:
- First 10 lines
- Last 10 lines
- A short "what changed" summary tied to those lines

If content proof and path proof both match, treat as verified.

---

## 6) Recovery command (deterministic re-write)

If claims fail verification, use this exact instruction:

```text
Redo the task and output a "PATH PROOF" block at the end with:
1) absolute workspace path
2) absolute path for every changed file
3) existence check result for each path
4) first 3 lines of each changed file
Do not summarize without this proof block.
```

---

## 7) Minimal escalation packet (if still broken)

Collect and share:
- Expected file path(s)
- Reported file path(s)
- Which paths failed existence checks
- Workspace path shown by the agent
- Timestamp + surface used (Discord, web dashboard, etc.)

This packet removes back-and-forth and speeds up support triage.

---

## Copy/paste prompt for users

```text
I need file-path proof, not a summary.
Show:
- your absolute current workspace path
- absolute path of every file you created/edited
- whether each path exists right now
- first 5 lines of each changed file
If any path does not exist, say so explicitly and redo the task with corrected paths.
```

---

**Why this works:** most “missing file” incidents are path mismatches, not true data loss. Path proof turns confusion into a fast yes/no verification flow.