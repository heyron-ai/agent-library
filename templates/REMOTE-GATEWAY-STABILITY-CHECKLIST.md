# REMOTE-GATEWAY-STABILITY-CHECKLIST.md

Use this when your browser extension or remote agent access works intermittently (disconnects, random auth/origin failures, tunnel URL changes, or "worked yesterday" loops).

## Goal

Stabilize one reliable access lane to your remote gateway, prove it with a tiny canary, then only run real tasks.

---

## 1) Capture the Current Failure (No Guessing)

Record:
- Exact error text
- Timestamp (local + UTC)
- Surface (Chrome extension, dashboard, Discord, etc.)
- Current gateway URL you are using
- Whether this fails on one device/profile or all

**Rule:** Don’t retry 10 times with different URLs. Capture one clean failure first.

---

## 2) Lock a Stable Access Lane

Pick one lane and stick to it for testing:

- **Preferred:** fixed reverse proxy domain (HTTPS, stable host)
- **Also good:** private mesh/VPN hostname (Tailscale/ZeroTier/etc.)
- **Avoid for production:** rotating tunnel URLs that change after restart

If your endpoint changes after reboot/redeploy, update every place that references it before retesting.

---

## 3) Origin + Token Consistency Check

Verify these together as one bundle:
- Gateway URL in your client/extension
- Allowed origin list on the gateway (exact scheme + host + port)
- Current gateway token/session state

Common mismatch traps:
- `http` vs `https`
- Missing port (`:3000` vs no port)
- Old tunnel URL still allowlisted
- Browser profile using stale token from older endpoint

---

## 4) One-Profile Canary (2 Minutes)

In one clean browser profile (or incognito):
1. Connect to the chosen stable endpoint
2. Run one tiny canary request
3. Confirm success in the same surface

Canary must prove all three:
- connection works
- auth works
- response returns in expected destination

If canary fails, do not run production tasks yet.

---

## 5) Loop-Break Rules

Stop retry loops if any of these happen:
- URL changed again during testing
- You switched surfaces mid-test (extension → dashboard → chat)
- You can’t reproduce same error twice with same endpoint/profile

Reset to one lane, one profile, one canary.

---

## 6) Known-Good Recovery Prompt (Copy/Paste)

```
We are fixing remote gateway instability.

Use this exact process:
1) Echo the active endpoint URL, origin, and surface you are testing.
2) Verify origin/token consistency and report any mismatch.
3) Run one tiny canary task only.
4) Return proof: endpoint used, canary result, and exact error if failed.
5) If failed, give ONE next action (not a list) and stop.

Do not continue to production tasks until canary passes.
```

---

## 7) Escalation Packet (When Still Unstable)

Share this in support:

- Active endpoint URL
- Access lane type (reverse proxy / VPN / tunnel)
- Exact error text
- First failure timestamp (local + UTC)
- Surface + browser profile used
- Origin allowlist value(s)
- Whether endpoint changed recently (yes/no)
- Canary result (pass/fail + output)

This prevents support loops and speeds root-cause isolation.

---

## Bottom Line

Most "remote gateway is flaky" incidents are endpoint drift, origin mismatch, or stale profile state—not random model failure. Stabilize one lane, prove with one canary, then scale up.
