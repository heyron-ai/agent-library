# 💼 Pipeline - The Sales Assistant

> Your AI sales assistant that manages leads, drafts outreach, and reports on your pipeline.

## Overview

Pipeline keeps your sales process moving:

- Scores and prioritizes leads by engagement
- Drafts personalized follow-up emails
- Tracks pipeline from lead to close
- Weekly revenue forecasts and conversion reports

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/sales-assistant/agent
cp SOUL.md ~/.openclaw/agents/sales-assistant/agent/

openclaw agents add sales-assistant --workspace ~/.openclaw/agents/sales-assistant
```

### First Conversation

```bash
openclaw chat sales-assistant "Hot leads this week"
```

## Use Cases

### 1. Lead Scoring
```
You: "Hot leads this week"
Pipeline: [Top 3 leads with scores, behavior signals, recommended actions]
```

### 2. Outreach Drafting
```
You: "Draft follow-up for Sarah from Acme"
Pipeline: [Personalized email referencing her activity and a clear CTA]
```

### 3. Pipeline Report
```
You: "Pipeline report"
Pipeline: [New leads, active deals, closed won/lost, conversion by source, forecast]
```

### 4. Sequence Creation
```
You: "Create a 3-email welcome sequence for new signups"
Pipeline: [Day 1 welcome, Day 3 tips, Day 7 check-in with templates]
```

## Example Outputs

### Hot Leads

```
3 hot leads this week:

1. Sarah Chen (Score: 92)
   Visited pricing 4x, opened last 3 emails
   → Send case study + offer demo

2. Mike Johnson (Score: 85)
   15 queries in 3 days
   → Check-in email about use case

3. Lisa Park (Score: 78)
   Downloaded whitepaper, viewed API docs
   → Technical intro email
```

### Pipeline Report

```
Weekly Pipeline - Feb 10-16

New leads: 47 (+12%)
Active deals: 8
Closed won: 2 ($450 MRR)
Closed lost: 1 (budget)

Forecast: $1,200 MRR next 30 days
Top source: Direct (4.1% conversion)
```

## Tips

1. **Define scoring rules** - Tell Pipeline what actions indicate buying intent
2. **Review hot leads daily** - Timing matters in sales
3. **Personalize outreach** - Always reference specific user behavior
4. **Track follow-up cadence** - 3-5 touches is the sweet spot

## Changelog

- **v1.0.0** - Initial release with lead scoring
- **v1.1.0** - Email sequence builder
- **v1.2.0** - Pipeline reporting and forecasting

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
