---
title: "System Architecture"
linkTitle: "Architecture"
weight: 1
description: >
  How the SC Tuning telemetry pipeline works, from game output to dashboard visualization.
---

SC Tuning captures real-time telemetry from Forza Motorsport 7 and processes it through a multi-stage pipeline. This document explains each component and how they connect.

## Pipeline Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         SC TUNING PIPELINE                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│   ┌──────────────┐     UDP 7777      ┌──────────────────┐              │
│   │   FM7 Game   │ ────────────────► │ Telemetry        │              │
│   │   (Xbox/PC)  │    60 packets/sec │ Receiver (VPS)   │              │
│   └──────────────┘                   └────────┬─────────┘              │
│                                               │                         │
│                                               │ raw.bin files           │
│                                               ▼                         │
│                                      ┌──────────────────┐              │
│                                      │ Session Storage  │              │
│                                      │ data/sessions/   │              │
│                                      └────────┬─────────┘              │
│                                               │                         │
│                                               │ rsync                   │
│                                               ▼                         │
│                                      ┌──────────────────┐              │
│                                      │  Metrics API     │              │
│                                      │  (Go, port 8081) │              │
│                                      └────────┬─────────┘              │
│                                               │                         │
│                                               │ REST / SSE              │
│                                               ▼                         │
│                                      ┌──────────────────┐              │
│                                      │  WebUI Dashboard │              │
│                                      │  (Next.js, 3001) │              │
│                                      └──────────────────┘              │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Component Details

### 1. Telemetry Source (FM7)

Forza Motorsport 7 has a built-in "Data Out" feature that broadcasts telemetry over UDP.

| Setting | Value |
|---------|-------|
| Protocol | UDP |
| Port | 7777 |
| Packet size | 311 bytes |
| Frequency | 60Hz (every ~16ms) |
| Fields | 85 per packet |

The game sends data continuously while driving, including:
- Vehicle dynamics (speed, RPM, gear)
- Tire data (temps, slip angles, slip ratios)
- Suspension (travel, velocity per wheel)
- Inputs (throttle, brake, steering)
- Position (lap distance, race position)

### 2. Telemetry Receiver

A Go service running on a VPS captures UDP packets and writes them to disk.

**Responsibilities:**
- Listen on UDP port 7777
- Detect session boundaries (new track, car change, game restart)
- Write raw packets to `raw.bin` files per session
- Generate session metadata (fingerprint, timestamps)

**Session structure:**
```
data/sessions/
├── 2026-01-23T14-30-00/
│   ├── raw.bin          # Binary packet stream
│   └── metadata.json    # Session info
├── 2026-01-23T15-45-00/
│   ├── raw.bin
│   └── metadata.json
```

### 3. Session Storage

Raw telemetry is stored as binary files for efficient replay and analysis.

**Why binary?**
- 311 bytes × 60Hz × 60 seconds = ~1.1 MB per minute
- Binary preserves full precision without JSON overhead
- Sessions can be replayed at any speed

**Sync strategy:**
- VPS captures live data
- `rsync` pulls sessions to local storage for analysis
- Allows offline development against real data

### 4. Metrics API

A Go REST API that parses raw telemetry and exposes processed metrics.

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/sessions` | GET | List available sessions |
| `/api/v1/sessions/{id}` | GET | Session metadata |
| `/api/v1/sessions/{id}/telemetry` | GET | Paginated telemetry frames |
| `/api/v1/sessions/{id}/metrics` | GET | Computed metrics |
| `/api/v1/sessions/{id}/stream` | SSE | Real-time telemetry stream |

**Current metrics (9 implemented):**
- Lap times and sector splits
- Top speed per lap
- Tire temperature averages
- Brake/throttle usage percentages
- Suspension travel statistics

### 5. WebUI Dashboard

A Next.js application for visualizing telemetry and metrics.

**Current pages:**
- **Core Telemetry** - Raw field display, all 85 values
- **Live Sessions** - Session browser and selector
- **Metrics View** - Computed performance data

**Tech stack:**
- Next.js 14 (App Router)
- TypeScript
- Tailwind CSS
- SSE for real-time updates

---

## Data Flow Example

Here's what happens when you complete a lap:

1. **FM7** broadcasts ~3,600 packets (60Hz × 60 seconds)
2. **Receiver** writes packets to `raw.bin` as they arrive
3. **Metrics API** parses the binary when requested
4. **API** computes lap time from position delta + timestamp
5. **Dashboard** displays lap time and telemetry graphs

---

## Current Capabilities

| Capability | Status |
|------------|--------|
| UDP packet capture | ✅ Working |
| 85-field packet parsing | ✅ Working |
| Session management | ✅ Working |
| REST API | ✅ Working |
| SSE streaming | ✅ Working |
| 806 car database | ✅ Working |
| Metrics computation | ✅ 9 metrics |
| Dashboard visualization | ⚠️ Partial |
| Track identification | 🔄 In progress |
| ML models | 📋 Planned |

---

## Technology Choices

| Layer | Technology | Why |
|-------|------------|-----|
| Receiver | Go | Fast, low memory, easy deployment |
| API | Go | Same binary, simple REST |
| Dashboard | Next.js | React ecosystem, SSR, fast iteration |
| Storage | Binary files | Simple, portable, efficient |
| Streaming | SSE | Simpler than WebSockets for one-way data |

---

## Next Steps

The current pipeline handles data capture and basic metrics. Upcoming work:

1. **Rule-based diagnostics** - Encode tuning wisdom as detection rules
2. **Statistical analysis** - Identify patterns across sessions
3. **Track fingerprinting** - Auto-identify tracks from telemetry patterns
4. **ML integration** - Train models for lap time prediction and anomaly detection
