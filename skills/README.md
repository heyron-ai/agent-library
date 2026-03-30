# heyron® Skills Library

Ready-to-use skills for your AI agent. These skills are curated and tested for heyron® containers (headless Docker, no GUI required).

## How to Install a Skill

Tell your agent in chat:

> "Clone the agent library and install the [skill-name] skill"

Or if your agent already has the library:

> "Install the human-writing skill from ~/agent-library/skills/"

Your agent will copy the skill folder into its workspace and start using it automatically.

## Skills by Category

### ✍️ Writing & Content
| Skill | Description | Requires |
|-------|-------------|----------|
| [human-writing](human-writing/) | Write content that reads naturally human — no AI tells, no corporate fluff | Nothing |
| [summarize-pro](summarize-pro/) | Summarize articles, documents, meetings, emails, books — 20+ formats | Nothing |
| [social-media-scheduler](social-media-scheduler/) | Plan and draft social media content across all platforms | Nothing |
| [email-marketing](email-marketing/) | Email deliverability, sequences, segmentation, campaign optimization | Nothing |
| [seo-optimizer](seo-optimizer/) | SEO audits, meta tags, schema markup, optimization reports | Nothing |

### 📊 Business & Research
| Skill | Description | Requires |
|-------|-------------|----------|
| [market-research](market-research/) | Market sizing, competitor analysis, demand validation | Nothing |
| [real-estate-skill](real-estate-skill/) | Guide any property decision — buyers, sellers, investors, agents | Nothing |
| [data-analysis](data-analysis/) | Analyze data, build reports, find patterns, make recommendations | Nothing |
| [automation-workflows](automation-workflows/) | Design and implement no-code automation workflows | Nothing |

### 🌅 Daily Life
| Skill | Description | Requires |
|-------|-------------|----------|
| [morning-daily-briefing](morning-daily-briefing/) | Morning briefing with priorities, schedule, and key updates | Nothing |
| [journal-bot](journal-bot/) | Daily journaling with smart prompts, mood tracking, pattern detection | Nothing |

### 💰 Finance
| Skill | Description | Requires |
|-------|-------------|----------|
| [finance-lite](finance-lite/) | Daily macro + market brief with watchlist tracking | `FINNHUB_API_KEY` |

### 🔌 Integrations (Require API Keys)
| Skill | Description | Requires |
|-------|-------------|----------|
| [porteden-email](porteden-email/) | Full email management — Gmail, Outlook, Exchange | `PE_API_KEY` |
| [openclaw-github-assistant](openclaw-github-assistant/) | GitHub repos, issues, CI status, and more | `GITHUB_TOKEN` |
| [notion-cli](notion-cli/) | Create and manage Notion pages, databases, blocks | `NOTION_TOKEN` |

### 🛠️ Agent Improvement
| Skill | Description | Requires |
|-------|-------------|----------|
| [self-improvement](self-improvement/) | Agent self-learning and error tracking | Nothing |

### 📖 Setup Guides
| Skill | Description |
|-------|-------------|
| [github-setup](github-setup/) | How to set up GitHub integration |
| [telegram-setup](telegram-setup/) | How to set up Telegram |
| [web-search](web-search/) | How to use web search |

## Contributing

Found a great skill on [ClawHub](https://clawhub.ai) that works headless? Open a PR or suggest it in [The Den](https://discord.gg/Jx6bpttw7m).
