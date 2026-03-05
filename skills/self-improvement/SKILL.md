---
name: self-improvement
description: "Log learnings, errors, and feature requests for continuous improvement. Use when: (1) a command fails, (2) user corrects you, (3) user requests something you can't do, (4) you discover outdated knowledge, (5) you find a better approach to a recurring task."
---

# Self-Improvement Skill

Log mistakes, corrections, and discoveries to `.learnings/` files so you get smarter over time.

## Setup

```bash
mkdir -p ~/workspace/.learnings
```

## Quick Reference

| Situation | Action |
|-----------|--------|
| Command fails | Log to `.learnings/ERRORS.md` |
| User corrects you | Log to `.learnings/LEARNINGS.md` |
| User wants missing feature | Log to `.learnings/FEATURE_REQUESTS.md` |
| Found better approach | Log to `.learnings/LEARNINGS.md` |
| Knowledge was outdated | Log to `.learnings/LEARNINGS.md` |

## When to Promote

When a learning proves broadly useful, promote it to a permanent file:

| Learning Type | Promote To |
|---------------|------------|
| Behavioral patterns | `SOUL.md` |
| Workflow improvements | `AGENTS.md` |
| Tool gotchas | `TOOLS.md` |

## Logging Format

### Learning Entry

Append to `.learnings/LEARNINGS.md`:

```markdown
## [LRN-YYYYMMDD-001] category

**Logged**: 2026-03-05
**Priority**: low | medium | high | critical
**Status**: pending

### Summary
One-line description

### Details
What happened, what was wrong, what's correct

### Suggested Action
Specific fix or improvement
```

### Error Entry

Append to `.learnings/ERRORS.md`:

```markdown
## [ERR-YYYYMMDD-001] what_failed

**Logged**: 2026-03-05
**Priority**: high
**Status**: pending

### Summary
What failed

### Error
```
Actual error message
```

### Context
What you were trying to do

### Suggested Fix
How to prevent this next time
```

### Feature Request Entry

Append to `.learnings/FEATURE_REQUESTS.md`:

```markdown
## [FEAT-YYYYMMDD-001] capability_name

**Logged**: 2026-03-05
**Priority**: medium
**Status**: pending

### Requested Capability
What the user wanted

### Suggested Implementation
How this could work
```

## Detection Triggers

Log automatically when you notice:

- **Corrections**: "No, that's wrong...", "Actually...", "You're wrong about..."
- **Feature requests**: "Can you also...", "I wish you could...", "Is there a way to..."
- **Errors**: Non-zero exit codes, exceptions, unexpected output
- **Knowledge gaps**: User provides info you didn't know

## Resolving Entries

When fixed, update the entry:
- Change `**Status**: pending` → `**Status**: resolved`
- Add what was done to fix it

## Review

Check your learnings periodically:
```bash
# Count pending items
grep -c "Status.*pending" ~/workspace/.learnings/*.md

# Find high priority items
grep -B3 "Priority.*high" ~/workspace/.learnings/*.md
```

## Best Practices

1. **Log immediately** — context is freshest right after the issue
2. **Be specific** — future you needs to understand quickly
3. **Suggest concrete fixes** — not just "investigate"
4. **Promote aggressively** — if it's broadly useful, put it in SOUL.md/AGENTS.md/TOOLS.md
