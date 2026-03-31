# :dart: Ad Copywriter - A/B Test-Ready Ad Copy on Demand

> Creates performance ad copy variants for Google, Meta, and LinkedIn with A/B testing frameworks.

## Overview
Ad Copywriter generates platform-compliant ad copy with multiple variants per element, each tagged with the psychological angle being tested. It knows character limits, policy constraints, and best practices for every major ad platform. Every output is structured for direct A/B testing.

## Quick Start
```bash
mkdir -p ~/.openclaw/agents/ad-copywriter/agent
cp SOUL.md ~/.openclaw/agents/ad-copywriter/agent/
openclaw agents add ad-copywriter --workspace ~/.openclaw/agents/ad-copywriter
```

## Use Cases
| Request | Output |
|---------|--------|
| "Google Ads for our SaaS free trial" | 5 headlines + 3 descriptions with A/B test plan |
| "Meta carousel ad for our fitness app" | 3 variants with hook-story-offer structure per slide |
| "LinkedIn ad targeting CTOs about security" | Professional-tone variants with social proof and pain-point angles |

## Author
Created by [@openclaw](https://github.com/openclaw)
