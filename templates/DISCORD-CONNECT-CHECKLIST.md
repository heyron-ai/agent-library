# DISCORD-CONNECT-CHECKLIST.md

Use this checklist when your Heyron agent won't respond on Discord.

---

## 1) Required Discord bot settings

In Discord Developer Portal (`Applications → Your App → Bot`):

- [ ] **Message Content Intent** is ON
- [ ] **Server Members Intent** is ON (recommended)
- [ ] Clicked **Save Changes** after toggling

---

## 2) Required OAuth2 scopes + permissions

In `OAuth2 → URL Generator`:

### Scopes
- [ ] `bot`
- [ ] `applications.commands`

### Bot permissions
- [ ] View Channels
- [ ] Send Messages
- [ ] Read Message History
- [ ] Embed Links
- [ ] Attach Files
- [ ] Add Reactions

---

## 3) Pairing prerequisites

- [ ] I copied my **Bot Token**
- [ ] I copied my **Server ID**
- [ ] I copied my **User ID**
- [ ] I enabled **Direct Messages** for the server (server privacy settings)

---

## 4) Connect command (paste in Heyron dashboard)

```text
Set up Discord for me. Here are my details:
Bot Token: [paste token]
Server ID: [paste server id]
User ID: [paste user id]
```

Then DM your bot in Discord, copy pairing code, and approve in dashboard:

```text
Approve this Discord pairing code: [paste code]
```

---

## 5) If bot is online but still not replying

Run these checks in order:

- [ ] In the test channel, bot role has View/Send/Read History at **channel level**
- [ ] Bot is not blocked by `Server Settings → Integrations` command restrictions
- [ ] Tested in a brand-new channel with no custom overrides
- [ ] Asked agent in dashboard: `Restart the gateway`

If DMs fail with "I couldn't send you a DM":
- [ ] Enable "Allow direct messages from server members" and retry

---

## 6) Known-good test flow

1. DM bot: `hello`
2. Receive pairing code
3. Approve code in dashboard
4. In a server channel, send: `@YourBotName reply with "connected"`
5. Confirm response in under 30 seconds

---

## 7) Escalate to #help with this exact format

```text
Discord setup issue
Signup email: [your email]
Server ID: [id]
What works: [DM only / channel only / neither]
What I already checked: [paste checklist items]
Error text/screenshots: [paste]
```

This gives support everything needed to fix fast.