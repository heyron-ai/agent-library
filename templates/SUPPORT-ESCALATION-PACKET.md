# SUPPORT-ESCALATION-PACKET.md

Use this when a user is still blocked after basic troubleshooting.

The goal: produce one clean message support can act on immediately (no back-and-forth for missing context).

---

## 1) User-facing intake (copy/paste)

```md
I can help escalate this fast. Please paste the details below in one message:

1) What are you trying to do?
2) What did you expect to happen?
3) What happened instead? (exact error text if any)
4) Where does it fail? (Web / Discord / Telegram / CLI)
5) First time seen + how often? (once / intermittent / always)
6) What changed right before it started? (new key, new model, new channel, restart, etc.)
7) What have you already tried?

If possible, include:
- Screenshot of the error
- Relevant IDs (agent ID, channel ID, run/session ID)
- Approx time with timezone
```

---

## 2) Fast triage classification

Pick one primary category:

- **Access/Auth** — invalid API key, token rejected, permission denied
- **Connectivity** — timeouts, unreachable service, network/proxy/VPN issues
- **Platform Integration** — Discord/Telegram setup, permissions, channel restrictions
- **Model/Provider** — quota/rate limit, model unavailable, provider error
- **Prompt/Context** — context limit exceeded, malformed prompt, giant payload
- **Execution/Approval** — blocked on approval prompt or unsafe command review
- **Memory/State** — “agent forgot”, stale context, session mismatch
- **Unknown/Intermittent** — can’t reproduce consistently

---

## 3) Minimum evidence checklist

Collect as many as possible before escalating:

- [ ] Exact error message (verbatim)
- [ ] Reproduction steps (numbered)
- [ ] Last known good timestamp
- [ ] Current timestamp + timezone
- [ ] Environment (web/desktop/mobile + OS + browser/app version)
- [ ] Agent/runtime details (model, skill in use, heartbeat/cron involvement)
- [ ] Scope (single user vs multiple users)
- [ ] Impact (blocked / degraded / cosmetic)

---

## 4) Known-good isolation flow (2–5 min)

Run these in order and note results:

1. **Control test:** Try a minimal known-good prompt/task in a clean context.
2. **Surface swap:** If failing in Discord, test in web (or vice versa).
3. **Scope check:** Test with another channel/thread/user if available.
4. **Fresh context:** New session/thread; retry once.
5. **Credential sanity:** Re-save/revalidate relevant token/key (without exposing secrets).
6. **Permission sanity:** Confirm channel/app/integration permissions.

If any step succeeds, include that diff in escalation (it usually reveals root cause).

---

## 5) Escalation message template (copy/paste)

```md
### Escalation: [short issue title]

**Summary**
User is blocked on: [one sentence]

**Expected vs Actual**
- Expected: [x]
- Actual: [y]

**Category**
[Access/Auth | Connectivity | Platform Integration | Model/Provider | Prompt/Context | Execution/Approval | Memory/State | Unknown]

**Impact**
[Blocked / Degraded / Cosmetic]

**Repro Steps**
1. [step]
2. [step]
3. [step]

**Error (verbatim)**
`[exact error text]`

**Environment**
- Surface: [Web/Discord/Telegram/CLI]
- Device/OS: [e.g., macOS 15, iOS 18]
- App/Browser version: [if known]
- Time observed: [YYYY-MM-DD HH:mm TZ]

**Isolation Results**
- Control test: [pass/fail]
- Surface swap: [result]
- Fresh session/thread: [result]
- Credential recheck: [result]
- Permission recheck: [result]

**Scope**
[Single user / Multiple users / Unknown]

**Attachments**
- Screenshot(s): [yes/no]
- IDs: [agent/channel/run/session IDs]

**Ask**
Please advise next action or owner for deeper investigation.
```

---

## 6) Redaction rule (non-negotiable)

Never paste raw secrets (API keys, bot tokens, personal access tokens, cookies).

If needed, format as:

- `sk_live_...ABCD` (only prefix + last 4)
- `token_...WXYZ`

---

## 7) Definition of done

Escalation is “good” when support can attempt reproduction without asking follow-up questions for basic missing context.
