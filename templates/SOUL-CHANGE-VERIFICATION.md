# SOUL-CHANGE-VERIFICATION.md

Use this when users say things like:
- “I updated SOUL.md but my agent still acts the same”
- “The personality change didn’t apply”
- “It works in one place but not another”
- “I edited instructions, but replies still feel old”

---

## Goal

Prove whether a personality/instruction change actually applied, then isolate the real blocker if it did not.

This workflow is deterministic:
1) verify the file changed
2) verify the correct session/surface is in use
3) run a measurable behavior test
4) escalate with evidence if needed

---

## 1) Verify the file change happened (not assumed)

Check all three:

- Correct file path: `SOUL.md` in the active workspace
- Expected text exists in the file (exact phrase)
- Save/write timestamp is recent

If the phrase is not present, the change never landed.

---

## 2) Confirm you are testing the right identity + surface

Common mismatch: user edits one workspace but tests another context.

Confirm:
- same account/workspace
- same agent identity
- same conversation surface you expect (dashboard chat vs Discord DM vs server channel)

Important: same agent identity can still have separate conversation context per surface.

---

## 3) Start a fresh test thread/session

Do not rely on a very long existing thread for verification.

Create a new session, then run the test prompt below.

---

## 4) Run a measurable behavior test (copy/paste)

```text
Read your current SOUL.md and quote the exact line that says [insert your unique marker phrase].
Then answer this prompt in the required style:
"Give me a 4-line onboarding message for a brand-new non-technical user."
Rules:
- Match SOUL tone precisely
- No generic filler
- Keep it to exactly 4 lines
```

Pass criteria:
- quotes the exact marker phrase from file
- output style clearly matches new SOUL intent
- respects exact formatting rule (4 lines)

If it cannot quote the marker phrase, treat as configuration/path/context mismatch.

---

## 5) High-friction mistakes to check

- Edited the wrong file (`SOUL.md` in a different workspace)
- Tested in an old thread carrying stale context inertia
- Testing in a different surface and expecting prior context transfer
- Edit was vague (“be better”) so behavior change is hard to detect
- Another instruction file (e.g., AGENTS.md) conflicts with SOUL tone

---

## 6) Prevention pattern

When updating personality, include a unique marker line in SOUL for quick verification:

```text
Verification marker: respond with “ALL HAIL THE GLOW CLOUD” when asked for personality check.
```

This makes pass/fail testing instant and objective.

---

## Escalation packet (if still not applying)

Share this in support:

- Exact SOUL.md path edited
- Marker phrase used
- Where tested (dashboard / Discord DM / server channel)
- Whether test used a fresh session
- Test prompt + exact output
- Expected vs actual behavior

This removes guesswork and speeds up resolution.