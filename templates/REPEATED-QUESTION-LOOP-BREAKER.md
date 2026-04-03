# REPEATED-QUESTION-LOOP-BREAKER.md

Use this when your agent keeps asking for information you already gave.

## Goal
Break the loop fast and force a one-shot missing-info request + execution.

## 60-Second Diagnosis
If any are true, you’re likely in a question loop:

- The agent repeats the same clarifying question 2+ times
- It asks for data already present in your message/files
- It says “need more info” without listing exact missing fields
- It keeps planning but doesn’t execute

## Copy/Paste Recovery Prompt

```text
You are in a repeated-question loop. Stop asking broad clarifying questions.

Step 1) Extract requirements from my last message and list them as:
- confirmed_requirements
- missing_required_fields (must be specific)
- assumptions_you_will_use_if_not_provided

Step 2) Ask ONE final question only if missing_required_fields is non-empty.
Your question must be a compact checklist format with exact field names.

Step 3) If missing_required_fields is empty, execute immediately.
Return:
- action_taken
- evidence (file paths, command output, or exact produced artifact)
- done_criteria_check (pass/fail with reason)

Rules:
- Do not ask the same question twice.
- Do not ask optional/preference questions unless they block execution.
- If blocked by approval/tool limits, state the exact blocker once and provide the smallest next action.
```

## One-Shot Missing-Fields Format (Required)
If the agent must ask one final question, force this structure:

```text
Missing required fields:
1) <field_name>: <why required>
2) <field_name>: <why required>
Reply in one line: field1=...; field2=...
```

## Loop-Break Rules
- **Max clarify turns:** 1
- **If repeated question appears again:** start a fresh session and paste only:
  1) objective, 2) constraints, 3) required output format, 4) hard deadline.
- **If execution is approval-gated:** approve exact current command, then require evidence output.

## Known-Good Minimal Task Packet
Use this packet to prevent ambiguity:

```text
OBJECTIVE: <single sentence>
INPUTS: <links/files/paths>
CONSTRAINTS: <must include / must avoid>
OUTPUT FORMAT: <exact structure>
DONE WHEN: <verifiable yes/no condition>
```

## Escalate to Support When
Escalate only after you can provide:

- Exact repeated question text (2+ occurrences)
- Your original request text
- Surface/session used (dashboard, DM, server channel, thread)
- Whether approval prompts appeared
- What happened after the recovery prompt

---

Use this template as a standard “anti-loop override” in high-friction tasks.
