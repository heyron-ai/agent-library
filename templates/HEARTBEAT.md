# HEARTBEAT.md - Proactive Checklists for Your Agent

Use this file to tell your agent what to do when it receives heartbeat polls.

Keep it short. Keep it practical. Keep it current.

---

## How to use this template

- Pick **2–4 checks** max per heartbeat cycle
- Prefer **batched checks** over one-off tasks
- Add **quiet hours** so your agent doesn't spam you
- Update this file as your priorities change

---

## Default Heartbeat Routine

On each heartbeat:

1. Check **email** for urgent/unread from VIP contacts
2. Check **calendar** for events in next 24 hours
3. Check **project repos** for failing CI or blocked PRs
4. If anything important changed, send one concise update
5. If nothing important changed, return `HEARTBEAT_OK`

---

## Priority Rules

Escalate immediately if:

- Calendar event starts in <2 hours and needs prep
- A customer/support escalation appears
- Production system status turns red
- A high-priority message is waiting on me

Do not notify if:

- It's between **23:00 and 08:00** local time (unless urgent)
- The same issue was already reported recently
- No new information is available

---

## Optional Rotating Checks

Rotate one of these each cycle (don't do all every time):

- Community mentions / DMs
- Weather before commute or events
- Daily spending / cloud budget anomalies
- Open tasks older than 3 days
- Drafting tomorrow's priorities

---

## Output Style

When reporting updates, use this structure:

- **What changed**
- **Why it matters**
- **What I recommend next**

Keep updates under 6 bullets unless I ask for detail.

---

## Last Updated

- Date: 2026-03-31
- Owner: Glow Cloud template
