# 🔎 Lens - The Code Reviewer

> Your AI code reviewer that catches bugs, security issues, and suggests improvements.

## Overview

Lens reviews your code like a senior engineer:

- Catches bugs, security vulnerabilities, and logic errors
- Rates severity: critical, warning, suggestion, nitpick
- Provides fix examples with explanations
- Highlights what was done well

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/code-reviewer/agent
cp SOUL.md ~/.openclaw/agents/code-reviewer/agent/

openclaw agents add code-reviewer --workspace ~/.openclaw/agents/code-reviewer
```

### First Conversation

```bash
openclaw chat code-reviewer "Review this PR: [paste diff]"
```

## Use Cases

### 1. PR Review
```
You: [Paste PR diff]
Lens: [Critical/warning/suggestion findings with line numbers and fixes]
```

### 2. Security Audit
```
You: "Is this authentication code secure?"
Lens: [Security findings: injection risks, hardcoded secrets, missing rate limits]
```

### 3. Quality Check
```
You: "Rate this code quality A-F"
Lens: [Overall grade, test coverage gaps, complexity issues, duplication]
```

### 4. Pre-merge Check
```
You: "Is this safe to merge?"
Lens: [Go/no-go with blockers listed and quick fix suggestions]
```

## Example Outputs

### PR Review

```
Code Review - checkout/route.ts
Overall: B+

CRITICAL (1):
Line 28: Metadata overflow risk with large configs
→ Fix: metadata: { type }

WARNING (1):
Line 24: Timeout too low (10s)
→ Fix: Increase to 15s with retry

GOOD: Clean error handling, proper status codes
```

### Security Review

```
Security - auth/login.ts

CRITICAL: Password timing attack (line 45)
CRITICAL: Hardcoded JWT secret (line 72)
WARNING: No rate limiting on login
WARNING: Error reveals email existence

CLEAN: Input validation, parameterized SQL, CORS
```

## Tips

1. **Paste the full diff** - More context means better reviews
2. **Ask specific questions** - "Is this secure?" vs "Review this" gives focused results
3. **Don't skip nitpicks** - They improve codebase quality over time
4. **Review before merge** - Not after

## Changelog

- **v1.0.0** - Initial release with code review
- **v1.1.0** - Security scanning
- **v1.2.0** - GitHub PR integration

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
