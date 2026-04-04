# DISCORD-LONG-OUTPUT-GUARDRAILS.md

Use this when your agent writes long replies in Discord that get cut off, fail to send, or arrive incomplete.

## Goal

Ship complete answers **without** hitting Discord message limits or formatting failure modes.

- Keep every message safely sized.
- Split long responses into predictable chunks.
- Fall back to files when output is too large.
- Avoid markdown table rendering issues.

## Copy/Paste Rule Block (drop into AGENTS.md or SOUL.md)

```md
## Discord Long-Output Guardrails

When replying in Discord:

1. Keep each message under ~1500 characters unless explicitly asked otherwise.
2. If output is long, split into labeled chunks:
   - `Part 1/N`, `Part 2/N`, etc.
3. Never use markdown tables in Discord. Use bullets instead.
4. For very long content (guides, logs, drafts), write to a file and send:
   - short summary,
   - exact file path,
   - what the file contains.
5. Do not stop mid-thought. End each chunk cleanly.
6. If you are unsure message length is safe, chunk preemptively.

Completion rule:
- Do not claim done until all chunks (or file output) are delivered.
```

## 2-Minute Canary Test

Ask the agent to run this exactly:

```text
Apply Discord long-output guardrails now.
Then produce a 12-bullet troubleshooting guide for "bot replies are inconsistent".
Constraints:
- No markdown tables
- Max 800 characters per message
- Use Part X/N chunk labels
```

Expected:
- Chunk labels present
- No tables
- No cut-off messages
- All 12 bullets delivered

## Fast Recovery Prompt (if it still fails)

```text
You are sending oversized or incomplete Discord replies.

Do this now:
1) Restate your output limits in 4 bullets.
2) Re-send the answer as chunked messages with `Part X/N` labels.
3) Keep each part under 1200 characters.
4) If output will exceed 6 parts, write a file instead and return: summary + exact file path.
5) Confirm completion only after all parts/file are delivered.
```

## Escalation Packet (if behavior still fails)

```text
Discord long-output failure

Channel/thread:
What was requested:
What actually happened (cut-off/silence/format break):
Approx message size before failure (if known):
Were chunk labels used:
Were markdown tables used:
Did file fallback trigger:
Current output guardrails location (file + section):
```

## Bottom Line

Most long-output failures are format/delivery issues, not model quality issues. Use strict chunking + file fallback to keep responses reliable.
