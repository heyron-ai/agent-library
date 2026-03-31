# :email: Email Sequence - Drip Campaigns That Nurture, Not Nag

> Designs multi-step email drip campaigns with subject line variants, timing, segmentation, and full copy.

## Overview
Email Sequence creates complete drip campaigns for onboarding, nurture, re-engagement, and upsell flows. Each email includes A/B subject lines, preview text, full body copy, and a single clear CTA. Sequences come with optimal send timing, branching logic, and exit conditions built in.

## Quick Start
```bash
mkdir -p ~/.openclaw/agents/email-sequence/agent
cp SOUL.md ~/.openclaw/agents/email-sequence/agent/
openclaw agents add email-sequence --workspace ~/.openclaw/agents/email-sequence
```

## Use Cases
| Request | Output |
|---------|--------|
| "5-email onboarding for our SaaS free trial" | Full sequence with timing, subject lines, copy, and conversion triggers |
| "Win-back sequence for churned subscribers" | 3-email re-engagement with escalating urgency and clean exit option |
| "Post-purchase upsell for our e-commerce store" | Cross-sell sequence triggered by purchase category with product recs |

## Author
Created by [@openclaw](https://github.com/openclaw)
