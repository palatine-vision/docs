# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Mintlify documentation site for Palatine Speech API — a speech-to-text service with transcription, diarization, sentiment analysis, and AI summarization capabilities. Content is written in Russian.

## Commands

### Local Development
```bash
npm i -g mintlify    # Install CLI (one-time)
mintlify dev         # Start local preview at http://localhost:3000
mintlify install     # Re-install dependencies if dev server fails
```

### Regenerate API Reference from OpenAPI
```bash
# macOS/Linux
./gen_mdx_macos

# Windows
gen_mdx.cmd
```
This fetches OpenAPI specs from `api.palatine.ru` and generates MDX files in `api-reference/`.

## Architecture

### Configuration
- `docs.json` — Main Mintlify config: theme, navigation, OpenAPI sources, branding
- OpenAPI specs are fetched from 5 remote endpoints (transcribe, audio, diarization, sentiment_analysis, ai_service)

### Content Structure
```
documentation/           # Hand-written guides (Russian)
├── quick_start/        # Getting started tutorials
└── technical_information/  # Reference docs (languages, file formats, polling)

api-reference/          # Auto-generated from OpenAPI specs
├── transcribe/         # Transcription polling API
├── transcribe_openai/  # OpenAI-compatible endpoint
├── diarization/        # Speaker diarization API
├── sentiment-analysis/ # Sentiment analysis API
└── ai-service/         # AI summarization API
```

### MDX Patterns

**API reference files** — Minimal, just frontmatter pointing to OpenAPI:
```mdx
---
openapi: post /endpoint_path
---
```

**Guide files** — Rich content using AccordionGroup for step-by-step workflows:
```mdx
---
title: 'Заголовок'
---
<AccordionGroup>
  <Accordion title="Шаг 1">...</Accordion>
</AccordionGroup>
```

### API Pattern
All async APIs follow polling pattern: submit task → poll status with `task_id` → states are "success", "pending", "error" → optional cleanup via `/task_done`.

## Related API Project

This documentation describes client interaction with the API located at:
```
/mnt/c/Users/Andrew/PycharmProjects/WORKING_PROJECTS/Palatine/Cloud/cloud-transcribation-and-diarization-api/backend
```

### Before Writing Documentation
Before writing or updating API documentation, use the Task tool with `subagent_type=Explore` to read the router implementation in the related API project. This ensures documentation accurately reflects the actual API behavior.

### Dev Environment OpenAPI
If API changes exist only in dev environment (not yet deployed to prod), you can fetch the OpenAPI spec from:
```
http://10.146.2.6:8811/openapi.json
```

**Important:** Before fetching from the dev environment, always ask the user if it's appropriate to use the dev API spec instead of production.

## Key Files
- `docs.json` — Navigation structure and API sources
- `gen_mdx_macos` / `gen_mdx.cmd` — API docs generation scripts
- `logo/`, `favicon-*.svg` — Brand assets

## Mintlify Components Reference

When writing or formatting documentation articles, use the Task tool with a separate agent to fetch and study the Mintlify components documentation:
```
https://www.mintlify.com/docs/components
```

This documentation covers all available MDX components (Accordion, Card, CodeGroup, Tabs, Callout, etc.) and their proper usage for creating rich, interactive documentation pages.
