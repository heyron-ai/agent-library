# HEARTBEAT-CRON-DECISION-WORKFLOW.md

Use this when someone asks:
- “Should I use heartbeat or cron for this?”
- “Why did my reminder fire late / in the wrong place?”
- “Why did heartbeat run but nothing happened?”

Goal: choose the right scheduler up front, then verify timing + destination before doing real work.

---

## 1) Fast Decision Rule (30 seconds)

Use **cron** if any of these are true:
- Timing must be exact (`9:00 AM every weekday`, `in 20 minutes`, `first business day`)
- You need standalone execution independent of active chat flow
- You need explicit destination routing (`sessionTarget`, announce channel, webhook)
- Missing one run is expensive

Use **heartbeat** if all of these are true:
- Timing can drift (roughly every 30–60 minutes is fine)
- Work is lightweight and can be batched (email + calendar + mentions)
- You want context-aware behavior in the main conversational session
- “No update” outcomes are acceptable (`HEARTBEAT_OK`)

If uncertain: start with **cron** for reminders/tasks, heartbeat for **maintenance sweeps**.

---

## 2) Preflight Checklist (before creating anything)

- [ ] Define exact local timezone (e.g., `America/New_York`)
- [ ] Define expected fire time(s) in local time
- [ ] Define destination (DM, server channel, thread, webhook, main session)
- [ ] Define success evidence (“What proof should appear when it works?”)
- [ ] Decide one canary test run before production schedule

---

## 3) Known-Good Cron Pattern

Ask the agent to return:
1. Parsed schedule in plain English
2. Timezone used
3. Next 3 run times (local + UTC)
4. Exact destination where output will appear

Use this prompt block:

```text
Create a cron job for [TASK] with timezone [TIMEZONE].
Before finalizing, print:
- schedule expression / one-shot time
- next 3 run times in local + UTC
- destination routing (sessionTarget + delivery)
Then run one canary test in 2 minutes and confirm where it delivered.
```

---

## 4) Known-Good Heartbeat Pattern

Keep heartbeat tasks tiny and optional.

Use this prompt block:

```text
Update HEARTBEAT.md to do only these checks:
1) [check A]
2) [check B]
If nothing meaningful changed, respond HEARTBEAT_OK.
Do not run heavy tasks. Do not re-run stale tasks from old chats.
```

Optional state file pattern:
- `memory/heartbeat-state.json` with last check timestamps
- Skip checks done too recently

---

## 5) Failure Triage (2-minute loop breaker)

If user says **“cron didn’t fire”**:
1. Confirm job is enabled and visible (include disabled in list)
2. Confirm timezone and next run are what user expects
3. Confirm destination routing (wrong thread/channel is common)
4. Trigger one immediate canary run
5. Capture result evidence (run id, timestamp, destination)

If user says **“heartbeat did nothing”**:
1. Confirm HEARTBEAT.md has concrete tasks (not vague instructions)
2. Confirm tasks are still relevant (not stale old-task replay)
3. Run tiny canary heartbeat task with obvious output
4. If exact-time behavior is required, migrate to cron

---

## 6) Common Mistakes to Catch Early

- Using heartbeat for exact-time reminders
- Forgetting timezone (implicit UTC surprises)
- Assuming “job ran” means “delivered to expected place”
- Reusing old thread/session after context reset
- Running huge heartbeat task lists that silently fail or get skipped

---

## 7) Escalation Packet (copy/paste)

```text
Scheduler type: [cron|heartbeat]
Goal: [what should happen]
Timezone: [IANA timezone]
Expected fire time(s): [local time]
Observed behavior: [what happened]
Destination expected: [channel/thread/session/webhook]
Destination observed: [where output actually appeared]
Canary test result: [pass/fail + timestamp]
Evidence: [job id / run id / exact error text]
```

---

## Bottom Line

- **Cron = precision + explicit delivery**
- **Heartbeat = periodic context-aware maintenance**
- Always run a **canary test** and prove **destination + timezone** before trusting production behavior
