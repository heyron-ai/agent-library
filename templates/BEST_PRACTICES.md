# BEST_PRACTICES.md

Use this file as the **source of truth** for how your agent handles files in your workspace.

Goal: prevent duplicate files, random folder sprawl, and "I can’t find what you made" trust breaks.

---

## 1) Workspace Rules (Non-Negotiable)

1. **Find before create**
   - Search for an existing relevant file before making a new one.
   - If one exists, update it unless explicitly told to create a new version.

2. **One canonical location per content type**
   - Tutorials: `tutorials/`
   - Templates: `templates/`
   - Skills: `skills/`
   - Notes/logs: `memory/`

3. **No root clutter**
   - Do not drop random output in workspace root.
   - Root should only contain core project files.

4. **Version with intention**
   - Only create suffixed files (`-v2`, `-final`) when asked.
   - If versioning, explain why and point to canonical latest file.

5. **Always return file proof**
   - After writes/edits, report exact path(s) changed.

---

## 2) Before Any Write (Agent Checklist)

- [ ] Confirm task objective in one sentence
- [ ] Identify target folder by content type
- [ ] Search for existing candidate files
- [ ] Choose canonical file (or justify creating new)
- [ ] Confirm filename + path before writing

If uncertain, ask one clarifying question before writing.

---

## 3) Canonical File Selection Rule

When multiple candidates exist, choose this order:

1. Most recently updated file in the correct folder
2. File explicitly named by user
3. File linked from README/index/navigation
4. Otherwise stop and ask user to choose canonical file

Never silently edit one of many ambiguous files.

---

## 4) Safe Output Contract (paste into prompts)

```text
Before writing any file:
1) Show me candidate existing files (max 5) with path + modified time.
2) State which file will be canonical and why.
3) If creating a new file, explain why update-in-place is not correct.
After writing:
4) Return exact path(s) changed and a 1-line summary per file.
5) If new file created, show where index/README links were updated.
```

---

## 5) Duplicate-Prevention Rules for Agents

- Never create both `topic.md` and `topic-final.md` unless user requested versions.
- Never create near-duplicates in different folders without explicit reason.
- If a file name already exists elsewhere, call out potential confusion before writing.
- Prefer updating existing navigation (README/index) over creating hidden orphan files.

---

## 6) 2-Minute Recovery (when chaos already happened)

1. List duplicates by filename and folder.
2. Pick one canonical file per topic.
3. Merge useful differences into canonical file.
4. Update links/indexes to canonical paths.
5. Mark non-canonical files for archive/trash (don’t hard delete without approval).
6. Return a short “before/after” map.

---

## 7) Completion Proof Format

Use this exact output shape:

```text
Completed.
Canonical file(s):
- /absolute/or/relative/path/file1
- /absolute/or/relative/path/file2

Updated links/navigation:
- /path/to/index-or-readme

Notes:
- [Any new file and why it was necessary]
```

---

## Bottom Line

- **Find before create**
- **One canonical file per topic**
- **Proof of path after every write**

If everyone follows this, file chaos drops fast.
