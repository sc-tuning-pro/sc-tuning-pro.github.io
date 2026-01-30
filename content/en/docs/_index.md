---
title: Documentation
linkTitle: Docs
menu: {main: {weight: 10}}
---

All SC Tuning documentation in one place.

---

## System Architecture

SC Tuning captures realtime telemetry from Forza Motorsport 7 and processes it through a multistage pipeline.

```
FM7 Game (UDP 7777)
    |
    v
Telemetry Receiver (VPS)
    | writes raw.bin files
    v
Session Storage (data/sessions/)
    | rsync
    v
Metrics API (Go, port 8081)
    | REST + SSE
    v
WebUI Dashboard (Next.js, port 3001)
```

### Components

**Telemetry Receiver.** Go service on VPS captures UDP packets at 60Hz, writes raw.bin files per session.

**Metrics API.** Go REST API parses raw telemetry, exposes 9 metrics via REST and SSE streaming.

**WebUI Dashboard.** Next.js application for visualizing telemetry and metrics.

### Current Capabilities

| Capability | Status |
|------------|--------|
| UDP packet capture | Working |
| 85 field packet parsing | Working |
| 9 MVP metrics | Working |
| REST API + SSE | Working |
| 806 car database | Working |
| Dashboard | Partial |

---

## Tuning Guides

*Coming soon.*

This section will contain practical guides for interpreting telemetry and tuning cars:

- Reading tire temperatures
- Suspension basics
- Setup parameter reference

---

## API Reference

*Coming soon.*

This section will document the Metrics API endpoints:

- `/api/v1/sessions` List sessions
- `/api/v1/sessions/{id}/telemetry` Get telemetry frames
- `/api/v1/sessions/{id}/metrics` Get computed metrics
- `/api/v1/sessions/{id}/stream` SSE realtime stream
