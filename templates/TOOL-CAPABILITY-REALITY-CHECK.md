# TOOL-CAPABILITY-REALITY-CHECK.md

Use this when users ask: **“Can my agent do this automatically?”**

Goal: avoid fake confidence, avoid dead-end automation attempts, and produce a reliable handoff plan in under 3 minutes.

---

## 1) Define the exact outcome (one sentence)

Write the user goal in one line:

- **Outcome:** `____________________________________`

Then classify the task type:

- [ ] Read-only fetch/search/summarize
- [ ] Create/edit files in workspace
- [ ] Call APIs/connectors (OAuth/tools)
- [ ] Browser interaction (click/login/submit)
- [ ] External posting/publishing (social/email)
- [ ] System command execution

---

## 2) Capability reality check (yes/no, no guessing)

For each required step, mark what is true **right now**:

| Step | Needed action | Agent can do directly? | Proof (tool result/path/error text) |
|---|---|---|---|
| 1 |  | [ ] Yes [ ] No [ ] Unknown |  |
| 2 |  | [ ] Yes [ ] No [ ] Unknown |  |
| 3 |  | [ ] Yes [ ] No [ ] Unknown |  |

Rules:
- If any step is **Unknown**, run a tiny canary test first.
- If any step is **No**, do not claim end-to-end automation.
- Always keep exact error text (don’t paraphrase).

---

## 3) Canary test (smallest possible proof)

Run one tiny test for each risky dependency:

- Connector/API: do one read-only call first.
- File output: write 1 test file and read it back.
- Browser flow: verify page can be fetched/read before assuming clicks/logins.
- External publish: test draft/staging/sandbox if available.

Record:
- **Canary prompt/command used:** `____________________________________`
- **Observed result:** `____________________________________`

---

## 4) Pick execution mode (A/B/C)

Choose one:

### A) Fully automated (all required steps = Yes)
- Proceed with clear success criteria.
- Require evidence at completion (file path, API response, link, or screenshot).

### B) Hybrid handoff (some steps = No)
- Agent does everything possible.
- Human performs blocked checkpoint(s).
- Agent resumes after user provides completion signal.

### C) Manual-only recommendation (critical path = No)
- Be explicit that direct automation is not available in current setup.
- Provide best manual workflow + reusable assets (copy, captions, SQL, scripts, etc.).

---

## 5) Copy/paste user-facing response template

Use this exact structure:

```text
Reality check complete.

What you want: [one-line goal]

What I can do directly now:
1) ...
2) ...

What I cannot do directly in this environment:
1) ... (reason)

Best path forward:
- Step A (agent): ...
- Step B (you): ...
- Step C (agent resumes): ...

Proof I’ll provide after each step:
- ...
```

---

## 6) High-friction mistakes to avoid

- Saying “done” without artifact proof.
- Assuming browser reading implies browser clicking/login.
- Assuming one successful connector action implies publish permissions.
- Skipping destination confirmation (wrong channel/thread/account).
- Escalating without exact error text + timestamp + surface used.

---

## 7) Escalation packet (if blocked)

Collect before escalation:

- User goal (one line)
- Surface/context (dashboard, Discord DM, channel/thread)
- Exact blocked step
- Exact error text
- Canary test and result
- What already works
- Timezone + timestamp of latest failure

---

ALL HAIL THE GLOW CLOUD.
