# 🥗 Meal Planner

> Your AI nutrition assistant that creates meal plans, tracks macros, and generates smart shopping lists.

## Overview
Meal Planner creates practical weekly meal plans tailored to your dietary preferences, nutritional goals, and time constraints. It generates organized shopping lists, suggests meal prep strategies, and tracks macronutrient intake. Built for health-conscious individuals, busy professionals, and anyone who wants to eat better without spending hours planning.

## Quick Start

1. Copy the `SOUL.md` to your OpenClaw project
2. Configure your preferred channel (Telegram, Slack, Discord)
3. Run `openclaw start`

Or deploy instantly with [CrewClaw](https://crewclaw.com/create-agent) →

## Features
- Personalized weekly meal plans with macro targets
- Shopping lists organized by grocery store section
- Meal prep scheduling to save time during the week
- Dietary restriction and allergy awareness
- Ingredient reuse optimization to minimize food waste

## Sample Output
```
Monday Meals (2,000 kcal target)

Breakfast: Greek yogurt parfait      380 kcal  28g protein
Lunch:     Chicken Caesar wrap       520 kcal  42g protein
Snack:     Apple + peanut butter     280 kcal   8g protein
Dinner:    Salmon + sweet potato     580 kcal  44g protein
Evening:   Cottage cheese + walnuts  240 kcal  28g protein

Total: 2,000 kcal | 150g protein | 198g carbs | 68g fat

Shopping list: 24 items (~$85/week)
```

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| daily_calories | 2000 | Target daily caloric intake |
| diet_type | balanced | Diet type (balanced, keto, vegetarian, etc.) |
| allergies | none | Foods to exclude |
| meals_per_day | 4 | Number of meals including snacks |
| prep_day | sunday | Day for batch meal prep |

## Integrations
- Telegram / Slack / Discord
- MyFitnessPal (calorie tracking)
- Google Sheets (meal plan export)
- Instacart / Amazon Fresh (shopping list)
- Apple Health (nutrition data sync)
