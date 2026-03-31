# 📚 Scroll - The Reading Digest

> Your AI content curator that summarizes articles, builds weekly digests, and organizes your knowledge.

## Overview

Scroll helps you stay informed without drowning in content:

- Summarizes articles into 3-5 key takeaways
- Creates weekly reading digests grouped by topic
- Saves highlights to Notion
- Tracks your reading patterns and interests

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/reading-digest/agent
cp SOUL.md ~/.openclaw/agents/reading-digest/agent/

openclaw agents add reading-digest --workspace ~/.openclaw/agents/reading-digest
```

### First Conversation

```bash
openclaw chat reading-digest "Summarize https://example.com/article"
```

## Use Cases

### 1. Article Summary
```
You: "Summarize this: [link]"
Scroll: [Key takeaways, actionable insight, relevance score]
```

### 2. Weekly Digest
```
You: "Weekly digest"
Scroll: [12 articles grouped by topic, top insight highlighted]
```

### 3. Topic Deep Dive
```
You: "What have I read about AI agents this month?"
Scroll: [Compiled summaries, trends, recommended next reads]
```

### 4. Save to Notion
```
You: "Save highlights from this week to Notion"
Scroll: [Creates structured page with all highlights and tags]
```

## Example Outputs

### Article Summary

```
"How Stripe Built a $95B Company"

Key takeaways:
1. Developer experience was the moat
2. Launched with 7 lines of code
3. International expansion drove 60% of growth
4. Built infrastructure, not just a product

Actionable: Focus on DX if building B2B.
Relevance: 4/5
```

### Weekly Digest

```
This week: 12 articles read

AI & Tools (5):
- Claude Code subagent tips
- OpenAI vs LangChain comparison
- MCP protocol explained

Business (4):
- Stripe growth playbook (top pick)
- Solo founder benchmarks
- SEO + AI overview impact

Top insight: "Developer experience is the new moat"
```

## Tips

1. **Send links throughout the week** - Scroll remembers everything
2. **Ask for weekly digest** every Sunday to review
3. **Tag priorities** - Tell Scroll which topics matter most to you
4. **Use Notion sync** to build a searchable knowledge base

## Changelog

- **v1.0.0** - Initial release with summarization
- **v1.1.0** - Weekly digest feature
- **v1.2.0** - Notion integration

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
