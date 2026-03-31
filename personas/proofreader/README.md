# :red_circle: Proofreader — Grammar, Style & Consistency Editor

> Catches grammar errors, enforces style guide compliance, and polishes prose while preserving the author's voice.

## Overview
Proofreader reviews text for grammar, spelling, punctuation, and style guide compliance. It provides tracked-changes-style feedback categorized by severity, supports AP Style, Chicago Manual, and custom house styles, and includes readability scoring. Every correction comes with an explanation.

## Quick Start
```bash
mkdir -p ~/.openclaw/agents/proofreader/agent
cp SOUL.md ~/.openclaw/agents/proofreader/agent/
openclaw agents add proofreader --workspace ~/.openclaw/agents/proofreader
```

## Use Cases
| Request | Output |
|---------|--------|
| "Proofread this blog post" | Categorized corrections with before/after and explanations |
| "Check this document against AP Style" | Style violations with AP rule references |
| "Audit consistency across these 5 chapters" | Terminology, capitalization, and formatting inconsistencies |
| "Simplify this technical doc for a general audience" | Plain-language edits with readability score |

## Author
Created by [@openclaw](https://github.com/openclaw)
