# AUTOMATION-HANDOFF-DECISION.md

Use this when you’re unsure if your agent can do a task fully end-to-end, or if part of it requires a human handoff.

## Goal

Avoid wasting time/tokens on long prompts before capability is confirmed.

## 2-Minute Canary (Do This First)

Ask your agent:

```text
I need a capability check before execution.
Task: [describe task in one sentence]
Return only:
1) Can you complete this fully inside current tools/context? (YES/NO)
2) If NO, exactly which step needs human handoff?
3) Smallest possible canary action you CAN do right now to prove progress.
4) What final manual click/action is required from me, if any?
No long plan. No assumptions.
```

## Decision Rules

- If **YES** + canary succeeds → continue with full task.
- If **NO** → split into:
  - **Agent lane:** research, drafting, formatting, prep artifacts.
  - **Human lane:** auth/login, approvals, UI clicks, final publish.
- If answer is vague → rerun canary with stricter output:
  - “Return YES/NO only, then one blocking step.”

## Common Handoff Cases

- Social platforms (Instagram/TikTok/manual final publish)
- Protected dashboards with anti-bot/login checkpoints
- Platform-native moderation actions (some Discord admin actions)
- External tools that require account-side confirmation

## Known-Good Execution Prompt

```text
Work in two lanes.
Lane A (agent): Do all preparatory work and produce final-ready artifacts.
Lane B (human): List only required manual steps in exact order.
Constraints:
- Do not claim completion until Lane A is done and Lane B is listed.
- If blocked, return: BLOCKED + exact blocker + next smallest unblocked step.
- Keep response concise and proof-based.
At the end return:
- Completed artifacts (with names/paths)
- Manual handoff checklist (numbered)
- Verification step after handoff
```

## Loop Breaker (If You Keep Retrying)

Use this once:

```text
Stop retrying broad fixes. Do a one-variable test.
Compare:
- Attempt A: minimal canary in current context
- Attempt B: same canary in a fresh session/surface
Return only: what changed, what that proves, and next single action.
```

## Escalation Packet (Copy/Paste)

```text
Issue: [one line]
Expected outcome:
Actual outcome:
Capability canary prompt used:
Canary result (YES/NO + blocker):
What works already:
What fails exactly:
Surface/context used (dashboard/DM/server/thread):
Exact error text (if any):
```

## Bottom Line

Capability-first beats retry-first. Run a tiny canary, split agent work from human handoff, and only scale up after proof.
