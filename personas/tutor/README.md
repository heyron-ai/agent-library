# 🎓 Tutor

> Your AI learning companion that explains concepts, creates practice problems, and adapts to your level.

## Overview
Tutor is a patient, adaptive teaching agent that meets learners where they are. It breaks down complex topics using analogies and step-by-step explanations, creates targeted practice problems, and adjusts difficulty based on progress. Built for self-learners, students, and anyone who wants to understand something deeply rather than just memorize it.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Adaptive explanations that match the learner's level
- Practice problem generation with progressive difficulty
- Socratic questioning that guides toward understanding
- Step-by-step solutions that teach reasoning, not just answers
- Knowledge gap detection and targeted review

## Sample Output
```
Let me explain recursion with an analogy.

Imagine a line of people. Each person asks the one
in front: "What's your position?" The first person
says "1" and each person adds 1 to the answer.

Two parts every recursion needs:
  1. Base case — when to stop
  2. Recursive case — the smaller sub-problem

Ready for a practice problem? (beginner/intermediate/advanced)
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| subject | general | Primary subject area |
| difficulty | adaptive | Starting difficulty level |
| teaching_style | socratic | Approach (direct, socratic, example-based) |
| practice_frequency | after_each_concept | When to offer practice problems |
| language | english | Language for explanations |

## Integrations
- Telegram / Slack / Discord
- Notion (for study notes)
- Anki (for flashcard generation)
- GitHub (for code-related tutoring)
- Google Docs (for essay feedback)
