# MODEL-SWITCH-VERIFICATION.md

Use this checklist when someone says:
- "I changed models but replies look the same"
- "I switched to a better model and nothing changed"
- "I think my agent is ignoring the selected model"

Goal: quickly prove whether model switching is actually working, then isolate where the mismatch is happening.

---

## 1) Capture Baseline (before changes)

Record the current state:

- Workspace/environment: `__________`
- Channel/platform (Discord, Telegram, dashboard): `__________`
- Current model shown in UI/config: `__________`
- Time of test (with timezone): `__________`

**Prompt for baseline test (copy/paste):**

```text
For this reply, start with a one-line "MODEL CHECK" header that includes:
1) the active model name if available,
2) today's date and your timezone,
3) a confidence score (0-100) that this session is using the intended model.
Then explain in 4 bullet points how to verify model switching reliably in OpenClaw/Heyron.
```

Save this output as **Baseline A**.

---

## 2) Apply Model Change Correctly

Run through all of these (do not skip):

- [ ] Save the new model value in the correct config/location
- [ ] Confirm no hidden trailing spaces/typos in model ID
- [ ] If API key/provider changed, save both key + model
- [ ] Start a **fresh session/chat** after saving
- [ ] If needed, restart gateway/session runner

Record the intended new model: `__________`

---

## 3) Verify in a Fresh Session

In a brand-new chat/session, run the exact same prompt used in Baseline A.
Save output as **Verification B**.

Compare A vs B:

- [ ] Header differs in model/provider indicators
- [ ] Style/quality/latency meaningfully changed
- [ ] No stale context from previous conversation
- [ ] No fallback warning or provider error

If A and B are nearly identical, continue to isolation.

---

## 4) Isolation Matrix

### A) Session caching / stale context
- [ ] Open an entirely new thread/session (`/new` equivalent)
- [ ] Re-run test prompt with no prior history

### B) Config not applied to runtime
- [ ] Confirm the active runtime is the one you edited
- [ ] Restart gateway/runtime and repeat test

### C) Wrong provider key or permission scope
- [ ] Validate API key is active for that provider/account
- [ ] Check billing/quota/plan access for target model

### D) Silent fallback behavior
- [ ] Look for provider errors in logs/UI
- [ ] Test with a second clearly different model to force visible contrast

### E) Channel mismatch
- [ ] Verify you're testing in the same workspace/agent instance you edited
- [ ] Confirm this is not a different bot/app/token in Discord

---

## 5) Known-Good Differential Test

Use a high-contrast prompt:

```text
Give me:
1) a 6-line executive summary of "why context windows matter",
2) a table of tradeoffs between low-cost and high-capability models,
3) one risky assumption in each recommendation.
Keep it under 220 words.
```

Run this on both the old and new model in separate fresh sessions. If results are still indistinguishable, treat as config/runtime issue—not user perception.

---

## 6) Fast Recovery Actions

- [ ] Re-save provider + model config
- [ ] Restart runtime/gateway
- [ ] Start fresh session
- [ ] Re-run Baseline prompt
- [ ] Re-run Differential Test

If still broken: escalate with the packet below.

---

## 7) Escalation Packet (copy/paste)

```text
MODEL SWITCH ESCALATION

Expected model: <new model>
Observed behavior: <what stayed the same>
Workspace/agent: <id/name>
Platform/channel: <Discord/Telegram/UI + channel>
Timezone/time tested: <timestamp>

Baseline A output summary:
- <1-2 lines>

Verification B output summary:
- <1-2 lines>

Isolation steps completed:
- Fresh session: yes/no
- Runtime restart: yes/no
- Key/billing check: yes/no
- Alternate model test: yes/no

Logs/errors seen:
- <paste exact errors>
```

---

## Notes

- Most false alarms come from testing in old sessions with heavy context.
- "Model changed, output feels same" is often real-but-benign for simple prompts; use high-contrast prompts to verify.
- Always test in a fresh session before concluding model switch is broken.
