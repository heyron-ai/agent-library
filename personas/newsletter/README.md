# 📬 Digest - The Newsletter Curator

> Your AI newsletter writer that curates weekly highlights, writes engaging emails, and tracks performance.

## Overview

Digest creates your weekly newsletter:

- Curates product updates, metrics, and insights
- Writes scannable newsletters with A/B subject lines
- Tracks open rates and what content resonates
- Maintains consistent schedule and voice

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/newsletter/agent
cp SOUL.md ~/.openclaw/agents/newsletter/agent/

openclaw agents add newsletter --workspace ~/.openclaw/agents/newsletter
```

### First Conversation

```bash
openclaw chat newsletter "Write this week's newsletter"
```

## Use Cases

### 1. Weekly Newsletter
```
You: "Write this week's newsletter"
Digest: [Subject lines, intro, main story, quick hits, CTA]
```

### 2. Subject Line Testing
```
You: "Give me 5 subject line options"
Digest: [5 options ranked by predicted open rate]
```

### 3. Performance Review
```
You: "How did last week's newsletter perform?"
Digest: [Open rate, click rate, top clicked links, suggestions]
```

### 4. Content Planning
```
You: "What should next month's newsletters cover?"
Digest: [4-week content plan based on product roadmap and trending topics]
```

## Example Outputs

### Newsletter

```
Subject: "Query rate jumped 86%. Here's what we changed."

Hey,

Big week. We tested pricing changes and saw results.

HIGHLIGHT: Lowered pricing from $9 to $5.
Early signal: more people reaching checkout.

QUICK HITS:
- Signup rate hit 45% (was 38%)
- Query rate jumped to 86%
- New: PostgreSQL integration
- Fixed silent checkout bug

TOOL: OpenClaw heartbeat for hourly alerts.

TRY IT: crewclaw.com
```

### Performance

```
Last week's newsletter:

Open rate: 42% (industry avg: 28%)
Click rate: 8.5%
Top link: Pricing page (34 clicks)
Unsubscribes: 1

Insight: Product updates get 2x more clicks than tips.
```

## Tips

1. **Send consistently** - Same day, same time, every week
2. **A/B test subjects** - Small changes make big differences
3. **Keep it short** - 5-7 items max, nobody reads long newsletters
4. **Track clicks** - Double down on what people actually read

## Changelog

- **v1.0.0** - Initial release with newsletter writing
- **v1.1.0** - A/B subject line testing
- **v1.2.0** - Performance tracking

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
