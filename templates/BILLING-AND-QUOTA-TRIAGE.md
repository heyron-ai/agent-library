# BILLING-AND-QUOTA-TRIAGE.md

Use this when users report billing/refund confusion, `403`/quota failures, or “all models failed” behavior.

---

## 1) Identify the failure class (60 seconds)

Collect exact error text and route it:

- **Platform/billing request**
  - “How do I cancel?”
  - “Can I get a refund?”
  - “What does my Heyron subscription include?”
- **Provider quota/auth**
  - `403 Key limit exceeded`
  - `insufficient_quota`
  - `invalid_api_key`
  - `unauthorized`
- **Model/config mismatch**
  - `invalid model id`
  - fallback model confusion
  - key updated but same error persists

If no exact error text is available, ask for it before changing anything.

---

## 2) Fast recovery flow (2–4 minutes)

### A) If this is cancellation/refund confusion

1. Confirm what the user wants: **cancel only** vs **cancel + refund request**.
2. Have them complete cancellation in the billing UI first.
3. If refund is requested, prepare a support packet (template below) with charge date/amount and account email.
4. If support DMs are blocked, use the server-thread fallback path.

### B) If this is quota/auth (`403`, key limit, unauthorized)

1. Confirm which key/provider is active **right now**.
2. Check provider quota/credits/limits in provider dashboard.
3. Rotate key only if needed; remove/disable old key to avoid mixed-key confusion.
4. Start a fresh session/restart runtime, then run one tiny canary task.
5. If failure persists, capture exact error + timestamp + timezone and escalate.

### C) If this is model/fallback mismatch

1. Verify exact model ID format for the selected provider.
2. Confirm primary + fallback sequence.
3. Re-test with one known-good model.
4. If known-good works, fix fallback chain and re-test once.

---

## 3) Known-good canary test

Use a tiny, deterministic task after any billing/key/model change:

> “Run one minimal test and return: active model id, provider, and the exact error text (if any). Do not continue to larger tasks.”

Pass condition: explicit model/provider proof + successful response.

---

## 4) High-friction mistakes to avoid

- Treating “updated key” as enough without fresh-session/runtime restart
- Mixing keys from different providers in one troubleshooting attempt
- Escalating without exact error text
- Assuming Heyron subscription implies unlimited third-party provider quota
- Changing multiple variables at once (model + key + fallback + destination)

---

## 5) Escalation packet (copy/paste)

```md
## Billing/Quota Escalation Packet

- Goal: (cancel / refund / restore model access)
- Exact error text: 
- First seen (local time + timezone): 
- Account email (redacted if needed): 
- Platform plan/subscription state: 
- Provider in use: 
- Active model id: 
- Fallback model ids: 
- Key rotated? (yes/no + when): 
- Runtime/session restarted after changes? (yes/no): 
- Canary test result: 
- Charge details (if billing/refund): date, amount, last4/receipt id (if available)
- DM available for support follow-up? (yes/no)
```

---

## Bottom line

Separate **billing workflow** issues from **provider quota/auth** issues first. Use one-variable-at-a-time changes, require exact error text, and verify with a tiny canary test before resuming normal work.
