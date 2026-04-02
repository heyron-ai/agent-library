# DEN-COMMAND-CENTER-AIRTABLE-BRIEF.md

Use this as a build brief for Claude, ChatGPT, or any operator designing an Airtable-powered Den Command Center.

---

## Mission

Build an Airtable system called **Den Command Center** for Heyron.

This is not just a spreadsheet. It is the operating system for:

- community management
- support / triage awareness
- feature requests
- recurring pain points
- project / showcase tracking
- tutorials and content pipeline
- founder follow-up
- social media planning
- launches and calendar visibility
- light CRM / sales opportunity tracking

The final result should feel like:

**existing triage system + community intelligence + content engine + founder command center**

---

## Critical rule

There is already an existing **Tech Ticket / Triage** system.

**Do not replace it. Do not break it. Do not redesign it from scratch.**

Instead:
- preserve current ticket tables, statuses, IDs, and automations
- build the community/marketing/founder layer *around* triage
- connect tickets to the rest of the operating system with linked records

---

## Business goals

Optimize for:

- smoother onboarding for non-technical users
- lower support burden
- faster detection of repeating problems
- faster conversion of user pain into docs/tutorials/content
- better visibility into notable users, helpers, and projects
- easier follow-up for Robby and the team
- better social/content planning tied to actual community signals

---

## Design principles

- Make it usable by humans every day
- Favor clarity over cleverness
- Prefer linked records over duplicate text
- Every important record should have:
  - **Owner**
  - **Status**
  - **Priority**
  - **Next Step**
  - **Source URL**
  - **Last Updated**
- Support both manual entry and automation/webhooks
- Keep the system operational, not decorative

---

## Recommended table structure

### 1. People
Track members, helpers, leads, champions, power users, and at-risk users.

Fields:
- Name
- Preferred Name
- Discord Username
- Discord User ID
- Other Handles
- Segment / Role
- Join Date
- Status
- Interests / Use Cases
- Tags
- Linked Account / Team
- Last Meaningful Interaction
- Sentiment
- Notes
- Source URL
- Owner

### 2. Accounts / Teams
Track companies, creator brands, agencies, teams, or projects.

Fields:
- Account Name
- Type
- Primary Contact
- Linked People
- Industry
- Team Size
- Use Case
- Status
- Revenue Potential
- Expansion Potential
- Notes
- Owner

### 3. Touchpoints
Track meaningful interactions outside raw ticket history.

Fields:
- Date
- Person
- Account
- Channel / Surface
- Interaction Type
- Summary
- Outcome
- Next Step
- Related Ticket
- Source Message URL
- Owner

### 4. Ideas & Feature Requests
Track user ideas, asks, and repeated requests.

Fields:
- Title
- Description
- Source Person
- Source Account
- Source Channel
- Source Message URL
- Category
- Pain Point
- Frequency / Repeat Count
- Linked Tickets
- Priority
- Status
- Owner
- Related Content Opportunity

### 5. Support Pain Points
Track repeating patterns, not one-off complaints.

Fields:
- Pain Point Name
- Description
- Example Quote
- Source Ticket(s)
- Source Message URL
- Frequency
- Severity
- Affected Segment
- Related Tutorial
- Related Feature Request
- Status
- Owner

### 6. Community Projects
Track work-in-progress builds, showcases, launches, and things worth featuring.

Fields:
- Project Name
- Builder
- Linked Account
- Stage
- Description
- Category
- Source Channel
- Source Message URL
- Related Links
- Worth Featuring?
- Feature Status
- Notes
- Owner

### 7. Content Pipeline
Track tutorials, videos, templates, skills, digests, and posts.

Fields:
- Title
- Content Type
- Audience
- Problem Solved
- Related Pain Point
- Related Feature Request
- Related Project
- Funnel Stage
- Status
- Publish URL
- Publish Date
- Owner
- Performance Notes
- Ticket Reduction Potential

### 8. Social Media / Founder Content
Track Robby's social output and public-facing communication.

Fields:
- Post / Asset Name
- Platform
- Content Type
- Goal
- Topic
- Draft Status
- Publish Date
- CTA
- Related Tutorial / Feature / Launch / Project
- Asset Link
- Performance
- Owner

### 9. Calendar / Important Dates
Track launches, videos, campaigns, meetings, events, and follow-ups.

Fields:
- Title
- Date
- Time
- Category
- Related Person
- Related Account
- Related Content
- Related Campaign
- Owner
- Notes

### 10. Tasks / Follow-Ups
Unified action layer across support, community, sales, and content.

Fields:
- Task
- Type
- Related Person
- Related Account
- Related Ticket
- Related Idea
- Related Content
- Related Project
- Related Campaign
- Priority
- Due Date
- Status
- Owner

### 11. Inbox / Intake
Raw intake for manual notes, webhooks, bots, and agent-captured signals before routing.

Fields:
- Intake Type
- Raw Content
- Source
- Source URL
- Suggested Tags
- Suggested Destination
- Processed?
- Owner
- Created At

---

## Integration rules

The existing ticket/triage system should be linkable to:

- People
- Accounts
- Pain Points
- Feature Requests
- Tasks / Follow-Ups
- Content Opportunities

Community and content systems should be linkable back to:

- specific users
- specific tickets
- specific ideas
- specific projects
- original Discord messages

---

## Discord / community assumptions

Assume Discord is a primary source of truth.

Useful data to capture:
- message URL
- channel name / channel ID
- thread URL
- author username
- author Discord ID
- timestamp
- tags / classification
- whether the message is:
  - support issue
  - feature request
  - idea
  - complaint
  - showcase-worthy project
  - helper behavior
  - churn risk signal

---

## Suggested event / webhook types

The system should support normalized events such as:

- `ticket.created`
- `ticket.updated`
- `ticket.closed`
- `ticket.reopened`
- `community.message.flagged`
- `community.member.notable`
- `community.helper.spotted`
- `community.project.spotted`
- `feedback.idea.captured`
- `feedback.painpoint.detected`
- `content.tutorial.published`
- `content.digest.published`
- `social.post.scheduled`
- `calendar.event.created`
- `followup.task.created`

---

## Example webhook payloads

### Discord message flagged
```json
{
  "event": "community.message.flagged",
  "timestamp": "2026-04-01T01:45:00Z",
  "source": "discord",
  "channel_name": "ideas-and-feedback",
  "message_url": "https://discord.com/channels/.../.../...",
  "author": {
    "discord_user_id": "528063265411170314",
    "username": "cassieleexoxo",
    "display_name": "Cassie"
  },
  "content": "Is there any code, descriptions or webhooks, discord connection things you can give me?",
  "classification": {
    "type": "idea",
    "priority": "medium",
    "needs_followup": true
  }
}
```

### Repeating pain point detected
```json
{
  "event": "feedback.painpoint.detected",
  "timestamp": "2026-04-01T01:50:00Z",
  "pain_point": {
    "name": "Agent loses context in long chats",
    "category": "onboarding",
    "severity": "high",
    "frequency": 9,
    "example_quotes": [
      "I worked for hours and then my agent got stupid",
      "All our work went down the drain"
    ]
  },
  "recommended_action": "create tutorial + onboarding guidance"
}
```

### Tutorial published
```json
{
  "event": "content.tutorial.published",
  "timestamp": "2026-04-01T01:55:00Z",
  "content": {
    "title": "Why Your Agent Gets Worse in Long Chats",
    "type": "tutorial",
    "url": "https://heyron-ai.github.io/agent-library/tutorials/long-chats-and-lost-work.html",
    "github_commit": "34f4869",
    "audience": "non-technical users",
    "problem_solved": "users think long chats should work forever"
  }
}
```

---

## Recommended views

Create views for:
- Triage Queue
- Repeating Pain Points
- Users to Follow Up With
- Helpers / Champions
- At-Risk Users
- Feature Requests by Frequency
- Projects Worth Featuring
- Tutorial Opportunities
- Robby Social Calendar
- This Week's Priorities
- Inbox Needing Triage

---

## MVP recommendation

If you need to launch fast, start with just:
- People
- Touchpoints
- Ideas & Feature Requests
- Support Pain Points
- Content Pipeline
- Tasks
- Inbox / Intake

Then add Accounts, Community Projects, Social, and Calendar after the core workflows are stable.

---

## Success test

The system is successful if a small team can answer these questions in under a minute:

- What are users struggling with repeatedly?
- Which issues should become tutorials?
- Who needs follow-up?
- What should Robby post about next?
- Which projects are worth featuring?
- Which requests are gaining momentum?
- What is urgent today?

---

Made for The Den. Keep it useful.
