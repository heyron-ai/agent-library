# DEN-COMMAND-CENTER-VIEWS-AND-AUTOMATIONS.md

Use this with the Den Command Center schema to make the Airtable base operational on day one.

---

## Views to create

### Triage / Support Views

#### 1. Triage Queue
Show:
- open tickets
- urgent tickets
- unassigned tickets
- tickets with repeated keywords or pain-point links

Purpose:
- preserve the existing support workflow
- keep tech/support visible inside the larger command center

#### 2. Repeating Pain Points
Filter:
- Frequency >= 3
- Status != Addressed

Sort by:
- Severity desc
- Frequency desc

Purpose:
- shows what should become docs, tutorials, product fixes, or alerts

#### 3. Tutorial Opportunities
Filter Content Pipeline where:
- Status = Backlog
- Related Pain Point is not empty

Sort by:
- Ticket Reduction Potential desc

Purpose:
- easiest way to convert community pain into content

---

### Community Views

#### 4. Helpers / Champions
People where:
- Segment = Helper or Power User
- Sentiment = Positive

Purpose:
- people worth recognizing, involving, or featuring

#### 5. At-Risk Users
People where:
- Sentiment = Frustrated or At Risk
- Status != Resolved

Purpose:
- prevent churn and follow up early

#### 6. Users to Follow Up With
People or Touchpoints where:
- Next Step is not empty
- Due date is today or overdue

Purpose:
- relationship management without needing a giant CRM

#### 7. Projects Worth Featuring
Community Projects where:
- Worth Featuring? = checked
- Feature Status != Featured

Purpose:
- social proof pipeline and digest fuel

---

### Founder / Content Views

#### 8. Robby Social Calendar
Social Media / Founder Content where:
- Draft Status != Published

Grouped by:
- Platform

Sorted by:
- Publish Date

Purpose:
- founder content queue in one glance

#### 9. This Week's Priorities
Tasks where:
- Status != Done
- Due Date is within next 7 days

Sorted by:
- Priority desc
- Due Date asc

Purpose:
- command-center heartbeat

#### 10. Inbox Needing Triage
Inbox / Intake where:
- Processed? = unchecked

Sorted by:
- Created At desc

Purpose:
- nothing important gets lost

#### 11. Feature Requests by Frequency
Ideas & Feature Requests sorted by:
- Repeat Count desc
- Priority desc

Purpose:
- shows roadmap pull, not just loud opinions

---

## Suggested automations

### 1. Discord message intake → Inbox
Trigger:
- webhook created record in Inbox

Action:
- assign Owner based on Intake Type
- set Processed? = unchecked
- apply default tags

### 2. High-priority idea → Follow-up task
Trigger:
- Idea Priority = High or Urgent

Action:
- create Task:
  - Type = Follow-up
  - Status = Open
  - Priority = same as idea
  - Related Idea = current record

### 3. Repeating pain point → Content backlog
Trigger:
- Support Pain Point Frequency >= 3
- Related Tutorial is empty

Action:
- create Content Pipeline record
  - Content Type = Tutorial
  - Status = Backlog
  - Related Pain Point = current record
  - Ticket Reduction Potential = High

### 4. Community project worth featuring → Content or social task
Trigger:
- Community Project Worth Featuring? = checked
- Feature Status = Candidate

Action:
- create Task or Social draft record
  - Type = Community
  - Task = Review for feature / social spotlight

### 5. Published tutorial → update linked pain point
Trigger:
- Content Pipeline Status changes to Published

Action:
- update linked pain point status or add Publish URL
- optionally create Discord/social task to share it

### 6. At-risk person detected → follow-up task
Trigger:
- People Sentiment = At Risk

Action:
- create Task
  - Type = Follow-up
  - Priority = High
  - Related Person = current person

### 7. Calendar reminder view
Trigger:
- Date is 24 hours away

Action:
- flag in "This Week's Priorities" or create reminder task

---

## Operator rules

### Rule 1
If something is important but not urgent:
- put it in the right table
- link it to the right person or pain point
- assign an owner

### Rule 2
If something is urgent:
- create a Task immediately
- do not trust that someone will “remember it later”

### Rule 3
If the same complaint appears multiple times:
- it is no longer just support
- it is now a **Pain Point** and probably a **Content Opportunity**

### Rule 4
If a user built something cool:
- log it as a Community Project
- decide if it should feed social proof, digest, or founder content

### Rule 5
If Robby needs visibility:
- don’t bury the answer in notes
- make sure it is visible in a view

---

## Minimum viable operating rhythm

### Daily
- clear Inbox Needing Triage
- check This Week's Priorities
- review At-Risk Users
- review Tutorial Opportunities

### 3x per week
- review Repeating Pain Points
- review Projects Worth Featuring
- review Feature Requests by Frequency

### Weekly
- review Robby Social Calendar
- review published content and what it solved
- review what should become next week's priorities

---

## What not to do

- Do not use Airtable as a giant note graveyard
- Do not create 30 status values no one understands
- Do not duplicate one person across five tables as plain text
- Do not skip owner/next-step fields
- Do not dump raw Discord transcripts everywhere without summaries

---

## Success test

A new operator should be able to answer these in under a minute:
- What are people struggling with most?
- Who needs follow-up?
- What should become a tutorial next?
- What should Robby post about this week?
- What projects are worth highlighting?
- What is urgent today?

If they can't, simplify the base.
