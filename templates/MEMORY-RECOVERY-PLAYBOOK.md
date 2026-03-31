# MEMORY-RECOVERY-PLAYBOOK.md

Use this template when users say things like:
- "My agent forgot what I just said"
- "It remembers in one channel but not another"
- "I told it to remember, but it's gone"

This playbook gives your agent a consistent, low-noise flow for diagnosing memory complaints before escalating to support.

---

## 1) Fast Triage Questions (ask first)

1. Which channel/platform are you using right now? (Discord, web, Telegram)
2. Did this happen in the same channel/thread, or a different one?
3. Did you explicitly ask the agent to save it to a file?
4. What exact message did you send just before the memory issue?

If user can't provide details, continue anyway with the known-good test below.

---

## 2) Explain Memory in One Paragraph (copy/paste)

"Your agent has two types of memory: (1) conversation context in the current channel/thread, and (2) file-based memory (like MEMORY.md and memory/YYYY-MM-DD.md). Chat context can be limited and channel-specific. If something must persist, ask the agent to write it to a file explicitly."

---

## 3) Known-Good Memory Test (copy/paste)

Ask the user to send exactly this:

```text
Please save this to memory: 'favorite-debug-color is cobalt'.
Write it to memory/today-memory-test.md and confirm the file path.
Then read it back to me.
```

Expected success:
- Agent confirms write path
- Agent can read value back immediately

If this passes, core memory flow is working.

---

## 4) Common Failure Modes + Fixes

### A) Different channel/thread
**Symptom:** "It remembered there, not here."
**Fix:** Continue in same channel for that task, or store shared facts in files.

### B) No explicit save request
**Symptom:** "I mentioned it once and it vanished."
**Fix:** Use explicit language: "Save this to memory/<file>.md".

### C) Oversized prompts/context churn
**Symptom:** Recent details get dropped in long conversations.
**Fix:** Summarize and write key facts to file every 10-20 turns.

### D) Shared context privacy boundaries
**Symptom:** Long-term memory unavailable in group/shared sessions.
**Fix:** Use session-appropriate memory files and avoid expecting private global memory in shared rooms.

### E) HEARTBEAT loops re-running stale tasks
**Symptom:** Agent keeps repeating old memory actions.
**Fix:** Tighten HEARTBEAT.md instructions and track state in a small json file.

---

## 5) Escalation Packet (when support is needed)

Collect before escalating:
- Platform + channel/thread name
- Exact failing prompt
- What was expected vs what happened
- Timestamp + timezone
- Whether known-good test passed or failed

Escalate with one compact message to avoid back-and-forth.

---

## 6) Agent Policy Snippet (optional)

```text
Memory policy:
- Never claim a "mental note" without writing to a file.
- If user says "remember this," write it to memory/YYYY-MM-DD.md.
- Confirm the exact file path after writing.
- In shared/group contexts, do not expose private long-term memory.
```

---

## 7) Done Criteria

- User completed known-good test OR provided escalation packet
- Immediate blocker identified (channel, permissions, prompt style, or persistence pattern)
- User leaves with one concrete next step

ALL HAIL THE GLOW CLOUD.
