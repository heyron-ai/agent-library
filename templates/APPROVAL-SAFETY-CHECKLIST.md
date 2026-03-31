# APPROVAL-SAFETY-CHECKLIST.md

Use this when your agent pauses with **Approval Required** and you're not sure whether to allow the command.

---

## Goal

Help you approve safe commands quickly and block risky ones confidently.

---

## 60-Second Triage

Before approving anything, check:

1. **Does this command match what I asked for?**
   - If the task was “read logs,” a command that deletes files is wrong.
2. **Is the scope limited?**
   - Good: specific file/path/repo
   - Risky: wildcard deletes, root-level edits, broad network changes
3. **Is this command destructive?**
   - Watch for: `rm`, `mv` over important files, force flags, rewrite/reset actions
4. **Is it leaving the machine?**
   - Pushing to GitHub, posting webhooks, sending messages/emails = outbound action
5. **Is the command exactly what the approval prompt shows?**
   - Do **not** paraphrase. Approve the exact command string.

---

## Approve Decision Matrix

### ✅ Usually Safe to Allow Once

- Read-only inspection: `cat`, `grep`, `ls`, `git status`, `tail`
- Local non-destructive checks: linters, tests, dry-runs
- Focused file edits inside expected project paths

### ⚠️ Review Carefully Before Allowing

- Any command with `&&`, `|`, `;`, or multiline scripts
- Any `git push`, `git reset`, `git clean`, force flags
- Service restarts and config rewrites
- Commands that install or remove packages

### ❌ Usually Deny (or ask for a safer alternative)

- Broad deletion commands or suspicious wildcards
- Unexpected credential/token operations
- Commands touching unrelated directories
- Anything that looks different from your request

---

## Known Gotchas

- **One approval is not global.**
  `allow-once` covers one command only.
- **Chained commands are a single payload.**
  If you approve `A && B && C`, you approved all three steps.
- **"Looks mostly right" is not enough.**
  If one segment is unclear, deny and ask for a safer split.

---

## Copy/Paste Safe Response to Agent

If you deny and want a safer retry:

```text
Denied. Split this into smaller read-first steps and explain each command in plain language before requesting approval again.
```

If you want the agent to proceed conservatively:

```text
Proceed with read-only diagnostics first. Ask approval separately for any write, delete, restart, or outbound action.
```

---

## Fast Escalation Packet (for #help)

Share this when asking support:

```text
Issue: Approval prompt unclear/risky
What I was trying to do:
Exact command shown in approval prompt:
Why it looked risky/confusing:
What happened after deny/allow:
```

---

Use this checklist to stay fast **and** safe. When in doubt, deny and ask for a smaller command.
