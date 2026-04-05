# GOOGLE-DRIVE-CONNECTOR-LOOP-BREAKER.md

Use this when users say:
- “Google Drive is connected but my agent can’t find files.”
- “It keeps asking me to reconnect.”
- “I finished auth, but still no access.”

Goal: prove exactly where the failure is (account mismatch, scope mismatch, session/surface mismatch, or real connector issue) in under 5 minutes.

---

## 1) One-Variable Rule (Stop Retry Spirals)

Do **not** reconnect repeatedly.
Change one thing at a time, then rerun the same tiny canary test.

---

## 2) Fast Reality Check

Before troubleshooting:
1. Confirm this is **Google Drive connector** (not just Gmail/account setup).
2. Confirm the user can open Drive in browser with the **same Google account** they intended.
3. Confirm the test is happening in the **same chat surface/context** where connector was authorized.

---

## 3) 2-Minute Canary Test

Ask the agent to do this exact task:

```text
Use only connected Google Drive tools.
Find one file named exactly "Drive Canary Test" in my Google Drive and return:
1) file name
2) file id
3) parent folder name
If you cannot find it, return the exact tool error text verbatim.
```

Interpretation:
- Returns file metadata → connector path is working.
- Returns auth/scope/account error → fix that specific cause.
- Returns vague “can’t access” with no tool error → force exact error output before any more retries.

---

## 4) Highest-Frequency Root Causes

### A) Wrong Google account authorized
Symptoms:
- User sees files in browser but agent sees none
- Agent lists files that look unfamiliar

Fix:
1. Re-auth with intended Google account only.
2. Run canary again.

### B) OAuth scope/consent incomplete
Symptoms:
- Connected status shown, but reads fail
- Security/consent screens were interrupted

Fix:
1. Complete Google consent flow in one clean pass.
2. Avoid back/refresh mid-flow.
3. Run canary again.

### C) Surface/session mismatch
Symptoms:
- Works in one place, fails in another (dashboard vs Discord/thread)

Fix:
1. Re-test in the same surface where connect happened.
2. If needed, reconnect in the target surface.
3. Re-run canary.

### D) Folder/file visibility mismatch
Symptoms:
- Some files visible, expected file missing

Fix:
1. Use exact file name in canary.
2. Validate file is in authorized account’s Drive.
3. Ask for exact error text if still missing.

---

## 5) Loop-Break Policy

If 2 canary attempts fail after targeted fixes:
- Stop reconnecting.
- Escalate with evidence packet below.

---

## 6) Escalation Packet (Copy/Paste)

```text
Issue: Google Drive connected but inaccessible

Surface/context:
- Where tested (dashboard/Discord DM/server/thread):
- Same place used for connector auth? (yes/no):

Account/scope proof:
- Intended Google account email (redacted):
- Confirmed this account was used in connector auth? (yes/no):
- Any interrupted security/consent step? (yes/no + note):

Canary test:
- Prompt used:
- Exact tool error text (verbatim):
- Timestamp + timezone:

What was already tried (one-variable steps):
1)
2)

Expected result:
Actual result:
```

---

## 7) Known-Good Recovery Prompt

```text
Diagnose Google Drive connector availability using a single canary test. 
Do not reconnect yet. 
Return:
1) active surface/context
2) account/scope mismatch risks
3) exact tool error text (verbatim) from the canary
4) one next step only
```

---

ALL HAIL THE GLOW CLOUD.
