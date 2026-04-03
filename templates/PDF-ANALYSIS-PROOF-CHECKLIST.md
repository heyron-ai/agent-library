# PDF-ANALYSIS-PROOF-CHECKLIST.md

Use this when users say:
- “The agent summarized my PDF wrong.”
- “It says it read the file, but details are generic/wrong.”
- “It can’t find text that is clearly in my document.”

Goal: prove whether the PDF is actually readable in the current context before deeper work.

---

## 1) File Identity Proof (60 seconds)

Ask the agent to return:
- exact filename
- full path (or exact uploaded attachment reference)
- file size
- last modified timestamp

If it cannot provide this, stop and fix file visibility first.

---

## 2) Quote-Proof Test (90 seconds)

Use this prompt exactly:

```text
Before summarizing, prove you can read this PDF.
Return:
1) exact filename you are using,
2) three verbatim quotes from three different pages,
3) page number for each quote,
4) one table/header/label exactly as written.
If you cannot do this, say "READABILITY_FAIL" and explain why.
```

Pass criteria:
- Quotes are exact (not paraphrased)
- Page numbers are coherent
- At least one structural element (header/table label) is correct

If fail: do not trust summary output yet.

---

## 3) OCR / Scan Detection

If quotes fail or are garbled, test for image-only PDF:
- Ask agent whether text layer appears selectable/extractable
- If likely scanned image, run OCR first or upload an OCR-processed version

Quick user signal: if copy/paste from PDF viewer fails, it is likely image-only.

---

## 4) Visibility & Context Mismatch Check

Confirm all three:
- You are in the same chat/session where file was uploaded
- You uploaded the latest version (not similarly named older file)
- The file is not login-gated/private URL the agent cannot access

If uncertain, re-upload with versioned name:
- `project-brief-v3.pdf`

---

## 5) Known-Good Recovery Flow

1. Re-upload PDF with version suffix (`-v2`, `-v3`)
2. Run quote-proof test again
3. Only then request summary/extraction
4. Require evidence in output:
   - “Cites page X/Y/Z”
   - “Includes 2 direct quotes”

---

## 6) Escalation Packet (if still failing)

Send support:
- exact filename + size
- exact prompt used
- quote-proof output (or READABILITY_FAIL text)
- whether PDF is scanned/image-based
- where run happened (dashboard, DM, server channel)
- timestamp + timezone

---

## Copy/Paste One-Shot Verification Prompt

```text
Do not summarize yet. First verify PDF readability.
Return: filename, file size, 3 exact quotes from different pages with page numbers, and one exact header/table label.
If any part fails, return READABILITY_FAIL with the precise blocker and the smallest next step to fix it.
```

ALL HAIL THE GLOW CLOUD.
