# SECURITY-GUARDRAIL-ROLLBACK-PLAYBOOK.md

Use this when your agent suddenly becomes unresponsive, over-cautious, or starts refusing normal tasks after a security hardening prompt.

---

## 0) Symptoms this playbook fixes

- Agent says it needs approval for almost everything (including harmless tasks)
- Agent loops on policy warnings and never executes
- Agent times out on normal workflows after adding strict guardrails
- Agent worked before, then broke immediately after a “security rules” prompt

If this matches your situation, run this exact recovery flow.

---

## 1) Capture what changed (proof first)

Before editing anything, collect:

- Last prompt you sent before behavior changed
- Current `AGENTS.md` security/approval rules
- Any newly added timeout/retry constraints

Create a quick note:

```md
# security-incident-note.md

## Trigger
[Paste the exact security prompt you used]

## New rules added
- [rule 1]
- [rule 2]
- [rule 3]

## First failure observed
- [what failed, where, and timestamp]
```

---

## 2) Safe-mode rollback (minimal, reversible)

Temporarily replace hardline rules with this **baseline block**:

```md
## Safety Baseline (Temporary Recovery Mode)

- Ask before destructive actions (delete/overwrite/remote writes).
- Ask before sending external/public messages on my behalf.
- Continue normal read-only analysis and local drafting without extra approval.
- If a task fails 3 times, stop and report the exact failing step + error.
- Use concise execution summaries with evidence (files changed, commands run, outputs).
```

Do **not** pile on additional restrictions yet.

---

## 3) Canary test (2 minutes)

Run these in order and require concrete proof:

1. **Read-only canary**
   - “Read `AGENTS.md` and summarize current safety rules in 5 bullets.”
2. **Local write canary**
   - “Create `tmp/canary.txt` with the line: `rollback test ok` and show the path.”
3. **Bounded execution canary**
   - “Run one short local command and paste stdout + exit code.”

If any step fails, stop and escalate with logs (Section 6).

---

## 4) Re-introduce guardrails one at a time

Add only one rule per test cycle. After each rule, rerun canaries.

Recommended order:

1. Destructive-action confirmation
2. External-message confirmation
3. Retry cap / timeout policy
4. Network-request confirmation (optional, stricter)

If behavior breaks after adding a rule, that rule is the culprit. Remove or soften it.

---

## 5) Known bad patterns (avoid)

- “Always ask before **any** network request” (can block normal tool/web workflows)
- “Do not let any task run longer than 10 minutes” without exception handling
- Multiple overlapping approval rules that conflict (ask always + auto-stop + strict timeout)
- Long policy paragraphs with ambiguous terms (“sensitive”, “unsafe”, “high risk”) without examples

Use specific, testable language instead.

---

## 6) Escalation packet for support

If recovery fails, send this packet to support:

```md
## Security Guardrail Regression Packet

- Signup email: [your email]
- Approx failure time (timezone): [time]
- Surface: [dashboard / discord / telegram]
- Last known good time: [time]

### Trigger prompt
[paste exact prompt]

### Current AGENTS safety section
[paste exact section]

### Canary results
1) Read-only: pass/fail + output
2) Local write: pass/fail + output
3) Bounded exec: pass/fail + output

### Error text
[paste exact errors]
```

---

## 7) Stable final policy (copy/paste)

```md
## Safety & Approval Rules

- Ask before destructive changes (delete/overwrite/move large batches).
- Ask before external posting/sending on my behalf.
- For normal read/analyze/local drafting work, proceed without extra approval.
- If a task fails 3 times, stop and report failing step + exact error + next best workaround.
- Keep commands bounded; if long-running work is needed, ask first and provide checkpoints.
```

This gives strong safety without freezing normal operation.
