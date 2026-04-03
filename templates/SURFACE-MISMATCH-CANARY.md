# SURFACE-MISMATCH-CANARY.md

Use this when something works in one place (Dashboard or DM) but fails in another (server channel/thread).

Goal: prove whether this is a **surface/context routing issue** vs a real tool/runtime failure.

---

## 1) Define the exact two surfaces

Write this first (no guessing):

- **Working surface:** `<dashboard | discord dm | discord server #channel | thread link>`
- **Failing surface:** `<dashboard | discord dm | discord server #channel | thread link>`
- **Agent identity shown in each place:** `<name/id text>`
- **Timestamp + timezone:** `<YYYY-MM-DD HH:MM TZ>`

If agent identity or account differs, stop and fix that first.

---

## 2) Run a tiny canary in BOTH surfaces

Use the same prompt verbatim in each place:

```text
Run a canary task and return proof only:
1) Tell me current runtime/session context in one line.
2) Write file /tmp/canary-surface-test.txt with line: "surface=<SURFACE_NAME> time=<NOW>".
3) Read that exact file back and quote the line.
Return only: context line + quoted file line.
```

Expected:
- Both surfaces should complete.
- The quoted line should match the surface name used in that run.

If one surface fails, capture exact error text.

---

## 3) If DM works but server fails

Check these in order:

1. Channel/thread permissions (send/reply/read)
2. Integrations restrictions in that server/channel
3. Mention/group policy mismatch
4. Wrong guild/thread target in config
5. Stale runtime after config edit (restart + fresh test)

Then rerun the canary in the **same failing channel**.

---

## 4) If Dashboard works but Discord fails

Likely mismatch classes:

- Different conversation/session context
- Discord policy/permission restrictions
- Destination routing mismatch (wrong thread/channel)
- Stale or partial config application

Do a fresh, minimal test in a clean Discord channel/thread:

```text
@agent reply with exactly: DISCORD_CANARY_OK
```

If no response, capture exact channel and policy settings used.

---

## 5) Loop-break rule

If you run 3 retries with no new evidence:

- Stop changing multiple things at once.
- Change one variable only.
- Retest canary.
- Record result.

No evidence = no progress.

---

## 6) Escalation packet (copy/paste)

```text
Issue: Works in <surface A>, fails in <surface B>
When: <timestamp + timezone>
Agent identity shown: <text>
Working surface result: <exact canary output>
Failing surface result: <exact error or behavior>
Channel/thread link or name: <where failing>
Policy settings checked: <mention/group/integrations>
Permissions checked: <read/send/reply>
Restart performed: <yes/no + when>
What changed immediately before failure: <config/model/policy/reset>
```

---

## 7) Done criteria

You are done only when all are true:

- Canary passes in the failing surface
- Output appears in the expected destination
- You can repeat success twice in a row

If not repeatable, it is not fixed yet.
