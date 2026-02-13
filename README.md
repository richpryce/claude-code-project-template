# Project Name

> One-line description of what this project does.

## Quick Start

```bash
npm install
bd init && bd hooks install
npm run dev
```

## Project Structure

```
├── CLAUDE.md           # Agent instructions (auto-loaded)
├── GETTING-STARTED.md  # Setup guide and workflow reference
├── docs/
│   ├── SPEC.md         # Project specification
│   └── DECISIONS.md    # Architecture decision log
├── openspec/specs/     # Feature specifications
├── .claude/
│   ├── commands/       # Slash commands (/start-bead, /tdd, etc.)
│   ├── rules/          # Auto-loaded coding rules
│   └── hooks.json      # Automated hooks (beads enforcement, etc.)
├── src/                # Source code
├── tests/              # Test files
└── infrastructure/     # Deployment configs
```

## Workflow

All work is tracked with [Beads](https://github.com/anthropics/beads):

```bash
bd create "feat: description" -p 1 --json    # Create issue
bd update <id> --status in_progress          # Start work
# ... work ...
bd close <id> --reason "Completed" --json    # Finish
bd sync                                       # Sync with git
```

See [GETTING-STARTED.md](GETTING-STARTED.md) for full details.

## License

[Your License Here]
