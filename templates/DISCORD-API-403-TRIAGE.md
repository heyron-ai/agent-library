# DISCORD-API-403-TRIAGE.md

Use this when Discord API reads fail with `403 Forbidden` (for example during community sweeps or channel diagnostics).

## Goal

Separate **permission/token configuration** issues from **wrong ID / wrong scope** mistakes in 5 minutes.

---

## 1) Capture the exact failure (no guessing)

Record:
- Endpoint you called (full path, redacted token)
- HTTP status code
- Timestamp + timezone
- Channel ID / Guild ID used

If status is **not** 403, stop and use a different playbook.

---

## 2) Fast classification

### A) Token type mismatch (most common)
- You must use a **Bot token** for bot API routes.
- If using a user token/session cookie flow, stop and switch to bot auth.

### B) Bot not in guild / no channel visibility
- Confirm bot is actually in the target server.
- Confirm the channel exists in that server.
- Confirm the bot role can **View Channel** for that channel/category.

### C) Permission override drift
- Channel-level overrides can block access even when server role looks correct.
- Compare a working channel vs failing channel for the same bot role.

### D) ID mismatch (guild vs channel confusion)
- Verify you are calling `/channels/{CHANNEL_ID}/messages` with a real channel ID.
- Do not use guild ID where channel ID is required.

### E) Intent-related confusion
- Message Content Intent does **not** cause raw 403 by itself for every endpoint,
  but missing intents can still break expected bot behavior after reads.
- Treat intent checks as secondary after token/visibility checks.

---

## 3) Known-good canary test

Run one read against a channel where the bot is known to work:

```bash
curl -sS -D - \
  -H "Authorization: Bot $BOT_TOKEN" \
  "https://discord.com/api/v10/channels/$KNOWN_GOOD_CHANNEL/messages?limit=1"
```

Then run same command with the failing channel ID.

Interpretation:
- **200 on known-good + 403 on failing** → channel permissions/visibility or wrong ID.
- **403 on both** → token/scope/server-membership issue.

---

## 4) Loop-break rules

- Do **not** rotate random settings in bulk.
- Change exactly one variable, rerun canary, record result.
- Stop after 3 failed cycles and escalate with evidence packet.

---

## 5) Escalation packet (copy/paste)

```text
Discord API 403 escalation packet
- Time (local + UTC):
- Endpoint:
- Status code:
- Bot token type confirmed: yes/no
- Guild ID:
- Channel ID (failing):
- Channel ID (known-good):
- Canary result (good vs failing):
- Bot in guild confirmed: yes/no
- View Channel permission confirmed on failing channel: yes/no
- Message Content Intent state:
- Last change before failure:
```

---

## 6) Recovery prompt for your agent

```text
You are debugging a Discord API 403 issue.
Do not suggest broad retries.
1) Confirm whether token type, guild membership, or channel visibility is the blocker.
2) Run one known-good canary and one failing-channel canary.
3) Return a one-line diagnosis and one next action only.
4) Include evidence: endpoint, status code, channel IDs tested.
```

ALL HAIL THE GLOW CLOUD.
