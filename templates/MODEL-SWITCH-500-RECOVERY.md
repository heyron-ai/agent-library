# MODEL-SWITCH-500-RECOVERY.md

Use this when model changes fail with errors like:
- `Gateway tool invoke failed: 500`
- `Model change failed`
- Model selector hangs, then silently reverts

---

## Goal

Stop random retries. Prove whether this is:
1. Bad model ID/provider mapping
2. Session-level override/stale state
3. Runtime health issue
4. Workspace/account mismatch

---

## 2-Minute Canary Flow

1. **Capture exact error text** (copy/paste, no paraphrase)
2. **Check active model right now**
3. **Try one known-good canary model** from same provider family
4. **Retest in a fresh session/thread**
5. **Temporarily disable fallbacks** and test single model only
6. If still failing: **one runtime restart**, then one retest

If it still fails after the restart + fresh session + single-model test, escalate with evidence packet below.

---

## Known-Good Recovery Prompt

```text
Do not retry random model IDs.

Task:
1) Show current active model ID.
2) Attempt switch to this exact canary model: <MODEL_ID>.
3) Report exact success/failure output verbatim.
4) If failure contains 500, run one fresh-session retest (same model, no fallback models).
5) Return a final verdict in this format:
   - active_before:
   - attempted_model:
   - result:
   - exact_error:
   - next_action:

Constraints:
- One attempt per step.
- No broad retries.
- No model-family changes unless asked.
```

---

## High-Friction Failure Patterns

- **Session pinning:** Chat/session override keeps forcing an old model
- **Fallback masking:** primary fails, fallback succeeds, user thinks switch worked
- **Stale runtime state:** config edited but runtime not refreshed
- **Wrong account/workspace:** changing model in one context, testing in another
- **Provider namespace mismatch:** invalid model format for selected provider

---

## Loop-Break Rules

- Never do more than **one retry per variable change**
- Change **one thing at a time** (model ID, session, fallback, runtime)
- If two clean attempts fail with the same 500, stop and escalate

---

## Escalation Packet (Copy/Paste)

```text
Issue: Model switch fails with 500

Timestamp + timezone:
Surface/context (dashboard/DM/server/thread):
Workspace/account confirmation:
Active model before attempt:
Attempted model ID:
Fallbacks enabled? (yes/no):
Fresh-session retest done? (yes/no):
Runtime restart done? (yes/no):
Exact error text (verbatim):
What changed immediately before failure:
```

---

## Done Criteria

Mark resolved only when all are true:
- Model switch succeeds in the intended surface/session
- Active model proof is shown after switch
- One follow-up task executes successfully on the new model
- No 500 on repeat canary test
