# CONTEXT-HANDOFF-CHECKLIST.md

Use this when users say things like:
- “My agent forgot everything when I moved from dashboard to Discord.”
- “DM worked, but the server channel felt like a different bot.”
- “I switched channels and lost context.”

This is usually a **context-surface mismatch**, not true memory failure.

---

## 1) 60-Second Reality Check

Confirm these truths first:

- Same agent identity can exist across multiple surfaces (dashboard, Discord DM, Discord server channels)
- **Conversation history is surface/session-specific** unless explicitly handed off
- “Memory add-ons” do not magically merge live chat history across channels

If user expected automatic carryover, treat this as expectation + workflow issue.

---

## 2) Fast Isolation Test (Copy/Paste)

Ask the user to run this exact 2-step test:

1. In Surface A (where context exists):
   - “Reply with exactly: `HANDOFF-TEST-A: pineapple-713`”
2. Move to Surface B and ask:
   - “What secret code did I just give you? If unknown, say `UNKNOWN`.”

Interpretation:
- If Surface B returns `UNKNOWN`, this is expected context separation
- If Surface B returns the code, context unexpectedly crossed (rare; verify account/session)

---

## 3) Corrective Workflow: Explicit Handoff Pattern

Use this handoff format whenever switching surfaces:

```text
Handoff summary for new context:
- Goal:
- What we already decided:
- Constraints:
- Files/links:
- Next exact action:
```

Optional one-liner version:

```text
New surface handoff: Continue from [topic]. Current status: [status]. Next step: [single concrete step].
```

---

## 4) High-Friction Gotchas

Check these before escalating:

- User logged into a second account/workspace accidentally
- User is talking to a different bot/app installation in server
- Channel-level permissions prevent normal responses, creating false “memory” symptoms
- User assumes long prior chat is still in active context after session reset/new thread

---

## 5) Known-Good Recovery Script

Give users this script:

```text
Let’s reset cleanly.
1) In this current chat, summarize our goal in 3 bullets.
2) List any required files/links.
3) Propose the next single action and wait for my confirmation.
```

This re-establishes working context quickly without replaying huge chat history.

---

## 6) Escalation Packet (If Still Broken)

If behavior still seems wrong, collect:

- Surface A + Surface B (exact locations)
- Timestamp + timezone
- Expected vs actual behavior
- Isolation test result (`pineapple-713` known or unknown)
- Screenshot/text snippet showing account/workspace identity
- Whether issue persists after starting one fresh session in each surface

---

## Bottom Line

Most “forgot everything” reports across dashboard/DM/server are **normal context boundaries**. Fix with explicit handoffs, not brute-force pasting full chat logs.
