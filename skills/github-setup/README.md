# GitHub Setup Guide

Connect your agent to GitHub so it can create repos, push code, and manage projects.

## Prerequisites
- A GitHub account (create one at https://github.com/signup if needed)

## Step 1: Create a Personal Access Token

1. Go to https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Name it something like "HeyRon Agent"
4. Select scopes: `repo` (full control of private repos)
5. Click "Generate token"
6. **Copy the token immediately** — you won't see it again

## Step 2: Give the Token to Your Agent

Tell your agent:
> "Here's my GitHub token: ghp_xxxxx — please set up GitHub CLI"

Your agent will run:
```bash
# Install GitHub CLI
apt-get update && apt-get install -y gh

# Authenticate
echo "YOUR_TOKEN" | gh auth login --with-token

# Verify it works
gh auth status
```

## Step 3: Configure Git Identity

Your agent should set up git identity:
```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

## What Your Agent Can Do With GitHub

- Create repositories: `gh repo create my-project --public`
- Clone repos: `git clone https://github.com/you/repo.git`
- Push code: `git add . && git commit -m "message" && git push`
- Create issues: `gh issue create --title "Bug" --body "Description"`
- Create pull requests: `gh pr create --title "Feature" --body "Details"`
- View CI status: `gh run list`

## Security Notes

- Your token is stored in your agent's container only
- Don't share your token publicly
- You can revoke it anytime at https://github.com/settings/tokens
- Consider using a fine-grained token with limited repo access for extra security
