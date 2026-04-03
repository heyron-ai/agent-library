# ANTI-BOT-CHECKPOINT-HANDOFF.md

Use this when your agent gets blocked by **reCAPTCHA / Cloudflare / “Verify you’re human”** pages.

Goal: keep work moving without endless retry loops.

---

## 1) Fast Diagnosis (60 seconds)

- [ ] Did the agent explicitly report a human-verification checkpoint?
- [ ] Is the page login-gated (SSO/2FA) or challenge-gated (CAPTCHA/Cloudflare)?
- [ ] Are you using VPN/proxy/ad-block/privacy extensions that could increase challenge rate?
- [ ] Are you testing in the same browser/session where you solved auth earlier?

If yes to checkpoint/challenge: **do manual handoff now** (don’t keep asking the agent to brute-force it).

---

## 2) Manual Checkpoint Handoff Pattern

1. **Human step (you):**
   - Open the target URL in your browser.
   - Complete CAPTCHA / login / 2FA manually.
   - Confirm the destination page is fully loaded.

2. **Agent step:**
   - Give the agent a short resume packet (below).
   - Ask it to continue from the now-accessible page/data.

---

## 3) Resume Packet (Copy/Paste)

```text
Checkpoint cleared manually.
Target URL: [paste URL]
What I completed: [captcha/login/2FA]
Current page title/state: [paste visible page title or section]
Task to continue: [exact task]
Constraints: If another checkpoint appears, stop and report exactly where it happened.
```

---

## 4) Loop-Break Rules (critical)

- Do not run more than **2 automated retries** after a checkpoint.
- If challenge repeats, switch immediately to manual handoff + resume packet.
- If challenges repeat even for humans, test with:
  - VPN/proxy off
  - privacy/ad-block extensions off
  - same origin/session (no mixed local vs remote host URLs)

---

## 5) Common Misdiagnoses

### “Agent is broken”
Usually false. Many anti-bot systems intentionally block automated browser behavior.

### “It worked yesterday, now it fails”
Likely session trust/reputation changed (network, cookies, extensions, login state).

### “I solved CAPTCHA but it still loops”
Often caused by switching sessions/origins mid-flow (different host, tab, or identity context).

---

## 6) Known-Good Recovery Flow

1. Open target in one clean browser session.
2. Complete verification manually.
3. Confirm destination page content is visible.
4. Send resume packet to agent.
5. Require evidence after each major step (what changed, where, and output proof).

---

## 7) Escalation Packet (if still stuck)

Share this in support:

- URL domain (redact sensitive query params)
- Checkpoint type (reCAPTCHA, Cloudflare, SSO, 2FA)
- Platform/surface (Dashboard/Discord/other)
- Timestamp + timezone
- VPN/proxy status
- Browser + extension state
- Exact point where loop reappears

---

## Bottom Line

For anti-bot checkpoints, the fastest reliable workflow is:
**human clears checkpoint → agent resumes with explicit context + evidence checks.**
