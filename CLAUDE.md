# SC Tuning Pro Website

## Purpose

Public-facing website for SC Tuning - marketing, documentation hub, and curated content.

## Tech Stack

| Component | Technology | Notes |
|-----------|------------|-------|
| Static Site Generator | Hugo 0.147.3 (extended) | Fast Go-based SSG |
| Theme | Docsy | Google's technical docs theme |
| Hosting | Netlify + GitHub Pages | Dual deployment |
| Domain | sc-tuning.pro | Primary domain |

## Quick Commands

```bash
# Development server
hugo server --buildDrafts

# Production build
hugo

# Build with drafts
hugo --buildDrafts

# Deploy to GitHub Pages
./deploy_to_gh-pages.sh
```

## Content Structure

```
content/en/
├── docs/
│   ├── ai-ml-telemetry/    # Technical infrastructure docs
│   └── applied-tuning-lab/ # Practical tuning guides
├── changelog/              # Project updates
├── about/                  # Project background
└── _index.md               # Homepage
```

### Key Content Locations

| Section | Path | Purpose |
|---------|------|---------|
| Technical Docs | `content/en/docs/ai-ml-telemetry/` | Architecture, API, infrastructure |
| Tuning Guides | `content/en/docs/applied-tuning-lab/` | Practical how-tos for users |
| Changelog | `content/en/changelog/` | Release notes, updates |
| About | `content/en/about/` | Project story, team |

## Related Repositories

| Repo | Relationship |
|------|--------------|
| **sc-tuning-core** | Source of truth for technical capabilities |
| **sc-tuning-data** | Source material for curated content |

## When to Update

### New features in core
→ Update `docs/ai-ml-telemetry/` section

### Insights extracted from data
→ Write `docs/applied-tuning-lab/` guides

### Major milestones
→ Add `changelog/` entries

## Hugo/Docsy Notes

### Adding a New Page

1. Create file in appropriate `content/` directory
2. Add frontmatter:
```yaml
---
title: "Page Title"
linkTitle: "Nav Title"
weight: 10
description: "Short description"
---
```

### Docsy Shortcodes

```markdown
{{< alert >}}Important note{{< /alert >}}
{{< pageinfo >}}Page-level info box{{< /pageinfo >}}
```

### Assets and Images

- Store in `assets/` for Hugo Pipes processing
- Or use `static/` for direct serving
- Images in content: `content/en/docs/section/images/`

## Deployment

### Netlify (Primary)
- Auto-deploys on push to `main`
- Config: `netlify.toml`

### GitHub Pages (Mirror)
- Manual deploy via `./deploy_to_gh-pages.sh`
- Builds to `gh-pages` branch

## Configuration

- Primary config: `hugo.yaml`
- Disabled config: `hugo-disabled.toml` (TOML version, not in use)
- Docsy module: `go.mod` + `docsy.work`
