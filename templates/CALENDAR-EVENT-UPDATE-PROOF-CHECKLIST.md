# CALENDAR-EVENT-UPDATE-PROOF-CHECKLIST.md

Use this when users say:
- “The agent said it updated my calendar event, but I still see the old time/details.”
- “Edits to recurring events are inconsistent.”
- “It works sometimes, then reverts.”

Goal: prove **which event** was targeted, **what changed**, and **where mismatch still exists** before retrying.

---

## 0) Loop-break rule (read first)

Do **not** retry broad “update again” prompts repeatedly.

Run one proof cycle:
1. lock event identity
2. do one tiny canary update
3. read back exact fields
4. compare timezone/rendering

If proof fails, escalate once with evidence.

---

## 1) Lock event identity (no guessing)

Collect and paste:
- Calendar account email in use
- Calendar name/ID
- Event ID (if available)
- Event title
- Current start/end with timezone
- Recurring? (`yes/no`)
- If recurring: target scope (`single occurrence` vs `entire series`)

If you can’t produce event identity, stop and gather it first.

---

## 2) Baseline read (before edit)

Have the agent return this **exact baseline**:
- Event ID
- Summary/title
- Start datetime + timezone
- End datetime + timezone
- Recurrence rule (if any)
- Last-updated timestamp

Save this as “BEFORE”.

---

## 3) Tiny canary update

Make one minimal, reversible change only:
- Append `" [CANARY]"` to title **or**
- Move start time by +5 minutes

Then immediately read the event back and return full fields again.

Save this as “AFTER”.

---

## 4) Compare proof (BEFORE vs AFTER)

Confirm all of these:
- Same event ID before/after
- Intended field changed
- Unintended fields did not drift
- Timezone is explicitly shown in both reads

If event ID changed, you likely edited the wrong event.

---

## 5) High-friction edge cases

### A) Recurring event scope mismatch
Symptoms: one instance changed, series didn’t (or vice versa).

Fix:
- Repeat update with explicit scope: `single occurrence` or `entire series`
- Read back both target instance and series metadata

### B) Organizer/permission mismatch
Symptoms: update appears to “succeed” but doesn’t persist or partially applies.

Fix:
- Confirm editor/organizer permission level on that calendar/event
- Test with a canary event created by the same account

### C) Timezone/rendering mismatch
Symptoms: API says updated, UI still “looks old.”

Fix:
- Compare timezone on:
  - account settings
  - calendar settings
  - event start/end values
- Force explicit timezone in update payload and readback

### D) Stale UI cache
Symptoms: API readback is correct but calendar UI shows old details.

Fix:
- Hard refresh calendar UI
- Re-open event by direct event link/ID
- Check from another client (web/mobile)

---

## 6) Known-good recovery prompt (copy/paste)

```text
Do a proof-first calendar update check.

1) Identify the exact target event and return: calendar account, calendar name/ID, event ID, recurrence info, current start/end with timezone.
2) Read and print full BEFORE fields (title, start/end+timezone, recurrence, last-updated).
3) Perform one tiny canary change only (append " [CANARY]" to title OR +5 min start).
4) Read and print full AFTER fields.
5) Confirm whether the same event ID was updated and whether the intended field changed.
6) If mismatch remains, classify root cause as one of:
   - wrong event identity
   - recurring-scope mismatch
   - permission/organizer restriction
   - timezone/rendering mismatch
   - stale UI cache
7) Return one next action only, with exact evidence used.
```

---

## 7) Escalation packet (if still broken)

Send this in one message:
- Exact error text (if any)
- Calendar account + calendar ID
- Event ID
- Recurring scope attempted (`single`/`series`)
- BEFORE vs AFTER field snapshots
- Timezone values at account/calendar/event level
- Whether UI refresh/alternate client was tested
- Timestamp + timezone of last failed attempt

This avoids duplicate-ticket loops and speeds triage.