# LANGUAGE-LOCK-PLAYBOOK.md

Use this when your agent keeps replying in the wrong language, switches language mid-task, or ignores your preference after a reset.

---

## 1) Fast Triage (2 minutes)

1. **Pick one target language** (example: `English`).
2. Start a **fresh session/thread**.
3. Send this canary prompt:

```text
Language lock test:
- Reply ONLY in English.
- Confirm with exactly: "LANGUAGE_LOCK_OK: English"
- Then summarize this sentence in one line: "The meeting moved to next Tuesday at 3 PM."
```

4. If the response is not fully in the target language, continue to section 2.

---

## 2) Apply Hard Language Lock

Send this instruction block before any real task:

```text
From now on, output language is strictly English.

Rules:
1) All responses must be in English.
2) If user input is in another language, you may translate internally but output must remain English.
3) Do not mix languages in the same response.
4) If a quoted source is in another language, keep the quote unchanged but explain it in English.
5) If you cannot follow this, stop and ask one clarification question instead of guessing.

Acknowledge with: LANGUAGE_LOCK_APPLIED: English
```

Then immediately retest with the canary from section 1.

---

## 3) Common Failure Modes

### A) Works in DM, fails in server channel
- Likely a **surface/context mismatch** (different session history/rules).
- Re-apply the hard lock in the exact surface where you need output.

### B) First reply is correct, later replies drift
- Add a per-task reminder line:

```text
Reminder: output language is strictly English for this task.
```

- Keep tasks shorter and checkpoint after each major step.

### C) Translation requests cause mixed-language output
- Ask for this format explicitly:

```text
Output format:
- Final answer: English only
- Optional source quote: original language in quotes
```

### D) Agent keeps asking clarifying questions in another language
- Force one-shot missing-fields behavior:

```text
If anything is missing, ask exactly one question in English, then wait.
```

---

## 4) Known-Good Recovery Prompt (Copy/Paste)

```text
Recover language drift now.

Target output language: English.

1) Confirm active language lock with exact text: LANGUAGE_LOCK_OK: English
2) Summarize the next user request in 2 bullet points, English only.
3) Execute the request.
4) End with: LANGUAGE_LOCK_STABLE: yes/no

If blocked, ask one concise question in English only.
```

---

## 5) Escalation Packet (if still broken)

Share this in support:

- Surface where it fails: (Dashboard / Discord DM / Discord Channel / Thread)
- Target language:
- Canary prompt used:
- Actual output received (exact text):
- Did fresh session help? (yes/no)
- Did hard lock acknowledgment appear? (yes/no)
- Approx timestamp + timezone:

---

## Bottom Line

Most language-drift incidents are **context/surface mismatch** or missing hard constraints. A fresh session + explicit language lock + canary test fixes the majority of cases quickly.