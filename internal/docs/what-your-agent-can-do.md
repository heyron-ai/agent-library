# What Your Agent Can Do

Your agent runs in a full Linux container with real tools. Here's what's available.

## Built-In (No Setup Needed)

| Capability | Details |
|-----------|---------|
| **Chat** | Conversational AI — ask anything |
| **Code** | Write, run, debug code in Python, Node.js, bash, and more |
| **Files** | Create, edit, organize files in its workspace |
| **Web Search** | Search the internet via Brave Search |
| **Terminal** | Full bash shell with apt-get, npm, pip |
| **Multi-Agent** | Create specialized sub-agents for different tasks |
| **Memory** | Write notes to files that persist between sessions |

## Available With Setup

| Capability | What You Need | Guide |
|-----------|--------------|-------|
| **GitHub** | Personal access token | [Setup Guide](../skills/github-setup/README.md) |
| **Telegram** | Bot token from @BotFather | [Setup Guide](../skills/telegram-setup/README.md) |

## Coming Soon

- Discord bot integration
- Email access
- Calendar integration
- More skills in the agent library

## What Your Agent CANNOT Do

- Access services without credentials you provide
- Change its own system configuration
- Listen on network ports or run servers
- Access other users' containers
- Survive a container restart without saving to files (always ask it to save important work)

## Pro Tips

- **Ask your agent to clone this library**: `git clone https://github.com/heyron-ai/agent-library.git ~/agent-library`
- **Ask it to build you things**: websites, scripts, documents, data analysis
- **Give it context**: the more it knows about what you want, the better it performs
- **Use files for memory**: ask it to write important info to files so it remembers next session
