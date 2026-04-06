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
- **[BEST_PRACTICES.md](templates/BEST_PRACTICES.md)** — Source-of-truth file-organization rules (find-before-create, canonical paths, and completion proof) to prevent duplicate-file chaos
- **[HEARTBEAT.md](templates/HEARTBEAT.md)** — Proactive heartbeat checklist template
- **[COMMUNITY-SWEEP.md](templates/COMMUNITY-SWEEP.md)** — Community intelligence workflow template
- **[DISCORD-CONNECT-CHECKLIST.md](templates/DISCORD-CONNECT-CHECKLIST.md)** — Fast diagnostic checklist for Discord connection failures
- **[DISCORD-DEVELOPER-PORTAL-LOOP-BREAKER.md](templates/DISCORD-DEVELOPER-PORTAL-LOOP-BREAKER.md)** — Deterministic 5-minute recovery flow for “email verified but still can’t create Discord app” loops using account lock, incognito canary tests, and escalation-ready evidence
- **[MEMORY-RECOVERY-PLAYBOOK.md](templates/MEMORY-RECOVERY-PLAYBOOK.md)** — Step-by-step playbook for diagnosing and fixing “my agent forgot” complaints
- **[CONTEXT-LIMIT-RESCUE.md](templates/CONTEXT-LIMIT-RESCUE.md)** — Quick triage and recovery workflow for `context limit exceeded` / oversized prompt failures
- **[APPROVAL-SAFETY-CHECKLIST.md](templates/APPROVAL-SAFETY-CHECKLIST.md)** — Rapid decision framework for handling “Approval Required” prompts safely
- **[APPROVAL-WORKFLOW-RUNBOOK.md](templates/APPROVAL-WORKFLOW-RUNBOOK.md)** — Step-by-step playbook for running multi-step approval-gated tasks safely with exact-command approvals and evidence checks
- **[SECURITY-GUARDRAIL-ROLLBACK-PLAYBOOK.md](templates/SECURITY-GUARDRAIL-ROLLBACK-PLAYBOOK.md)** — Fast recovery workflow for agents that become over-restricted or unresponsive after aggressive security-rule prompts
- **[SUPPORT-ESCALATION-PACKET.md](templates/SUPPORT-ESCALATION-PACKET.md)** — Structured intake + escalation format that reduces back-and-forth and speeds up triage
- **[MODULE-2-NO-REPLY-CANARY.md](templates/MODULE-2-NO-REPLY-CANARY.md)** — A fast canary-first workflow for onboarding “agent error/no reply” loops that separates surface mismatch from runtime incidents and produces a clean escalation packet
- **[TICKET-REOPEN-EVIDENCE-PACKET.md](templates/TICKET-REOPEN-EVIDENCE-PACKET.md)** — One-shot reopen template for “marked resolved but still broken” cases with exact-error proof and minimal repro steps
- **[SUPPORT-ROUTING-QUICKMAP.md](templates/SUPPORT-ROUTING-QUICKMAP.md)** — Fast “where should I ask?” routing map for active support paths (support form vs hop-in-help vs follow-up channels), with a copy/paste evidence packet
- **[MODEL-SWITCH-VERIFICATION.md](templates/MODEL-SWITCH-VERIFICATION.md)** — Step-by-step checklist to prove model switching is applied and isolate stale-session/config fallback issues
- **[MODEL-SWITCH-500-RECOVERY.md](templates/MODEL-SWITCH-500-RECOVERY.md)** — Deterministic loop-break workflow for `Gateway tool invoke failed: 500` model-switch failures with canary tests, fresh-session proof, and escalation packet
- **[MCP-CONNECTOR-RECOVERY.md](templates/MCP-CONNECTOR-RECOVERY.md)** — Fast recovery + isolation workflow for “connector installed but unavailable” MCP failures
- **[GOOGLE-DRIVE-CONNECTOR-LOOP-BREAKER.md](templates/GOOGLE-DRIVE-CONNECTOR-LOOP-BREAKER.md)** — A 5-minute proof-first workflow for “connected but no files” Google Drive loops (account/scope/surface mismatch + canary test + escalation packet)
- **[GOOGLE-DRIVE-UPLOAD-LOOP-BREAKER.md](templates/GOOGLE-DRIVE-UPLOAD-LOOP-BREAKER.md)** — A deterministic step-down canary workflow for “Drive connected but upload fails,” isolating file-type/size/quota/path issues from auth/session mismatch
- **[GOOGLE-WORKSPACE-CONNECTOR-CANARY.md](templates/GOOGLE-WORKSPACE-CONNECTOR-CANARY.md)** — Unified 5-minute canary workflow for Drive/Gmail/Calendar "connected but not working" loops, with one-variable isolation and escalation-ready evidence
- **[GMAIL-SENDER-IDENTITY-LOCK.md](templates/GMAIL-SENDER-IDENTITY-LOCK.md)** — A proof-first canary workflow for “Gmail connected but sending from wrong account/alias” loops, with sender-identity verification and escalation-ready evidence
- **[CALENDAR-EVENT-UPDATE-PROOF-CHECKLIST.md](templates/CALENDAR-EVENT-UPDATE-PROOF-CHECKLIST.md)** — Proof-first workflow for “event updated but still old time/details” loops using event-ID locking, recurring-scope checks, timezone proof, and escalation-ready evidence
- **[TIMEZONE-DRIFT-PLAYBOOK.md](templates/TIMEZONE-DRIFT-PLAYBOOK.md)** — Step-by-step verification and recovery workflow for wrong timezone/day outputs and misfiring reminders
- **[EXECUTION-EVIDENCE-CHECKLIST.md](templates/EXECUTION-EVIDENCE-CHECKLIST.md)** — Claim→evidence→verification workflow for “agent said done but nothing changed” trust-break incidents
- **[FILE-PATH-PROOF-CHECKLIST.md](templates/FILE-PATH-PROOF-CHECKLIST.md)** — Deterministic path-proof workflow for “agent says files exist but I can’t find them” incidents
- **[PDF-ANALYSIS-PROOF-CHECKLIST.md](templates/PDF-ANALYSIS-PROOF-CHECKLIST.md)** — Proof-first workflow for “agent summarized my PDF wrong” incidents (filename/path proof, quote-proof test, OCR checks, and escalation packet)
- **[EXECUTION-LAYER-OUTAGE-PLAYBOOK.md](templates/EXECUTION-LAYER-OUTAGE-PLAYBOOK.md)** — Fast isolation + recovery workflow for “chat still works but tools/commands hang or timeout” execution-plane failures
- **[CONTEXT-HANDOFF-CHECKLIST.md](templates/CONTEXT-HANDOFF-CHECKLIST.md)** — Practical handoff + verification workflow for dashboard/DM/server context-switch confusion (“it forgot everything” across surfaces)
- **[DISCORD-CHANNEL-SILENCE-PLAYBOOK.md](templates/DISCORD-CHANNEL-SILENCE-PLAYBOOK.md)** — Fast isolation and recovery workflow for “DM works but server channel is silent” and “typing then nothing” Discord failures
- **[DISCORD-LONG-OUTPUT-GUARDRAILS.md](templates/DISCORD-LONG-OUTPUT-GUARDRAILS.md)** — Output-size guardrails for Discord to prevent cut-off/silent long replies using chunk labels, per-message limits, and file fallback
- **[LINK-ACCESS-TRIAGE.md](templates/LINK-ACCESS-TRIAGE.md)** — Fast diagnosis + recovery flow for “this link opens for me but my agent can’t access it” visibility/auth mismatches
- **[ANTI-BOT-CHECKPOINT-HANDOFF.md](templates/ANTI-BOT-CHECKPOINT-HANDOFF.md)** — Human-checkpoint handoff workflow for reCAPTCHA/Cloudflare/login verification blockers, including loop-break rules and resume packet
- **[LONG-CHAT-RECOVERY-WORKFLOW.md](templates/LONG-CHAT-RECOVERY-WORKFLOW.md)** — Deterministic reset + rehydration workflow for “agent got worse over long chat” degradation and lost-work prevention
- **[SOUL-CHANGE-VERIFICATION.md](templates/SOUL-CHANGE-VERIFICATION.md)** — Deterministic verification flow for “I updated SOUL.md but behavior didn’t change” (file/path proof, fresh-session test, and escalation packet)
- **[BACKGROUND-TASK-DELIVERY-CHECKLIST.md](templates/BACKGROUND-TASK-DELIVERY-CHECKLIST.md)** — Fast diagnosis workflow for “task ran but I can’t find the output,” focused on schedule/timezone + destination routing mismatches
- **[MODEL-LOCK-PLAYBOOK.md](templates/MODEL-LOCK-PLAYBOOK.md)** — Deterministic workflow to pin a model, verify runtime model-id proof, and isolate fallback/session-drift causes when outputs suddenly change
- **[INVALID-MODEL-ID-NO-REPLY-RECOVERY.md](templates/INVALID-MODEL-ID-NO-REPLY-RECOVERY.md)** — A 5-minute loop-break template for startup failures like `400 ... is not a valid model ID`, with fresh-session canary checks and escalation-ready evidence
- **[BILLING-AND-QUOTA-TRIAGE.md](templates/BILLING-AND-QUOTA-TRIAGE.md)** — Fast triage workflow to separate cancellation/refund requests from provider key/quota/model failures, with a support-ready escalation packet
- **[SUB-AGENT-ORCHESTRATION-CHECKLIST.md](templates/SUB-AGENT-ORCHESTRATION-CHECKLIST.md)** — Manager+workers playbook to prevent duplicate outputs, destination mismatch, and merge-quality loss in multi-agent workflows
- **[PRIVACY-INCIDENT-RESPONSE.md](templates/PRIVACY-INCIDENT-RESPONSE.md)** — Rapid contain→patch→verify workflow for accidental private-data leaks in shared/group chats
- **[CHANGE-SCOPE-LOCK-CHECKLIST.md](templates/CHANGE-SCOPE-LOCK-CHECKLIST.md)** — A strict scope+plan+diff workflow for preventing over-editing when you only want small targeted changes
- **[REPEATED-QUESTION-LOOP-BREAKER.md](templates/REPEATED-QUESTION-LOOP-BREAKER.md)** — A fast anti-loop override that forces one-shot missing-field collection and evidence-first execution
- **[GROUP-CHAT-REPLY-GUARDRAILS.md](templates/GROUP-CHAT-REPLY-GUARDRAILS.md)** — A strict response-gating template to stop over-chatty behavior in shared channels and keep group participation human-like
- **[LANGUAGE-LOCK-PLAYBOOK.md](templates/LANGUAGE-LOCK-PLAYBOOK.md)** — A deterministic recovery workflow for wrong-language/mixed-language replies with hard language lock, canary test, and escalation packet
- **[TOOL-CAPABILITY-REALITY-CHECK.md](templates/TOOL-CAPABILITY-REALITY-CHECK.md)** — A deterministic capability check to separate what your agent can automate now vs where human handoff is required
- **[SURFACE-MISMATCH-CANARY.md](templates/SURFACE-MISMATCH-CANARY.md)** — A tiny proof-first workflow for “works in DM/dashboard but fails in server channel/thread” routing and policy mismatch incidents
- **[RUNTIME-RESTART-VERIFICATION.md](templates/RUNTIME-RESTART-VERIFICATION.md)** — A proof-first workflow to verify whether a restart actually applied and isolate stale-session/host mismatch loops
- **[STALE-STATE-LOOP-BREAKER.md](templates/STALE-STATE-LOOP-BREAKER.md)** — A deterministic 5-minute workflow for “I fixed it but still see the same error” loops, using exact error fingerprints, fresh-context canaries, and escalation-ready proof
- **[GITHUB-VS-WORKSPACE-DIFF-CHECKLIST.md](templates/GITHUB-VS-WORKSPACE-DIFF-CHECKLIST.md)** — A deterministic checklist to diagnose and fix file mismatch confusion between live workspace files and GitHub repo history (branch/path/context-proof first)
- **[AGENTS-DRIFT-PREVENTION.md](templates/AGENTS-DRIFT-PREVENTION.md)** — A deterministic playbook to detect, recover, and prevent unexpected AGENTS.md behavior drift from merges, sync conflicts, and parallel edits
- **[PERSONAL-DASHBOARD-STARTER-KIT.md](templates/PERSONAL-DASHBOARD-STARTER-KIT.md)** — A user-facing build brief for making a clean dashboard with your agent, step by step
- **[HEARTBEAT-CRON-DECISION-WORKFLOW.md](templates/HEARTBEAT-CRON-DECISION-WORKFLOW.md)** — A fast decision and verification playbook for choosing heartbeat vs cron, proving timezone/destination, and breaking scheduler confusion loops
- **[AUTOMATION-HANDOFF-DECISION.md](templates/AUTOMATION-HANDOFF-DECISION.md)** — A canary-first workflow to decide what your agent can automate now vs what needs explicit human handoff, before burning time/tokens
- **[API-FIRST-AUTOMATION-CANARY.md](templates/API-FIRST-AUTOMATION-CANARY.md)** — A 5-minute canary checklist to validate external-platform automation before long prompts, with proof-first output and clean handoff fallback
- **[BROWSER-AUTOMATION-CANARY.md](templates/BROWSER-AUTOMATION-CANARY.md)** — A deterministic canary workflow for "installed Chromium but still can’t click" loops, with proof-first browser-action checks and clean handoff fallback when blocked
- **[REMOTE-GATEWAY-STABILITY-CHECKLIST.md](templates/REMOTE-GATEWAY-STABILITY-CHECKLIST.md)** — A deterministic one-lane workflow to stabilize remote gateway access (endpoint drift, origin mismatch, stale profile token loops) before running production tasks
- **[CLIENT-DATA-REDACTION-CHECKLIST.md](templates/CLIENT-DATA-REDACTION-CHECKLIST.md)** — A redaction-first workflow for safely using client/customer context without exposing sensitive identifiers, credentials, or account data
- **[RUNTIME-500-502-INCIDENT-TRIAGE.md](templates/RUNTIME-500-502-INCIDENT-TRIAGE.md)** — A 5-minute incident triage checklist to separate local/session issues from probable runtime/platform failures when errors like `health 502` and `Gateway tool invoke failed: 500` appear

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
