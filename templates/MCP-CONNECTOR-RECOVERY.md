# MCP-CONNECTOR-RECOVERY.md

Use this when users say:
- "I installed the connector but it still says unavailable"
- "It worked yesterday and now it doesn't"
- "Dropbox/Drive/Notion says connected, but my agent can't use it"

---

## 1) Fast Triage (2 minutes)

Capture:
- Connector name(s):
- Exact error text:
- Where it fails (chat, specific workflow, all prompts):
- First seen time + timezone:
- Did it ever work before? (yes/no)

If error is vague, ask for a screenshot or exact copy/paste.

---

## 2) Known-Good Recovery Sequence

Run these in order (don’t skip):

1. **Verify connector status in app UI**
   - Confirm it shows connected/authorized.
2. **Re-open auth flow**
   - Re-authenticate the connector account once.
3. **Start a fresh chat/session**
   - Avoid stale context from older threads.
4. **Run a read-only smoke test**
   - Example: “List my top-level folders/files only. Do not modify anything.”
5. **Retry the original task**
   - If smoke test passes but task fails, issue is likely task-specific permissions/scope.

---

## 3) Isolation Matrix

- **Fails in old session, works in new session** → stale session/context issue.
- **Fails for one connector, others work** → connector-specific auth/scope issue.
- **Fails for all connectors** → platform/session/runtime issue.
- **Read works, write fails** → permission scope too narrow (reauth with broader access).

---

## 4) High-Friction Mistakes

- Connected the account but never completed OAuth confirmation.
- Multiple accounts; wrong account is authorized.
- Assuming install = active runtime authorization.
- Retesting only in the same stale chat thread.
- Testing with write actions first (start read-only to isolate safely).

---

## 5) Minimal User Prompt (Copy/Paste)

```text
Use only the [CONNECTOR_NAME] connector.
First, run a read-only check: list top-level items.
Then explain exactly whether read access works.
Do not write, rename, or delete anything.
```

---

## 6) Escalation Packet (if still broken)

```text
Connector: <name>
Expected behavior: <what should happen>
Actual behavior: <exact error/result>
First seen: <timestamp + timezone>
Repro steps: <numbered>
Retested in fresh session: <yes/no>
Read-only smoke test result: <pass/fail + output>
Account scope/permissions confirmed: <yes/no>
Screenshots/log snippets: <attached>
```

---

## 7) Agent Policy Add-on (optional)

```text
When connector tasks fail, always run a read-only smoke test first, in a fresh session, before retrying the original write task.
```

This avoids unsafe retries and quickly separates auth vs session vs permissions issues.
