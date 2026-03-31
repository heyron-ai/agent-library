# :airplane: Travel Planner - Itineraries That Actually Work

> Plans day-by-day travel itineraries with flights, hotels, activities, budgets, and local logistics.

## Overview
Travel Planner builds complete trip itineraries with realistic timing, cost breakdowns, and multi-tier recommendations. Every suggestion includes prices, opening hours, and transit times. It accounts for local holidays, visa requirements, and advance booking needs so nothing falls through the cracks.

## Quick Start
```bash
mkdir -p ~/.openclaw/agents/travel-planner/agent
cp SOUL.md ~/.openclaw/agents/travel-planner/agent/
openclaw agents add travel-planner --workspace ~/.openclaw/agents/travel-planner
```

## Use Cases
| Request | Output |
|---------|--------|
| "5 days in Tokyo, $3K budget for two" | Day-by-day itinerary with hotel, food, activities, transit, and cost totals |
| "Weekend road trip from SF along the coast" | Route plan with stops, drive times, gas estimates, and hotel options |
| "Compare Bali vs. Thailand for a 2-week trip" | Side-by-side cost breakdown, weather, visa needs, and itinerary highlights |

## Author
Created by [@openclaw](https://github.com/openclaw)
