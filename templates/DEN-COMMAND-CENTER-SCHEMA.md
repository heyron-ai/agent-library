# DEN-COMMAND-CENTER-SCHEMA.md

A pickup-ready Airtable schema for **The Den Command Center**.

Use this if you want to actually build the base — not just prompt an AI about it.

---

## What this is

This schema is designed to sit **alongside an existing tech/support triage system**.

It gives you the rest of the operating system:
- community management
- ideas and feature requests
- recurring pain points
- project/showcase tracking
- content pipeline
- social planning
- calendar visibility
- founder follow-up
- lightweight CRM / sales tracking

---

## Table 1: People

### Purpose
Track members, helpers, power users, at-risk users, leads, and notable community people.

### Fields
| Field | Type | Notes |
|---|---|---|
| Person ID | Autonumber or formula | Primary key helper |
| Name | Single line text | Display name |
| Preferred Name | Single line text | Optional |
| Discord Username | Single line text | e.g. cassieleexoxo |
| Discord User ID | Single line text | Keep as text |
| Other Handles | Long text | X, LinkedIn, Telegram, etc. |
| Segment | Single select | New, Active, Helper, Power User, At Risk, Lead, Customer |
| Join Date | Date | |
| Status | Single select | Watching, Active, Needs Follow-up, Dormant |
| Interests / Use Cases | Long text | |
| Tags | Multiple select | creator, builder, trader, real-estate, etc. |
| Linked Account | Link to Accounts | Optional |
| Last Meaningful Interaction | Date | |
| Sentiment | Single select | Positive, Neutral, Frustrated, At Risk |
| Notes | Long text | |
| Source URL | URL | Original Discord/message/profile link |
| Owner | Collaborator or single select | |

---

## Table 2: Accounts

### Purpose
Track businesses, teams, agencies, creator brands, or projects with commercial value.

### Fields
| Field | Type | Notes |
|---|---|---|
| Account Name | Single line text | |
| Type | Single select | Company, Creator, Agency, Team, Project |
| Primary Contact | Link to People | |
| Linked People | Link to People | Multiple |
| Industry | Single select or text | |
| Team Size | Single select | Solo, 2-5, 6-20, 20+ |
| Use Case | Long text | |
| Status | Single select | Exploring, Active, Expanding, At Risk |
| Revenue Potential | Single select | Low, Medium, High |
| Expansion Potential | Single select | Low, Medium, High |
| Notes | Long text | |
| Owner | Collaborator or single select | |

---

## Table 3: Touchpoints

### Purpose
Track meaningful interactions across community, support, sales, and onboarding.

### Fields
| Field | Type | Notes |
|---|---|---|
| Touchpoint ID | Autonumber | |
| Date | Date + time | |
| Person | Link to People | |
| Account | Link to Accounts | Optional |
| Channel / Surface | Single select | Discord, DM, Email, Call, Form, Social |
| Interaction Type | Single select | Support, Onboarding, Feedback, Sales, Community, Follow-up |
| Summary | Long text | |
| Outcome | Long text | |
| Next Step | Long text | |
| Related Ticket | Link to existing Tickets | Preserve triage integration |
| Source Message URL | URL | |
| Owner | Collaborator or single select | |

---

## Table 4: Ideas & Feature Requests

### Purpose
Track product asks, workflow ideas, and repeated community suggestions.

### Fields
| Field | Type | Notes |
|---|---|---|
| Title | Single line text | |
| Description | Long text | |
| Source Person | Link to People | |
| Source Account | Link to Accounts | Optional |
| Source Channel | Single select | ideas-and-feedback, help, general-chat, etc. |
| Source Message URL | URL | |
| Category | Single select | Product, Community, UX, Support, Marketing, Sales |
| Pain Point | Link to Support Pain Points | Optional |
| Repeat Count | Number | How often seen |
| Linked Tickets | Link to existing Tickets | Multiple |
| Priority | Single select | Low, Medium, High, Urgent |
| Status | Single select | New, Reviewing, Planned, Shipped, Declined |
| Related Content Opportunity | Link to Content Pipeline | Optional |
| Owner | Collaborator or single select | |

---

## Table 5: Support Pain Points

### Purpose
Track repeated issues, not one-off tickets.

### Fields
| Field | Type | Notes |
|---|---|---|
| Pain Point Name | Single line text | |
| Description | Long text | |
| Example Quote | Long text | User language |
| Source Tickets | Link to existing Tickets | Multiple |
| Source Message URL | URL | |
| Frequency | Number | How often seen |
| Severity | Single select | Low, Medium, High, Critical |
| Affected Segment | Single select | New Users, Mainstream Users, Helpers, Power Users |
| Related Tutorial | Link to Content Pipeline | |
| Related Feature Request | Link to Ideas & Feature Requests | |
| Status | Single select | Watching, Active, Addressed |
| Owner | Collaborator or single select | |

---

## Table 6: Community Projects

### Purpose
Track builds, WIP projects, showcase candidates, and community success stories.

### Fields
| Field | Type | Notes |
|---|---|---|
| Project Name | Single line text | |
| Builder | Link to People | |
| Linked Account | Link to Accounts | Optional |
| Stage | Single select | Idea, WIP, Launched |
| Description | Long text | |
| Category | Single select | Showcase, Workflow, Business, Personal, Automation |
| Source Channel | Single select | showcase, ideas-and-feedback, general-chat |
| Source Message URL | URL | |
| Related Links | Long text or URL | |
| Worth Featuring? | Checkbox | |
| Feature Status | Single select | Not Reviewed, Candidate, Featured |
| Notes | Long text | |
| Owner | Collaborator or single select | |

---

## Table 7: Content Pipeline

### Purpose
Track tutorials, videos, templates, skills, digests, and social-content opportunities.

### Fields
| Field | Type | Notes |
|---|---|---|
| Title | Single line text | |
| Content Type | Single select | Tutorial, Template, Skill, Video, Digest, Social Post, Docs |
| Audience | Single select | New Users, Mainstream Users, Advanced Users, Internal |
| Problem Solved | Long text | |
| Related Pain Point | Link to Support Pain Points | |
| Related Feature Request | Link to Ideas & Feature Requests | |
| Related Project | Link to Community Projects | |
| Funnel Stage | Single select | Awareness, Onboarding, Retention, Expansion |
| Status | Single select | Backlog, Drafting, Editing, Published |
| Publish URL | URL | |
| Publish Date | Date | |
| Owner | Collaborator or single select | |
| Performance Notes | Long text | |
| Ticket Reduction Potential | Single select | Low, Medium, High |

---

## Table 8: Social Media / Founder Content

### Purpose
Help Robby keep socials, updates, launches, and public communication organized.

### Fields
| Field | Type | Notes |
|---|---|---|
| Post / Asset Name | Single line text | |
| Platform | Single select | X, LinkedIn, Discord, YouTube, Email, Blog |
| Content Type | Single select | Post, Thread, Video, Announcement, Campaign |
| Goal | Single select | Awareness, Activation, Retention, Community, Launch |
| Topic | Long text | |
| Draft Status | Single select | Idea, Drafting, Ready, Scheduled, Published |
| Publish Date | Date + time | |
| CTA | Long text | |
| Related Tutorial / Feature / Launch / Project | Link to Content / Projects / Ideas | Flexible multi-link |
| Asset Link | URL | |
| Performance | Long text or numbers | |
| Owner | Collaborator or single select | |

---

## Table 9: Calendar / Important Dates

### Purpose
Track launches, events, digest dates, meetings, campaign milestones, and founder priorities.

### Fields
| Field | Type | Notes |
|---|---|---|
| Title | Single line text | |
| Date | Date | |
| Time | Date + time or text | |
| Category | Single select | Launch, Event, Content, Meeting, Follow-up, Campaign |
| Related Person | Link to People | Optional |
| Related Account | Link to Accounts | Optional |
| Related Content | Link to Content Pipeline | Optional |
| Related Campaign | Link to Social / Content | Optional |
| Owner | Collaborator or single select | |
| Notes | Long text | |

---

## Table 10: Tasks / Follow-Ups

### Purpose
A unified action layer across support, content, founder ops, and community.

### Fields
| Field | Type | Notes |
|---|---|---|
| Task | Single line text | |
| Type | Single select | Follow-up, Content, Community, Support, Sales, Ops |
| Related Person | Link to People | Optional |
| Related Account | Link to Accounts | Optional |
| Related Ticket | Link to existing Tickets | Optional |
| Related Idea | Link to Ideas & Feature Requests | Optional |
| Related Content | Link to Content Pipeline | Optional |
| Related Project | Link to Community Projects | Optional |
| Related Campaign | Link to Social Media / Founder Content | Optional |
| Priority | Single select | Low, Medium, High, Urgent |
| Due Date | Date | |
| Status | Single select | Open, In Progress, Waiting, Done |
| Owner | Collaborator or single select | |

---

## Table 11: Inbox / Intake

### Purpose
The raw intake layer for bots, webhooks, operators, and agents.

### Fields
| Field | Type | Notes |
|---|---|---|
| Intake Type | Single select | Message, Ticket Event, Idea, Pain Point, Project, Content Event |
| Raw Content | Long text | |
| Source | Single select | Discord, Bot, Webhook, Manual, GitHub |
| Source URL | URL | |
| Suggested Tags | Multiple select | |
| Suggested Destination | Single select | People, Ideas, Pain Points, Projects, Content, Tasks |
| Processed? | Checkbox | |
| Owner | Collaborator or single select | |
| Created At | Created time | |

---

## MVP launch order

If you want this live fast, build in this order:

1. Inbox / Intake
2. People
3. Ideas & Feature Requests
4. Support Pain Points
5. Content Pipeline
6. Tasks / Follow-Ups
7. Touchpoints
8. Community Projects
9. Social Media / Founder Content
10. Calendar / Important Dates
11. Accounts

---

## Rule of thumb

If a record can’t answer these fields, it probably isn’t operational yet:
- Who owns it?
- What status is it in?
- What is the next step?
- Where did it come from?
- What is it linked to?

---

Made for The Den. Keep it useful, not precious.
