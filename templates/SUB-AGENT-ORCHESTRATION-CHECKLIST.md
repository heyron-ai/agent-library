# SUB-AGENT-ORCHESTRATION-CHECKLIST.md

Use this when your project needs multiple agents and you want speed **without** duplicate/conflicting outputs.

## Best For
- Research + drafting + QA workflows
- Multi-step tasks where one agent gets overloaded
- Cases where users report: "I spawned sub-agents and now everything is chaotic"

## 1) Decide If You Even Need Sub-Agents

Use sub-agents only if at least one is true:
- The task has **3+ distinct phases** (e.g., collect, synthesize, verify)
- Work can be split into **parallel chunks** with clear boundaries
- The main agent can act as a strict manager/editor

If not, keep it single-agent.

---

## 2) Manager + Workers Contract (Copy/Paste)

```text
You are the manager.
Spawn workers only for parallelizable chunks.

Rules:
- Exactly one manager publishes final output.
- Workers NEVER message end users directly.
- Each worker has a non-overlapping role.
- Every worker returns output in this format:
  1) Scope completed
  2) Key findings (max 7 bullets)
  3) Evidence/sources
  4) Open risks/questions

Manager responsibilities:
- Track all worker IDs/tasks
- Detect overlaps/contradictions
- Merge and deduplicate
- Publish ONE final answer with:
  - Executive summary
  - Action plan
  - Risks
  - Next action
```

---

## 3) Task Split Pattern

### Recommended 3-worker baseline
1. **Research Worker** — facts, source links, constraints
2. **Draft Worker** — first deliverable draft
3. **QA Worker** — errors, contradictions, missing edge cases

### Guardrails
- Give each worker a strict input scope
- Set output limits (`max bullets`, `max sections`)
- Require evidence for factual claims
- Require each worker to state blockers explicitly

---

## 4) Delivery-Destination Safety Check

Before declaring done, manager must confirm:
- `session/thread/channel destination`
- `timestamp + timezone`
- whether final output is in same surface where user asked

Use this line:

```text
Final output destination confirmed: [surface/thread/channel], [timezone], [timestamp].
```

This prevents the high-friction "it ran but I can’t find it" failure mode.

---

## 5) Fast Failure Triage

### Symptom: Duplicate answers
- Multiple managers active, or stale workers still running
- Fix: enforce one-manager rule and stop duplicate workers

### Symptom: Worker timed out/partial output
- Scope too broad
- Fix: split into smaller chunks and retry with limits

### Symptom: Final merge lost key details
- Manager merged without gap-check
- Fix: require final checklist:
  - all worker outputs represented
  - contradictions resolved
  - open questions preserved

### Symptom: Output delivered to wrong place
- Session/thread mismatch
- Fix: restate destination before publish and reroute once

---

## 6) Done Criteria (Must Pass All)

- [ ] Exactly one manager final response
- [ ] Workers used non-overlapping scopes
- [ ] All factual claims include evidence/source origin
- [ ] Final output deduplicated and contradiction-checked
- [ ] Destination/timezone explicitly confirmed
- [ ] User received one clean, actionable deliverable

---

## 7) Escalation Packet (if still broken)

If orchestration keeps failing, capture and share:
- Task goal
- Manager instructions used
- Worker role definitions
- Worker outputs (raw)
- Where output was expected vs where it appeared
- Timestamp + timezone
- What was duplicated/missing

This packet cuts down support back-and-forth dramatically.

---

**Bottom line:** sub-agents increase speed only when ownership is strict. One manager, clear worker boundaries, one final output.
