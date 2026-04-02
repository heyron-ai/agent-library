# CHANGE-SCOPE-LOCK-CHECKLIST.md

Use this when you want your agent to make **small, precise edits** without rewriting everything.

---

## 1) Define the edit boundary (required)

Copy/paste and fill this:

```md
Task type: Small targeted edit
File(s): [exact path(s)]
Allowed scope:
- Only edit: [section/heading/line range]
- Do NOT edit: [all other sections]
Success criteria:
- [specific thing 1]
- [specific thing 2]
Output format:
- Show PLAN first
- Then apply edits
- Then provide unified diff + changed line ranges
```

---

## 2) Force a plan-before-edit step

Use this instruction:

```md
Before changing anything, show a 3–7 bullet PLAN listing exactly what you will edit and what you will not edit.
Do not apply changes until I approve the plan.
```

---

## 3) Require proof after editing

Use this verification block:

```md
After editing, provide:
1) Files changed
2) Exact sections/line ranges changed
3) Unified diff
4) One-sentence confirmation that no out-of-scope sections were modified
```

---

## 4) If the agent over-edits anyway

Run this recovery flow:

1. Stop and revert to the last good version.
2. Re-run with **one file only**.
3. Narrow scope to a single section.
4. Add this hard guardrail:

```md
If your proposed change touches anything outside the allowed scope, STOP and ask instead of editing.
```

---

## 5) Known-good prompt (copy/paste)

```md
Make a small targeted edit only.

File: [path]
Allowed scope: [exact section or line range]
Do NOT edit anything else.

Process:
1) Show a short plan first (what you will edit + what you will not edit)
2) Wait for approval
3) Apply only approved edits
4) Return unified diff + exact changed ranges + confirmation of no out-of-scope edits

If scope is ambiguous, ask one clarifying question and do not edit yet.
```

---

## 6) Escalation packet (if still failing)

Share this in support:

- Surface used (dashboard/Discord/other):
- Session/thread link or ID:
- File path(s):
- Exact prompt used:
- Expected small change:
- Actual unwanted changes:
- Diff snippet showing over-edit:
- Whether plan-first workflow was followed:
- Timestamp + timezone:

---

**Bottom line:** Small edits become reliable when you enforce **scope boundaries + plan approval + diff proof**.
