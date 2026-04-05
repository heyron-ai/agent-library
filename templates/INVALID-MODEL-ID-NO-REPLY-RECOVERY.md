# INVALID-MODEL-ID-NO-REPLY-RECOVERY.md

Use this when your agent immediately fails before replying (for example: `400 ... is not a valid model ID`) and you get stuck in a no-reply loop.

---

## Goal

Break the loop in under 5 minutes by proving three things in order:
1. The configured model ID is valid
2. The active session actually picked up the fix
3. A tiny canary task succeeds in the same surface where it was failing

---

## 0) Capture the exact error (30 sec)

Copy these into a note before changing anything:

- Surface (Dashboard / DM / Discord server / thread)
- Full error text (exact string)
- Timestamp + timezone
- Session/thread link or ID (if visible)

If the error text changes after each retry, keep the latest one too.

---

## 1) Validate model ID at the source (60 sec)

Open your model/provider settings and verify:

- Provider is the one you expect (OpenRouter, OpenAI, etc.)
- Model ID is spelled exactly (case + punctuation)
- No leading/trailing spaces
- No old/deprecated model ID copied from old examples

### Common failure pattern

A model ID is valid in one provider catalog but invalid in another. If provider and model ID do not match, you will loop forever.

---

## 2) Apply a minimal safe fallback model (60 sec)

If uncertain, set one known-safe model from your active provider.

Then save settings and **start a fresh session/thread**.

Do not keep retrying in the same failing session; stale session state can hide whether the fix applied.

---

## 3) Run a canary in the failing surface (60 sec)

In the new session/thread (same surface that failed), send:

`Reply with exactly: MODEL_CANARY_OK`

Pass condition:
- You receive exactly `MODEL_CANARY_OK`

Fail condition:
- Same invalid-model error
- No reply / timeout
- Different startup error before any normal reply

---

## 4) If canary passes, restore preferred model carefully (60 sec)

Switch from fallback model to your preferred model ID.

Then immediately re-run:

`Reply with exactly: MODEL_CANARY_OK_2`

If this fails, revert to the last known-good model and stop changing multiple settings at once.

---

## 5) Loop-break rules (strict)

- Max 2 retries per model change
- Change one variable at a time (provider OR model OR session)
- Always test in a fresh session after settings edits
- Do not mix troubleshooting across surfaces while debugging

---

## 6) Escalation packet (copy/paste)

```
Issue: Invalid model ID / no-reply startup loop
Surface: <dashboard|dm|server|thread>
Timezone: <e.g., America/New_York>
First seen: <timestamp>
Current status: <still failing|fixed with fallback>
Provider configured: <name>
Model configured (before): <id>
Model configured (after): <id>
Fresh session created after fix?: <yes/no>
Canary result 1 (MODEL_CANARY_OK): <pass/fail + timestamp>
Canary result 2 (MODEL_CANARY_OK_2): <pass/fail + timestamp>
Exact latest error text: <paste exact string>
Session/thread link or ID: <value>
```

---

## Quick diagnosis map

- **Fails before first reply + invalid-model message** → model/provider mismatch is most likely
- **Fallback works, preferred model fails** → preferred model ID likely invalid/deprecated for that provider
- **Both fail in one surface but work elsewhere** → surface/session routing mismatch; escalate with packet

---

Use this template as your first response to model-startup failure loops before trying larger prompt rewrites or reinstall steps.
