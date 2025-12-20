# Cursor Setup

A collection of Cursor AI rules, personas, and commands for autonomous agent workflows.

## Quick Install

### Project-level install (current directory)
```bash
curl -fsSL https://raw.githubusercontent.com/rkaidkro/cursor-setup/main/install.sh | bash
```

### Global install (all projects)
```bash
curl -fsSL https://raw.githubusercontent.com/rkaidkro/cursor-setup/main/install.sh | bash -s -- --global
```

## What's Included

### Rules (`.cursor/rules/`)

This repo is a grab-bag of experiments. New learnings are **not** consistently back-propagated into older files, so some rules may look “cool” but be outdated or overly verbose. In practice, giant rule files are often counterproductive because they eat into the context window.

| File | What it does |
|------|--------------|
| `api-key-errors.mdc` | Fail-soft handling for missing/invalid API keys. If something needs a secret, it keeps going where possible, searches common `.env` locations, and clearly reports what’s still missing. |
| `your-role.mdc` | A compact “default” autonomous agent role for general projects. Intentionally short to avoid burning context; meant as a baseline you can copy and specialize per repo. |
| `your-role-atlas.mdc` | An ops/infra-focused persona for the Atlas GPU server. Biases toward SSH-first workflows, containers/services, and “run it + verify it” behavior for long-running GPU tasks. |
| `your-role_sous.mdc.disable` | A “SOUS chef” style persona: breaks work into a tight operational loop and pushes for disciplined execution/verification. Kept disabled by default because it’s more of a style experiment. |
| `your-role-HA.mdc.disable` | Home Assistant automation persona. Focuses on practical HA changes, safety (non-destructive defaults), and validation of automations. |
| `your-role-parra.mdc.disable` | Parallel-agent orchestration persona. Optimizes for running lots of agents concurrently without blocking, and for keeping workstreams coordinated. |
| `your-role-work-swe-aid.mdc.disable` | A more “enterprise SWE assistant” persona. Tends toward conservative design, incremental changes, and strong engineering hygiene. |
| `your-role-legal-aid.mdc.disable` | Legal assistant persona. Geared toward extracting requirements, summarizing documents, and drafting/structuring legal-ish text (not legal advice). |
| `your-role-v4-codec.mdc.disable` | Codec persona experiment (v4). Focuses on structured reasoning about encoding/decoding, formats, and debugging media pipelines. |
| `your-role-v5-codec.mdc.disable` | Codec persona experiment (v5). Similar goals as v4 with a different emphasis/style; kept disabled by default. |

### Commands (`.cursor/commands/`)

| File | Purpose |
|------|---------|
| `commit.md` | Rich, high-context git commit with WHY/WHAT structure |

## Manual Install

```bash
git clone https://github.com/rkaidkro/cursor-setup.git
cp -r cursor-setup/.cursor .
```

## Enabling/Disabling Rules

- **Enable**: Remove `.disable` suffix from filename
- **Disable**: Add `.disable` suffix to filename

```bash
# Enable the SOUS kitchen persona
mv .cursor/rules/your-role_sous.mdc.disable .cursor/rules/your-role_sous.mdc

# Disable Atlas persona
mv .cursor/rules/your-role-atlas.mdc .cursor/rules/your-role-atlas.mdc.disable
```

## Customization

Edit the rules to match your environment:
- Replace hostnames, paths, and project-specific details
- Adjust autonomy boundaries for your comfort level
- Add project-specific context to `description` fields

## License

MIT

