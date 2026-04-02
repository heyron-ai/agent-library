# BACKGROUND-TASK-DELIVERY-CHECKLIST.md

Use this when users say: **“It ran, but I can’t find the result.”**

This catches the #1 failure mode for scheduled/background work: **destination mismatch** (right task, wrong place).

---

## 1) Confirm the exact promise (before debugging)

Capture these 4 fields first:

- **What** should be delivered? (message/file/summary)
- **When** should it fire? (with timezone)
- **Where** should it appear? (DM/server/thread/dashboard session)
- **How often**? (one-time vs recurring)

If any field is vague, rewrite the request before testing.

---

## 2) Verify schedule and timezone

- Confirm schedule type: `at`, `every`, or `cron`
- Confirm timezone explicitly (avoid “my local time” assumptions)
- Confirm next expected fire time in human-readable format

**Pass condition:** user and agent agree on exact next fire timestamp + timezone.

---

## 3) Verify destination routing

Check all destination knobs in one pass:

- `sessionTarget` (main / isolated / current / session:xxx)
- delivery mode (`announce`, `none`, `webhook`)
- delivery destination (`channel`, `to`, DM/server/thread)

Common mismatch patterns:

- Job runs in isolated context but user expects current thread output
- Delivered to DM while user is watching a server channel
- Delivered to old thread/session label after context switch
- Webhook delivery enabled but user expects in-chat output

**Pass condition:** destination is explicit and observable by user.

---

## 4) Run a tiny canary job (2-minute proof)

Create a one-shot reminder for ~2 minutes ahead with unmistakable text:

`Reminder canary: if you see this in [DESTINATION], routing is correct.`

Then verify:

- The run appears in job history
- The message appears in the exact expected destination
- Timestamp matches expected timezone

If history shows success but no visible output, this is a destination visibility problem, not a scheduler problem.

---

## 5) If it still fails: reset and retest cleanly

- Create a brand-new one-shot job (don’t reuse old config)
- Use explicit destination (named thread/channel/session)
- Use plain text payload only (no extra complexity)
- Re-run canary test

If canary passes, reintroduce complexity one variable at a time.

---

## 6) Support escalation packet (copy/paste)

```
Background Task Escalation Packet

Expected behavior:
Actual behavior:

Schedule config:
- kind:
- expression/time:
- timezone:

Routing config:
- sessionTarget:
- delivery.mode:
- delivery destination:

Canary test:
- created at:
- expected fire time:
- run history result:
- where output appeared (or not):

Environment:
- surface used (dashboard/Discord DM/server thread):
- any recent thread/session/account switch:
```

---

## Bottom line

Most “background task failed” reports are really **delivery context mismatch**. Prove schedule + destination with a tiny canary first, then scale up.
