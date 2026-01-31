---
title: About SC Tuning
linkTitle: About
menu: {main: {weight: 40}}
---

{{% blocks/cover title="About SC Tuning" image_anchor="bottom" height="auto" %}}
{{% /blocks/cover %}}

{{% blocks/lead %}}
SC Tuning is a personal project exploring AI, ML, and live telemetry systems
through the lens of sim racing performance optimization.
{{% /blocks/lead %}}

## How It Started

After years of racing in Forza, I stumbled across a "Data Out" option buried in the settings. Looked it up - telemetry you could send to a server and analyze? I was immediately floored.

I spent the next two weeks straight coding instead of racing, figuring out how to capture and leverage this data. Nine months later, I'm still hooked.

---

## The Problem

Forza Motorsport 7 outputs telemetry data at 60Hz - 85 data points every 16 milliseconds. Speed, tire temps, suspension travel, throttle position, G-forces. Everything you need to understand why you're fast (or slow).

The data exists. The problem is using it.

Most sim racers never touch telemetry. Those who do face scattered tools, manual data wrangling, and the tedious work of correlating hundreds of variables to find what matters. By the time you've analyzed one session, you've lost the feel for the car and the context for what went wrong.

---

## The Vision

SC Tuning exists to close that loop.

**Real-time telemetry capture** - Data flows from the game to analysis the moment it's generated. No manual exports, no file hunting.

**Intelligent analysis** - Instead of drowning in 85 fields of raw data, get insights that matter. Where are you losing time? What's the tire doing through Turn 3? Why does the car feel unstable on entry?

**Actionable tuning guidance** - Connect telemetry patterns to setup adjustments. Not just "your tire temp is high" but "consider reducing pressure to bring temps into optimal range."

---

## The Approach

SC Tuning takes a layered approach:

1. **Rule-based analysis** (now) - Encode known tuning wisdom into diagnostic rules. If tire temps exceed threshold X, suggest adjustment Y.

2. **Statistical patterns** (next) - Learn from accumulated sessions. What do fast laps look like? Where does variance creep in?

3. **ML-powered insights** (future) - Train models on telemetry time-series to predict performance and prescribe optimizations.

4. **Adaptive agents** (research) - Specialized AI agents for different aspects of car setup, working together to diagnose and tune.

---

## Why Build This

Sim racing is a perfect sandbox for real-time systems engineering. The data is rich, the feedback loop is immediate, and the stakes are low enough to experiment freely.

SC Tuning is also an exploration of what happens when you apply modern AI/ML tooling to a domain with clear success metrics (lap time, consistency, tire wear). The lessons learned here - real-time pipelines, adaptive agents, human-AI collaboration - apply far beyond racing games.

The goal isn't to replace the driver's intuition. It's to amplify it.

---

## The Project Structure

SC Tuning combines two focus areas:

**AI + ML + Live Telemetry Systems** - Designing real-time pipelines, adaptive agents,
and ML systems for telemetry processing, time-series analysis, and performance insights.

**Forza Applied Tuning Lab** - Applying these tools to improve driving and tuning
in Forza Motorsport, lap by lap.

---

## Credits

Telemetry data from Forza Motorsport via UDP telemetry output.
