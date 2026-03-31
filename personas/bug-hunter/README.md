# 🐛 Trace - The Bug Hunter

> Your AI debugger that analyzes errors, finds root causes, and suggests fixes.

## Overview

Trace helps you squash bugs faster:

- Analyzes stack traces and error logs
- Identifies root causes with evidence
- Suggests fixes and reproduction steps
- Tracks bug patterns across your codebase

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/bug-hunter/agent
cp SOUL.md ~/.openclaw/agents/bug-hunter/agent/

openclaw agents add bug-hunter --workspace ~/.openclaw/agents/bug-hunter
```

### First Conversation

```bash
openclaw chat bug-hunter "Got this error: [paste error]"
```

## Use Cases

### 1. Error Analysis
```
You: "TypeError: Cannot read properties of undefined (reading 'url')"
Trace: [3 ranked causes with probabilities, debugging steps, fix]
```

### 2. Production Crash
```
You: "Works locally, crashes in production"
Trace: [Environment diff analysis, common causes, debugging steps]
```

### 3. Bug Report
```
You: "Users report checkout sometimes fails"
Trace: [Structured bug report with reproduction steps and severity]
```

### 4. Regression Check
```
You: "Did last deploy break anything?"
Trace: [Analyzes recent changes against known failure patterns]
```

## Example Outputs

### Error Analysis

```
TypeError: Cannot read 'url' of undefined

Likely causes:
1. API response missing data (70%)
2. JSON parse returned error object (20%)
3. Network timeout (10%)

Debug: console.log(data) before url check
Fix: Handle data.error case explicitly
```

### Environment Diff

```
Local vs Production:

1. Missing env vars? → vercel env ls
2. Node version mismatch? → check engines
3. Build mode difference? → npm run build locally
4. DB connectivity? → check SSL requirement

Start with: vercel logs --follow
```

## Tips

1. **Paste the full error** - Stack traces have valuable info
2. **Include context** - What was the user doing? What changed recently?
3. **Check recent deploys** - Most bugs come from recent changes
4. **Test the fix** - Trace suggests, you verify

## Changelog

- **v1.0.0** - Initial release with error analysis
- **v1.1.0** - Environment diff analysis
- **v1.2.0** - Bug report generation and pattern tracking

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
