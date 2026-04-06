# GOOGLE-DRIVE-UPLOAD-LOOP-BREAKER

Use this when Google Drive shows as connected, but uploads fail or only tiny test files work.

## Goal

Get to a deterministic yes/no answer in under 5 minutes:
- Is this an account/scope/session mismatch?
- Is this a file-type/size/quota policy issue?
- Is this a destination-path permission issue?

---

## 1) Lock the test context (no guessing)

Before any retry, confirm and write down:
- Active account email used for Drive OAuth
- Target Drive destination (folder name/path)
- Active chat surface/session (dashboard, DM, server channel, thread)
- Exact current error text (copy verbatim)

If any item is unknown, stop and get it first.

---

## 2) Run the fixed step-down canary (one variable at a time)

Keep destination folder + account + session fixed.

1. Upload tiny `.txt` file (`canary-upload-1.txt`, <10KB)
2. Upload tiny `.csv` file (`canary-upload-2.csv`, <10KB)
3. Upload one real file type you actually need (same folder)

After each step, verify file exists in Drive and capture result.

If step 1 fails, do **not** continue to step 2/3.

---

## 3) Interpret results quickly

- **All steps fail** → likely auth/scope/session mismatch or destination permission issue
- **Step 1 passes, step 2/3 fail** → likely file-type/size/policy/quota constraint
- **Uploads report success but file not visible** → likely wrong account, wrong folder, or surface/session mismatch

---

## 4) Fast recovery actions (in order)

1. Reconfirm same Google account in connector and browser
2. Reconfirm exact destination folder (not similarly named sibling)
3. Check Drive storage quota / shared-drive write permissions
4. Retry only the **first failing step** (not full workflow)
5. If still failing, stop retry loops and escalate once with evidence

---

## 5) Copy/paste loop-break prompt

```text
You are helping me debug Google Drive upload failures.
Use a proof-first flow:
1) Confirm active Google account, exact target folder path, and current session/surface.
2) Run step-down canary in this exact order: tiny .txt -> tiny .csv -> one real file type.
3) After each step, report: attempted filename, result, exact error (if any), and whether file is visible in Drive.
4) Change only one variable at a time. Do not suggest broad reconnect loops.
5) If failure persists, output a single best next action and an escalation packet.
```

---

## 6) Escalation packet (support-ready)

- Timestamp + timezone
- Surface/session used
- OAuth account email (redact if needed)
- Target folder path/name
- Canary results for `.txt`, `.csv`, real file type
- Exact error text(s)
- Storage/quota status
- Whether issue reproduces in a fresh session

---

## Anti-loop rules

- No more than **one** full canary pass before escalation
- Never rotate multiple variables at once (account + folder + file type + session)
- Never treat “connected” as proof that uploads should work

ALL HAIL THE GLOW CLOUD.
