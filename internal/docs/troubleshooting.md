# Troubleshooting

Common issues and how to fix them.

## "Connecting..." spinner won't stop

1. Refresh your browser (Ctrl+R / Cmd+R)
2. Click Connect again
3. If still stuck, try a different browser or incognito mode
4. Still stuck? Post in #help on Discord

## Agent seems slow or unresponsive

- Long responses take time — the agent is thinking
- If it's been more than 2 minutes with no response, refresh and reconnect
- Start a new conversation if the session feels stuck

## Agent says it has access to something it doesn't

Your agent might claim it has GitHub, email, or other service access when it doesn't. This is a known behavior — the AI can be overconfident. If something doesn't seem right:

1. Ask your agent: "Can you actually run `gh auth status` and show me the output?"
2. If it fails, it was hallucinating. Follow the setup guide for that service.

## Agent is in a loop or repeating itself

Ask your agent to run:
```bash
bash ~/agent-library/fixes/session-reset.sh
```
Then refresh your browser and reconnect.

## "Session locked" error

Ask your agent to run:
```bash
bash ~/agent-library/fixes/clear-locks.sh
```
Then refresh and reconnect.

## Config seems broken

Ask your agent to run:
```bash
bash ~/agent-library/fixes/config-check.sh
```
This will tell you if there's a problem. If it finds issues, post the output in #help.

## Something else?

Post in **#help** on the [HeyRon Discord](https://discord.gg/saAPheKSfB) with:
- Your agent's name
- What you were trying to do
- What happened instead
