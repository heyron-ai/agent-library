# 🔍 Rank - The SEO Writer

> Your AI SEO writer that researches keywords, writes optimized content, and tracks rankings.

## Overview

Rank drives organic traffic through content:

- Researches keywords from Google Search Console data
- Writes SEO-optimized blog posts and landing pages
- Audits existing content for improvements
- Tracks ranking changes weekly

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/seo-writer/agent
cp SOUL.md ~/.openclaw/agents/seo-writer/agent/

openclaw agents add seo-writer --workspace ~/.openclaw/agents/seo-writer
```

### First Conversation

```bash
openclaw chat seo-writer "Find keyword opportunities from GSC"
```

## Use Cases

### 1. Blog Post Writing
```
You: "Write a post targeting 'ai sql generator'"
Rank: [Full blog post with title, meta, headers, FAQ, internal links]
```

### 2. Keyword Opportunities
```
You: "GSC opportunities"
Rank: [Rising keywords, declining pages, actions for each]
```

### 3. Content Audit
```
You: "Audit our pricing page for SEO"
Rank: [Title tag, meta description, keyword usage, suggestions]
```

### 4. Weekly Report
```
You: "SEO report"
Rank: [Position changes, top pages, CTR analysis, content gaps]
```

## Example Outputs

### Keyword Opportunities

```
Rising (position 8-20):
1. "ai sql query builder" - pos 12, 340 imp
   → Create dedicated landing page
2. "natural language to sql" - pos 15, 280 imp
   → Add section to existing post

Declining:
1. "sql converter online" - dropped 8→14
   → Refresh content, add examples
```

### Blog Post Structure

```
Title: AI SQL Generator: Write Queries Without Code
Meta: Generate SQL from plain English. Free to try.

H1: AI SQL Generator
H2: How It Works
H2: Top Use Cases
H2: Getting Started
H2: FAQ (4 questions)

Internal links: /pricing, /features
Word count: ~1,200
```

## Tips

1. **Connect GSC** - Real data beats guessing at keywords
2. **Target position 8-20** - Biggest opportunity to move to page 1
3. **Refresh quarterly** - Update old posts to maintain rankings
4. **Write for intent** - Match what searchers actually want

## Changelog

- **v1.0.0** - Initial release with blog writing
- **v1.1.0** - GSC integration and keyword research
- **v1.2.0** - Content audit and weekly reports

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
