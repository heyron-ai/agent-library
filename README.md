# heyron Agent Library

Everything your AI agent needs to be great. Tutorials, personas, skills, templates, and fix scripts — curated for heyron containers.

> **New here?** Ignore the folders if you want. Start with the tutorials site: **https://heyron-ai.github.io/agent-library/tutorials/**

## 📚 Tutorials (35+ guides)

**[Browse all tutorials →](https://heyron-ai.github.io/agent-library/tutorials/)**

The library now includes onboarding guides, troubleshooting docs, setup walkthroughs, and beginner-safe mental models. Some of the most important ones:

### Start Here
| Tutorial | Description | Time |
|----------|-------------|------|
| [What Your Agent Can Do](https://heyron-ai.github.io/agent-library/tutorials/what-your-agent-can-do.html) | Capabilities, limitations, and real examples | 4 min |
| [Your First SOUL.md](https://heyron-ai.github.io/agent-library/tutorials/your-first-soul-md.html) | Give your agent a personality | 5 min |
| [How Memory Works](https://heyron-ai.github.io/agent-library/tutorials/how-memory-works.html) | Why your agent forgets and how to fix it | 5 min |
| [Why Your Agent Gets Worse in Long Chats](https://heyron-ai.github.io/agent-library/tutorials/long-chats-and-lost-work.html) | Session length, lost work, and how to avoid it | 6 min |

### Setup & Models
| Tutorial | Description | Time |
|----------|-------------|------|
| [Connect to Discord](https://heyron-ai.github.io/agent-library/tutorials/connect-discord.html) | Full Discord setup walkthrough | 10 min |
| [Connect to Telegram](https://heyron-ai.github.io/agent-library/tutorials/connect-telegram.html) | Telegram setup in 5 minutes | 5 min |
| [API Keys & Models](https://heyron-ai.github.io/agent-library/tutorials/api-keys-and-models.html) | Choose your agent's brain | 5 min |
| [Get an OpenRouter Key for Free Models](https://heyron-ai.github.io/agent-library/tutorials/openrouter-free-models.html) | Use one key for 300+ models and experiment with free options | 6 min |

### Troubleshooting Highlights
| Tutorial | Description | Time |
|----------|-------------|------|
| [Why Your Agent Says “Approval Required”](https://heyron-ai.github.io/agent-library/tutorials/approval-required-explained.html) | Plain-English guide to approval prompts | 4 min |
| [Agent Feels Slow or Stuck?](https://heyron-ai.github.io/agent-library/tutorials/agent-feels-slow-or-stuck.html) | Fast diagnostic checklist for laggy or stuck behavior | 4 min |
| [Discord Slash Commands Missing?](https://heyron-ai.github.io/agent-library/tutorials/discord-slash-commands-missing.html) | Recover missing slash commands | 4 min |
| [Whambulance Couldn't Send You a DM?](https://heyron-ai.github.io/agent-library/tutorials/whambulance-couldnt-send-dm.html) | Fix the DM-blocked support flow and ticket reset loop | 4 min |

See the full tutorials index for everything else, including dashboard troubleshooting, reminders, MCP guides, Dropbox MCP, ElevenLabs voice setup, and more.

## 🎭 Agent Personas (52 ready-to-use SOUL.md files)

**[Browse all personas →](https://heyron-ai.github.io/agent-library/tutorials/personas.html)**

Pre-built personalities for every use case — personal, business, creative, marketing, real estate, education, and more. Copy, paste, go. Free forever.

Categories: Personal Life · Productivity · Creative · Marketing · Business · Finance · Real Estate · Education · Development · Freelance · Health & Wellness · Automation

See [personas/README.md](personas/README.md) for the full catalog.

## 🧩 Skills Library (19 skills)

**[Browse all skills →](https://heyron-ai.github.io/agent-library/tutorials/skills.html)**

Ready-to-use skills that work in heyron containers. See [skills/README.md](skills/README.md) for the full catalog.

**Install a skill:**
```
Tell your agent: "Clone the agent library and install the human-writing skill"
```

## 📄 Templates

Battle-tested workspace files to get started fast:

- **[AGENTS.md](templates/AGENTS.md)** — Operating manual for your agent
- **[SOUL.md](templates/SOUL.md)** — Personality template
- **[TOOLS.md](templates/TOOLS.md)** — Environment-specific notes
- **[HEARTBEAT.md](templates/HEARTBEAT.md)** — Proactive heartbeat checklist template
- **[COMMUNITY-SWEEP.md](templates/COMMUNITY-SWEEP.md)** — Community intelligence workflow template
- **[DISCORD-CONNECT-CHECKLIST.md](templates/DISCORD-CONNECT-CHECKLIST.md)** — Fast diagnostic checklist for Discord connection failures
- **[MEMORY-RECOVERY-PLAYBOOK.md](templates/MEMORY-RECOVERY-PLAYBOOK.md)** — Step-by-step playbook for diagnosing and fixing “my agent forgot” complaints
- **[CONTEXT-LIMIT-RESCUE.md](templates/CONTEXT-LIMIT-RESCUE.md)** — Quick triage and recovery workflow for `context limit exceeded` / oversized prompt failures
- **[APPROVAL-SAFETY-CHECKLIST.md](templates/APPROVAL-SAFETY-CHECKLIST.md)** — Rapid decision framework for handling “Approval Required” prompts safely
- **[SUPPORT-ESCALATION-PACKET.md](templates/SUPPORT-ESCALATION-PACKET.md)** — Structured intake + escalation format that reduces back-and-forth and speeds up triage
- **[MODEL-SWITCH-VERIFICATION.md](templates/MODEL-SWITCH-VERIFICATION.md)** — Step-by-step checklist to prove model switching is applied and isolate stale-session/config fallback issues
- **[MCP-CONNECTOR-RECOVERY.md](templates/MCP-CONNECTOR-RECOVERY.md)** — Fast recovery + isolation workflow for “connector installed but unavailable” MCP failures
- **[TIMEZONE-DRIFT-PLAYBOOK.md](templates/TIMEZONE-DRIFT-PLAYBOOK.md)** — Step-by-step verification and recovery workflow for wrong timezone/day outputs and misfiring reminders
- **[EXECUTION-EVIDENCE-CHECKLIST.md](templates/EXECUTION-EVIDENCE-CHECKLIST.md)** — Claim→evidence→verification workflow for “agent said done but nothing changed” trust-break incidents

## 🔧 Fix Scripts

Common fixes for known issues:

- `fixes/clear-locks.sh` — Clear stuck session locks
- `fixes/config-check.sh` — Validate your config
- `fixes/session-cap.sh` — Fix session capacity issues
- `fixes/session-reset.sh` — Reset a stuck session
- `fixes/telegram-setup.sh` — Telegram setup helper

## Quick Start

```bash
git clone https://github.com/heyron-ai/agent-library.git ~/agent-library
```

To update:
```bash
cd ~/agent-library && git pull
```

## Contributing

Found a great skill or have a tutorial idea? Drop it in [The Den](https://discord.gg/Jx6bpttw7m) or open a PR.

---

Made with 🌩️ by [The Glow Cloud](https://heyron-ai.github.io/agent-library/tutorials/) — heyron
