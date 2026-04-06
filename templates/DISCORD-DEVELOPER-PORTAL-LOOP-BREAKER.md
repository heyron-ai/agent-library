# DISCORD-DEVELOPER-PORTAL-LOOP-BREAKER

Use this when Discord says your email is verified, but the Developer Portal still blocks app creation.

## Goal
Prove whether this is a **stale browser/account state** issue vs a true Discord-side account problem.

## 5-Minute Recovery Flow

### 1) Lock identity (stop account-mix mistakes)
- Open https://discord.com/developers/applications in one browser tab.
- Confirm the account avatar/email shown in Discord user settings matches the account you verified.
- If you have multiple Discord accounts, sign out of all of them first.

### 2) One clean browser pass
- Open an **incognito/private** window.
- Sign in once.
- Try creating a test app named `Canary-App-YYYYMMDD`.
- If this works in incognito, your normal profile is stale/corrupted state.

### 3) If incognito works, repair your normal profile
- Clear site data/cache for:
  - `discord.com`
  - `discordapp.com`
- Disable extensions that modify requests/cookies (privacy/ad blockers) for the test.
- Hard refresh and retry once.

### 4) If incognito fails too, run platform checks
- Wait 10–15 minutes (avoid rapid retries).
- Retry once from a second browser.
- If still blocked, escalate with evidence packet (below).

### 5) Loop-break rules (critical)
- Do **not** spam retries.
- Do **not** switch between multiple accounts mid-test.
- Do **not** keep changing random settings without recording results.

## Canary Success Criteria
You are done only if one of these is true:
1. You created a test app successfully, or
2. You produced a complete escalation packet with exact errors and test results.

## Escalation Packet (copy/paste)

```text
Issue: Discord Developer Portal blocks app creation after email verification

Timestamp (local + UTC):
Discord account email (redacted):
Portal URL used:
Exact error text shown:

Incognito test result: success/fail
Second browser test result: success/fail
Normal profile cache cleared: yes/no
Extensions disabled for test: yes/no

What I expected:
What happened instead:
```

## Known Good Prompt for Your Agent

```text
Help me run the Discord Developer Portal loop-breaker exactly.
Ask for only one missing field at a time.
Do not suggest random retries.
Stop when either:
1) I create a test app successfully, or
2) you output a completed escalation packet with exact evidence.
```
