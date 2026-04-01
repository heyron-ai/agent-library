# EXECUTION-LAYER-OUTAGE-PLAYBOOK.md

Use this when users report: **“my agent still chats, but tools/commands are hanging or timing out.”**

This playbook helps isolate execution-layer issues from normal model latency.

---

## 1) Confirm the symptom in plain English

Ask for a one-line expected vs actual:

- **Expected:** “Run a tiny command and return output.”
- **Actual:** “Agent replies in chat, but command/tool calls never finish or time out.”

If chat itself is also dead/slow, use a broader uptime incident flow instead.

---

## 2) Run a tiny known-good test (under 10 seconds)

Use one of these minimal tasks:

- `Print current working directory`
- `List top-level files only`
- `Return current date/time`

If these fail repeatedly, this is likely execution-layer degradation (not prompt quality).

---

## 3) Isolation matrix (fast)

Run quick A/B checks:

1. **New chat/session** → retry tiny test
2. **Different channel/surface** (dashboard vs Discord DM/server) → retry
3. **Different model** (same task) → retry

Interpretation:

- Fails everywhere = likely runtime/execution plane issue
- Fails in one context only = session/channel config issue
- Works after new session = stale context/session lock issue

---

## 4) Recovery sequence (safe order)

1. Start a fresh session/chat
2. Retry tiny known-good task
3. Restart gateway/runtime service if available
4. Retry tiny task again
5. Re-run original user task only after tiny task passes

Do **not** jump straight to complex tasks while baseline checks are failing.

---

## 5) Distinguish from common false positives

Not an execution-layer outage if:

- Task is waiting on **Approval Required** and user has not approved
- Task is blocked by missing credentials/API key
- Task exceeds context/token/tool limits
- Destination mismatch (output sent to a different session/channel)

Always verify these before escalating.

---

## 6) Escalation packet (copy/paste)

```
Execution-Layer Escalation Packet

- Time (with timezone):
- Surface(s) tested: (dashboard / Discord DM / Discord server)
- Tiny test used:
- Tiny test result:
- New session result:
- Model switch result:
- Restart performed: (yes/no + what restarted)
- Original task summary:
- Approval pending anywhere: (yes/no)
- Error text/screenshots:
```

---

## 7) User-facing status update template

Use this when reporting back to users:

> “Your agent’s chat response path is up, but the execution layer appears degraded. We confirmed this with tiny baseline tests, ran fresh-session isolation, and applied restart recovery. Next update in X minutes with either restored execution or escalation results.”

---

## Why this works

This playbook prevents misdiagnosing execution outages as “bad prompting” and gives a deterministic, reproducible path for recovery and escalation.