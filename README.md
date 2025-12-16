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

| File | Purpose | Always Applied |
|------|---------|----------------|
| `api-key-errors.mdc` | Fail-soft handling for missing API keys | ✅ |
| `your-role-atlas.mdc` | Autonomous systems/infra agent for Atlas server | ✅ |
| `your-role-work-swe-aid.mdc` | Senior SWE assistant for CSIRO work | ✅ |
| `your-role_sous.mdc` | Kitchen-brigade themed infra agent ("SOUS") | Disabled |
| `your-role-HA.mdc` | Home Assistant automation agent | Disabled |
| `your-role-parra.mdc` | Parallel agent orchestration system | Disabled |

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

