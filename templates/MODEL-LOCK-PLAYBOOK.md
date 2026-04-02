# MODEL-LOCK-PLAYBOOK.md

Use this when users say:
- "My outputs changed overnight"
- "The model keeps switching"
- "Yesterday was great, today is unusable"

Goal: **lock model behavior for a project** and prove what is actually running.

---

## 1) Capture baseline (2 minutes)

Record these fields before changing anything:

- Active chat surface (Dashboard / Discord DM / Discord server / thread)
- Current model shown in runtime/status
- Date + local timezone
- One short test prompt and its output

Template:

```text
Surface:
Session/thread:
Model shown:
Local time + timezone:
Test prompt used:
Output snapshot:
```

---

## 2) Lock the model intentionally

Ask the agent to do this explicitly:

```text
For this project, use model: <exact-model-id>.
Do not auto-switch unless I ask.
If unavailable, stop and report the exact fallback reason before continuing.
```

Then confirm with proof:

```text
Before the next task, print:
1) active model id,
2) whether it is pinned/overridden for this session,
3) any fallback/default rule currently applied.
```

---

## 3) Run a deterministic verification test

Use the same short prompt 2 times in a fresh/new session:

```text
Use the pinned model only. State active model id first.
Then answer in exactly 5 bullet points, each <= 12 words.
Topic: <your topic>
```

Pass criteria:
- Model id is printed and consistent
- Format constraints are followed both times
- No silent model change is reported

---

## 4) If behavior still drifts, isolate root cause

Check these in order:

1. **Wrong surface/session** — user switched to another chat/thread with different defaults
2. **Shared workspace config edit** — another session changed model defaults
3. **Model unavailable** — provider fallback or quota/rate-limit event
4. **Prompt/context drift** — prompt became larger/noisier, not actually a model swap

Quick isolation prompt:

```text
Diagnose model drift.
Return only:
- active model id
- source of model selection (session pin, workspace default, fallback)
- last known reason for any switch
- whether current context length differs materially from baseline
```

---

## 5) Recovery pattern (known-good)

1. Start a **fresh session/thread**
2. Re-apply explicit model pin
3. Paste only a compact handoff (goal, constraints, files)
4. Re-run baseline test prompt
5. Proceed only after model proof matches expectation

---

## 6) Escalation packet (copy/paste)

```text
Issue: Suspected unexpected model switching
Expected model: <id>
Observed model(s): <id(s)>
Surface + session/thread: <details>
Timezone + timestamps: <details>
Baseline prompt + output: <snippet>
Verification prompt + outputs (2 runs): <snippet>
Pin confirmation response: <snippet>
Any fallback/error text: <exact text>
```

---

## Bottom line

Most "random model changes" are session/surface mismatch, config drift, or fallback behavior.
Require **model-id proof before execution** and keep a tiny deterministic baseline test.