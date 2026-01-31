---
title: "AI + ML + Telemetry Systems"
linkTitle: "AI + ML + Telemetry"
weight: 10
type: docs
menu: {main: {weight: 10, pre: '<span class="text-white">', post: '</span>'}}
description: >
  Designing and building real-time data pipelines, intelligent agents, and applied ML infrastructure for streaming telemetry, time-series analytics, and system performance insights.
---

This section documents the technical infrastructure behind SC Tuning: real-time telemetry pipelines, data processing, and the ML systems being developed for performance analysis.

## Current State

The core pipeline is operational:

```
FM7 Game (UDP 7777)
    ↓
Telemetry Receiver (VPS)
    ↓ rsync
Local Session Storage
    ↓
Metrics API (REST/SSE)
    ↓
WebUI Dashboard
```

**Working now:**
- 85 telemetry fields decoded at 60Hz
- 9 production metrics implemented
- REST API with pagination + SSE streaming
- Session management and replay

**In development:**
- Rule-based diagnostic engine
- Track identification system
- Statistical pattern analysis

**Planned:**
- ML models for lap time prediction
- Anomaly detection for setup issues
- Adaptive tuning agents

---

## Documentation Roadmap

| Topic | Status |
|-------|--------|
| [System Architecture](architecture/) | Available |
| Telemetry Field Reference | Coming soon |
| Metrics API Guide | Coming soon |
| ML Model Documentation | Planned | 