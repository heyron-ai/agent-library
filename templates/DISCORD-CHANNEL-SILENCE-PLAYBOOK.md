# DISCORD-CHANNEL-SILENCE-PLAYBOOK.md

Use this when users report one of these patterns:
- "Bot responds in DM but not in server channels"
- "Bot reads messages but never replies"
- "It types for a while, then sends nothing"

Goal: isolate **policy/config mismatch** vs **Discord permission restriction** vs **runtime outage** in under 10 minutes.

---

## 1) Fast Triage (2 minutes)

Capture the exact symptom:
- [ ] DM works? (yes/no)
- [ ] Server channel test fails? (yes/no)
- [ ] Slash commands visible? (yes/no)
- [ ] Typing indicator appears? (yes/no)
- [ ] Any explicit error in logs/UI? (paste)

If DM works but channel fails, this is usually **policy/permissions**, not token or model quality.

---

## 2) Known-Good Minimal Policy Baseline

Ask user to verify these Discord-related settings in their config:

- [ ] `groupPolicy: "open"`
- [ ] `requireMention: false` *(or true if they intentionally require mentions)*
- [ ] Target guild is in allowlist (if allowlist is enabled)
- [ ] `allowBots` is only enabled if they explicitly want bot-to-bot behavior

Then apply changes and restart gateway/runtime before retesting.

---

## 3) Discord Permission & Integration Checks

In the exact failing channel/thread:
- [ ] Bot has **View Channel**
- [ ] Bot has **Send Messages**
- [ ] If thread/forum: bot has **Send Messages in Threads**
- [ ] Channel/category overrides are not denying send/read
- [ ] Server Settings → Integrations is not restricting command access

Common gotcha: permissions look fine at role level, but channel override silently blocks send.

---

## 4) Clean-Room Retest

Run this test exactly:
1. Create/choose a fresh, low-noise text channel.
2. Ensure bot can view + send there.
3. Send plain text: `ping: reply with pong only`.
4. If mention mode is required, test with @mention.

Expected result: short deterministic reply (`pong`).

If clean-room works but original channel fails, root cause is channel/thread policy or overrides.

---

## 5) Typing-Then-Nothing Branch

If bot shows typing but sends nothing:
- [ ] Re-check channel send permission and integration restrictions
- [ ] Confirm no moderation/automod rule is deleting/blocking output
- [ ] Restart gateway/runtime after config edits
- [ ] Re-run clean-room test

If still failing in clean-room, treat as runtime/execution issue and escalate.

---

## 6) Escalation Packet (copy/paste)

```text
Issue: Discord channel silence (DM works/fails: ___)
Server ID:
Channel ID:
Thread ID (if any):

Policy settings:
- groupPolicy:
- requireMention:
- guild allowlist:
- allowBots:

Permissions in failing channel:
- View Channel:
- Send Messages:
- Send Messages in Threads:

Integrations restrictions checked: yes/no
Gateway/runtime restarted after edits: yes/no
Clean-room test result:
Exact test prompt used:
Observed behavior (including typing indicator):
Timestamp + timezone:
```

---

## 7) Prevention Rules

- Keep one known-good test channel for diagnostics.
- After Discord config edits, always restart then retest.
- Use deterministic smoke tests (`pong`, one-line reply) before complex prompts.
- Don’t assume DM success proves channel config is correct.
