---
title: "Service Health"
linkTitle: "Status"
weight: 1
description: "Current operational status of SC Tuning services"
---

## System Status

| Service | Status | Description |
|---------|--------|-------------|
| Telemetry Receiver | Operational | VPS capturing FM7 telemetry at 60Hz |
| Metrics API | Operational | REST + SSE endpoints active |
| Dashboard | Operational | Internal engineer dashboard |

**Last verified:** 2026-01-23

---

## Architecture Overview

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

---

## Current Capabilities

- **85 telemetry fields** decoded per frame at 60Hz
- **9 production metrics** implemented
- **806 car specifications** in lookup database
- **13+ recorded sessions** available for analysis

---

## Known Limitations

- Dashboard has partial pages under development
- Track identity curation UI incomplete
- 4 fields awaiting wet-track validation (WheelInPuddleDepth)

---

## Quick Health Check

To verify system health locally:

```bash
# API health
curl http://localhost:8081/api/v1/sessions

# WebUI
open http://localhost:3001
```
