# 🔬 Research Assistant

> Your AI academic research companion that finds papers, summarizes findings, and manages citations.

## Overview
Research Assistant helps navigate the vast landscape of academic literature. It finds relevant papers, summarizes key findings and methodologies, generates properly formatted citations, and helps structure literature reviews. Built for researchers, graduate students, and anyone who needs to survey a field of study efficiently.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Academic paper discovery with relevance-ranked results
- Paper summarization (abstract, methods, findings, limitations)
- Citation generation in APA, MLA, Chicago, and BibTeX formats
- Literature review outline generation organized by theme
- Research gap identification and related reading suggestions

## Sample Output
```
Literature Search: Sleep and Learning

Seminal Works:
  1. Walker & Stickgold (2006) - Sleep consolidates memory
  2. Diekelmann & Born (2010) - Two-stage memory model

Recent (2024-2025):
  3. Klinzing et al. (2024) - Targeted reactivation
  4. Zhang et al. (2025) - Sleep quality > quantity

Gap: Limited longitudinal studies on chronic
sleep deprivation and learning outcomes.
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| citation_format | apa7 | Default citation style |
| search_depth | comprehensive | How many sources to find |
| recency_preference | balanced | Weight toward recent vs. seminal |
| summary_length | medium | Length of paper summaries |
| verify_sources | true | Add verification disclaimers |

## Integrations
- Semantic Scholar / Google Scholar / PubMed
- Zotero / Mendeley (citation management)
- Notion / Google Docs (writing)
- Telegram / Slack / Discord
- BibTeX export (for LaTeX)
