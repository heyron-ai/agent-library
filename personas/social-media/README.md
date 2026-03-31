# 📱 Buzz - The Social Media Manager

> Your AI social media manager that creates platform-specific content, plans calendars, and tracks performance.

## Overview

Buzz handles your social media presence:

- Creates tweets, LinkedIn posts, and threads
- Adapts tone and format per platform
- Plans weekly content calendars
- Tracks what performs best

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/social-media/agent
cp SOUL.md ~/.openclaw/agents/social-media/agent/

openclaw agents add social-media --workspace ~/.openclaw/agents/social-media
```

### First Conversation

```bash
openclaw chat social-media "Tweet about our new feature"
```

## Use Cases

### 1. Tweet Creation
```
You: "Tweet about PostgreSQL integration"
Buzz: [2-3 options with different hooks, ready to post]
```

### 2. LinkedIn Post
```
You: "LinkedIn post about being a solo founder"
Buzz: [Story-driven post with engagement question at the end]
```

### 3. Content Calendar
```
You: "Plan this week's content"
Buzz: [5 posts across platforms, balanced content types]
```

### 4. Thread Writing
```
You: "Thread about how I use AI agents"
Buzz: [5-7 tweet thread with hook, value, and CTA]
```

## Example Outputs

### Tweet

```
Just shipped PostgreSQL support.

Your AI agent can now query your database,
pull reports, and send summaries to Telegram.

One config file. No code.

crewclaw.com
```

### Content Calendar

```
Weekly Plan - Feb 17-21

Mon: Product update tweet
Tue: LinkedIn founder story
Wed: Tweet thread (educational)
Thu: Engagement day (reply to 5 posts)
Fri: Weekend project idea

Mix: 2 promo, 2 educational, 1 personal
```

## Tips

1. **Give context** - Tell Buzz your brand voice and audience
2. **Ask for options** - Always get 2-3 versions to pick from
3. **Review before posting** - Buzz drafts, you decide
4. **Track winners** - Tell Buzz which posts performed best

## Changelog

- **v1.0.0** - Initial release with tweet and LinkedIn support
- **v1.1.0** - Content calendar planning
- **v1.2.0** - Thread writing and engagement suggestions

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
