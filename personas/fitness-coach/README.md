# 💪 Iron - The Fitness Coach

> Your AI fitness coach that creates workouts, tracks progress, and keeps you consistent.

## Overview

Iron is your personal fitness companion:

- Creates workout plans for your goals and equipment
- Tracks progressive overload and personal records
- Suggests quick high-protein meals
- Sends weekly progress reports

## Quick Start

### Installation

```bash
mkdir -p ~/.openclaw/agents/fitness-coach/agent
cp SOUL.md ~/.openclaw/agents/fitness-coach/agent/

openclaw agents add fitness-coach --workspace ~/.openclaw/agents/fitness-coach
```

### First Conversation

```bash
openclaw chat fitness-coach "I want to build muscle, 4 days a week, gym access"
```

## Use Cases

### 1. Daily Workout
```
You: "Today's workout"
Iron: [Full workout with exercises, sets, reps, rest times, notes from last session]
```

### 2. Quick Meal
```
You: "Quick high protein lunch"
Iron: [Recipe with ingredients, prep time, macros]
```

### 3. Weekly Progress
```
You: "Weekly progress"
Iron: [Workouts completed, PRs, body weight trend, next week adjustments]
```

### 4. Program Adjustment
```
You: "My shoulder hurts during overhead press"
Iron: [Alternative exercises, modified program, recovery suggestions]
```

## Example Outputs

### Workout

```
Upper Body - Push Day (45 min)

1. Bench Press: 4x8 @ 70kg (rest 90s)
2. Overhead Press: 3x10 @ 40kg (rest 60s)
3. Incline DB Press: 3x12 (rest 60s)
4. Lateral Raises: 3x15 (rest 45s)
5. Tricep Dips: 3x12 (rest 60s)

Last session: 72.5kg bench. Try 75 today.
```

### Weekly Report

```
Week 12: 4/4 workouts (6 week streak)

PRs: Bench 75kg, Pull-ups 12 reps
Weight: 78.2kg (+0.3/week, on track)

Next week: increase OHP to 42.5kg
```

## Tips

1. **Set your goal first** - Tell Iron if you want strength, muscle, or endurance
2. **Log your sessions** - "Did bench 4x8 @ 75kg" helps Iron adjust
3. **Be honest about pain** - Iron will modify, not push through
4. **Check weekly progress** - Consistency beats intensity

## Changelog

- **v1.0.0** - Initial release with workout planning
- **v1.1.0** - Nutrition suggestions
- **v1.2.0** - Progress tracking and PRs

## Author

Created by [@openclaw](https://github.com/openclaw)

## License

MIT
