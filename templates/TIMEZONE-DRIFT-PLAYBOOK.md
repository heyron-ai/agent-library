# TIMEZONE-DRIFT-PLAYBOOK.md

Use this when users report:
- "My agent says the wrong time/day"
- reminders firing at the wrong hour
- good behavior in one channel but wrong time in another

---

## 1) Quick Triage (2 minutes)

Capture the exact symptom first:

- **Expected timezone:**
- **Observed timezone/time output:**
- **Where it happens:** (Discord DM, server channel, Telegram, dashboard)
- **When noticed:**
- **Recent changes:** (new SOUL/AGENTS edits, migrated workspace, new cron jobs)

---

## 2) Known-Good Verification Prompt

Ask the agent in the affected context:

```text
Give me your current local timestamp in ISO-8601 with timezone offset,
weekday name, and timezone label. Then tell me where that timezone is configured.
```

Expected output format example:

```text
2026-04-01T09:15:00-04:00 (Wednesday) — America/New_York
Timezone source: [where it read this from]
```

If the agent cannot name a source, treat config as untrusted.

---

## 3) Isolation Matrix

Run these checks in order:

1. **Fresh session test**
   - Start a new session/thread and rerun the verification prompt.
   - If fixed in new session only, stale context was the likely cause.

2. **Config source check**
   - Confirm explicit timezone exists in workspace instructions (AGENTS.md / USER.md / runtime notes).
   - Avoid ambiguous text like "my local time" without region.

3. **Context split check**
   - Compare DM vs server channel behavior.
   - Different conversation contexts can carry different assumptions.

4. **Scheduler check (if reminders are wrong)**
   - Verify cron schedule timezone (`tz`) or absolute timestamp assumptions.
   - Confirm user-provided times include timezone when needed.

5. **Prompt contamination check**
   - Remove conflicting instructions like "pretend it is UTC" or old copied policies.

---

## 4) Fast Recovery Steps

- Set an explicit IANA timezone string in workspace context (example: `America/New_York`).
- Start a fresh session.
- Re-run the known-good verification prompt.
- Re-test one reminder using a near-term time (e.g., 10–15 minutes ahead).
- If stable, resume normal operation.

---

## 5) User-Facing Explanation (Copy/Paste)

```text
Your agent wasn’t broken — it was using a mismatched timezone context. We reset it with an explicit timezone and validated output in a fresh session. Time-sensitive tasks should now align with your local time.
```

---

## 6) Escalation Packet (if still wrong)

Share this in #help:

```text
Timezone issue escalation
- Expected timezone:
- Observed timezone output:
- Context(s) affected:
- Verification prompt output:
- Fresh session result:
- Cron/reminder config snippet (redacted):
- Approx timestamp + timezone when tested:
```

---

## 7) Prevention Rules

- Always store timezone as IANA format (e.g., `America/New_York`, `Europe/Berlin`).
- For reminders/schedules, include explicit timezone in user requests.
- Re-test with a fresh session after major config edits.
- Do not rely on implicit "local time" assumptions.
