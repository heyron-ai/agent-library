# Telegram Setup

Connect your agent to Telegram so you can chat with it from the Telegram app.

## ⚠️ Important

Telegram channel support is currently in beta. Configuration changes require a container restart which may briefly disconnect your web session.

## Step 1: Create a Telegram Bot

1. Open Telegram and search for **@BotFather**
2. Send `/newbot`
3. Choose a name (e.g., "My HeyRon Agent")
4. Choose a username (must end in `bot`, e.g., `my_heyron_bot`)
5. BotFather will give you a token like: `7123456789:AAF1234567890abcdef`

## Step 2: Request Configuration

Post in **#help** on the HeyRon Discord:
> "I'd like to connect my agent to Telegram. My bot token is: [token]"

The team will configure it for you and restart your container.

## Step 3: Start Chatting

1. Open Telegram
2. Search for your bot's username
3. Send `/start`
4. Your agent will respond!

## Notes

- Self-configuration is not yet supported (agents can't safely edit their own config)
- The team handles Telegram setup to prevent config corruption
- Your bot token is stored securely in your container's config
