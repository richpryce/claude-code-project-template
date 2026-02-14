# Claude Code Project Template

A ready-to-use project template for building software with [Claude Code](https://docs.anthropic.com/en/docs/claude-code). It gives Claude structured rules, slash commands, git hooks, and issue tracking out of the box so you can go from idea to working code in a single session.

## What's Included

- **CLAUDE.md** -- Instructions Claude follows automatically (coding style, commit format, workflow)
- **Slash commands** -- `/brain-dump`, `/start-bead`, `/plan`, `/tdd`, `/checkpoint`, `/complete-bead`, `/code-review`, `/status`
- **Beads issue tracking** -- Git-backed task tracking that persists across Claude Code sessions
- **Hooks** -- Automated guardrails that enforce issue tracking before code changes
- **Rules** -- Agent behavior, coding style, security, and testing standards in `.claude/rules/`
- **OpenSpec** -- Lightweight feature specification workflow in `openspec/`
- **Doc templates** -- `SPEC.md` and `DECISIONS.md` for project specs and architecture decisions

## Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (`npm install -g @anthropic-ai/claude-code`)
- [Beads](https://github.com/anthropics/beads) (`brew install beads` or `go install github.com/anthropics/beads/cmd/bd@latest`)

## Quick Start

### 1. Create your project

```bash
./setup.sh my-project
cd ~/my-project
```

This copies the template, initializes git, and sets up beads tracking.

### 2. Start Claude Code and describe your idea

```bash
claude
> /brain-dump
```

The `/brain-dump` command walks you through describing your project. Claude will populate `openspec/project.md`, create feature specs, fill out docs, and create beads issues for each piece of work.

### 3. Start building

```bash
> /start-bead
```

Claude picks up an issue, marks it in-progress, and starts working. When you're done:

```bash
> /complete-bead
```

This runs tests, commits, closes the issue, and syncs.

## Project Structure

```
CLAUDE.md               # Agent instructions (auto-loaded by Claude Code)
GETTING-STARTED.md      # Detailed setup and workflow reference
docs/
  SPEC.md               # Project specification (fill in or use /brain-dump)
  DECISIONS.md           # Architecture decision log
openspec/
  project.md            # Project context (identity, stack, constraints)
  specs/                # Feature specifications
  changes/              # Change proposals for existing features
.claude/
  commands/             # Slash commands (/start-bead, /tdd, etc.)
  rules/                # Auto-loaded rules (behavior, style, security, testing)
  hooks.json            # Automated hooks (beads enforcement, console.log warnings)
src/                    # Source code
tests/                  # Test files (mirrors src/ structure)
infrastructure/         # Deployment configs
.env.example            # Environment variable template
```

## Slash Commands

| Command | What it does |
|---------|-------------|
| `/brain-dump` | Turn an unstructured idea into specs, docs, and issues |
| `/start-bead` | Pick or create a beads issue and start work |
| `/complete-bead` | Run tests, commit, close the issue, sync |
| `/checkpoint` | Stage, commit, and sync current progress |
| `/plan` | Design an approach and wait for your approval before coding |
| `/tdd` | Test-driven development cycle (red/green/refactor) |
| `/code-review` | Security and quality review of recent changes |
| `/status` | Show issues, git state, and ready tasks |

## Workflow

The template enforces a simple loop:

1. **Pick work** -- `bd ready` shows unblocked issues, or create one with `bd create`
2. **Start** -- `bd update <id> --status in_progress`
3. **Build** -- Write code with Claude. Commit frequently with `(bd-xxx)` in the message.
4. **Finish** -- `bd close <id>`, run tests, `bd sync`, `git push`

Hooks automatically warn you if you try to edit code or commit without an active issue.

## Customising the Template

After running `setup.sh`, make it yours:

- **CLAUDE.md** -- Update the project overview, stack, and commands sections
- **docs/SPEC.md** -- Fill in your project specification (or let `/brain-dump` do it)
- **openspec/project.md** -- Set your project identity, tech stack, and constraints
- **.claude/rules/** -- Adjust coding style, security, or testing rules to match your preferences
- **.env.example** -- Add your project's environment variables

## Manual Setup

If you prefer not to use `setup.sh`:

```bash
cp -r project-template my-project
cd my-project
rm -rf .git .beads setup.sh
git init
bd init && bd hooks install
cp .env.example .env
```

## License

[Your License Here]
