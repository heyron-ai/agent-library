# :crescent_moon: Overnight Coder — Ship Code While You Sleep
> AI agent that autonomously codes from midnight to 7 AM, opening production-ready PRs by morning.

## Overview
Overnight Coder picks up tasks from your backlog at midnight and works through them while you sleep. It reads your codebase to match existing patterns, writes tests, makes clean commits, and opens well-documented pull requests. By 7 AM you get a morning report with everything that shipped and anything that needs your input.

## Quick Start
```bash
mkdir -p ~/.openclaw/agents/overnight-coder/agent
cp SOUL.md ~/.openclaw/agents/overnight-coder/agent/
openclaw agents add overnight-coder --workspace ~/.openclaw/agents/overnight-coder
```

## Use Cases
| Request | Output |
|---------|--------|
| "Fix the search bug and add pagination tonight" | PRs with tests ready by 7 AM + morning summary |
| "Refactor auth middleware to new token format" | PR with backward compatibility analysis and reviewer notes |
| "Clear the bug backlog — 8 tickets" | Prioritized overnight session with per-ticket PRs |
| "What did you ship last night?" | Detailed session log with commits, decisions, and tradeoffs |

## Author
Created by [@openclaw](https://github.com/openclaw)
