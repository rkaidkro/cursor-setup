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

The rules below are ordered **oldest → newest** by the first git commit that introduced them (filesystem “creation time” is not meaningful after cloning, and GitHub’s UI often rounds timestamps to “N days ago”).

> Note: Extremely long rule files are usually counterproductive because they eat into the model’s context window and may be partially ignored/truncated in practice.

- `api-key-errors.mdc` (**always applied**, introduced `2025-12-16T16:17:52+11:00`): Fail-soft handling for missing/invalid API keys; keeps agents moving and loudly reports what key is missing.
- `your-role-atlas.mdc` (**always applied**, introduced `2025-12-16T16:17:52+11:00`): Infra/ops persona focused on the Atlas GPU server (SSH, containers, services).
- `your-role_sous.mdc.disable` (**disabled**, introduced `2025-12-16T16:17:52+11:00`): Kitchen-brigade themed infra persona (“SOUS”) for structured operational workflows.
- `your-role-HA.mdc.disable` (**disabled**, introduced `2025-12-16T16:17:52+11:00`): Home Assistant automation persona.
- `your-role-parra.mdc.disable` (**disabled**, introduced `2025-12-16T16:17:52+11:00`): Parallel agent orchestration persona for running many agents concurrently.
- `your-role-work-swe-aid.mdc.disable` (**disabled**, introduced `2025-12-16T16:29:49+11:00`): Senior SWE assistant persona for enterprise-style development.
- `your-role-legal-aid.mdc.disable` (**disabled**, introduced `2025-12-16T16:29:49+11:00`): Legal assistant persona.
- `your-role-v4-codec.mdc.disable` (**disabled**, introduced `2025-12-16T16:31:37+11:00`): V4 codec persona.
- `your-role-v5-codec.mdc.disable` (**disabled**, introduced `2025-12-16T16:31:37+11:00`): V5 codec persona.

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

