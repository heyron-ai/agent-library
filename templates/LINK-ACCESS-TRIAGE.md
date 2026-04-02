# LINK-ACCESS-TRIAGE.md

Use this when a user says: **"The link works for me, but my agent can't open it."**

Most failures are visibility/auth issues, not model quality issues.

## 1) Fast Classification (30 seconds)

- Is the URL publicly accessible without login?
- Does the URL require cookies/session state from the user's browser?
- Does the page require clicking, scrolling, or form submission to reveal content?
- Is it behind anti-bot/CAPTCHA/WAF protection?

If any answer is **yes**, treat as an **access mismatch**, not a generic agent failure.

---

## 2) Known-Good Visibility Test (2 minutes)

Ask the user to run this exact sequence:

1. Open the URL in an **incognito/private window** (not logged in).
2. If content is blocked, export/share a visible copy:
   - public doc link, or
   - copied text, or
   - screenshot/PDF.
3. Give the agent one **public control URL** (e.g., docs page) and one **problem URL**.
4. Ask the agent to summarize both.

Interpretation:
- Public URL works + problem URL fails → visibility/auth restriction confirmed.
- Both fail → check network/tool/runtime path.

---

## 3) Copy/Paste User Prompt

```text
Before solving the task, verify URL visibility.

1) Fetch and summarize this public control URL: <PASTE_PUBLIC_URL>
2) Fetch and summarize this target URL: <PASTE_TARGET_URL>
3) If target URL is inaccessible, explicitly classify why:
   - login/auth required
   - private permissions
   - anti-bot/CAPTCHA/WAF
   - interactive browser actions required
4) If inaccessible, ask me for the minimum alternative input needed (exported text, screenshot, PDF, or public shared link).
```

---

## 4) Recovery Paths

Choose one:

- **Public-share path:** User changes sharing permissions and retries.
- **Export path:** User provides text/PDF/screenshot for analysis.
- **Manual-step handoff path:** User performs click/login steps; agent handles analysis/planning using supplied output.

---

## 5) Common Misdiagnoses

- "Agent is broken" when the page is private/login-gated.
- "Tool is down" when only one private URL fails.
- "Memory issue" when the real problem is inaccessible source data.

---

## 6) Escalation Packet (if still failing)

Collect:

- Exact URL domain (redact sensitive path/query)
- Expected behavior vs actual result
- Incognito/private-window outcome
- Whether login is required
- Whether CAPTCHA/anti-bot appeared
- One known-good public URL test result
- Timestamp + user timezone

This packet avoids back-and-forth and speeds support triage.
