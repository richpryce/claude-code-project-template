# CLAUDE.md

## Project Overview

**What:** [Brief description]
**Stack:** [e.g., TypeScript, React, Node.js, PostgreSQL]
**Status:** [Active development | Maintenance]

## Commands

```
npm run dev          # Dev server
npm run build        # Production build
npm test             # Run tests
npm run lint         # Lint
```

## Structure

```
src/
  components/     # UI components
  services/       # Business logic
  utils/          # Pure utilities
  types/          # Type definitions
  config/         # Configuration
tests/            # Mirrors src/ structure
docs/             # SPEC.md, DECISIONS.md
openspec/specs/   # Feature specifications
```

## Naming

- **Files:** kebab-case (`user-service.ts`)
- **Classes/Types:** PascalCase (`UserService`)
- **Functions/Vars:** camelCase (`getUserById`)
- **Constants:** SCREAMING_SNAKE (`MAX_RETRY_COUNT`)
- **Booleans:** is/has/should prefix

## Beads — MANDATORY (enforced by hooks)

**STOP. Do not write or edit code without an active beads issue.**

### Before ANY code change

1. Run `bd list` to see current issues
2. If no in-progress issue exists:
   - Pick one: `bd ready` (shows unblocked issues)
   - Or create one: `bd create "description" -p <priority> --json`
3. Mark it active: `bd update <id> --status in_progress`

### During work

- Commit with issue ID: `git commit -m "description (bd-xxx)"`
- Sync periodically: `bd sync`

### When done

1. Close the issue: `bd close <id> --reason "Completed" --json`
2. Sync: `bd sync`
3. Run tests before finishing

### Critical rules

- NEVER use `bd edit` (interactive — agents cannot use it)
- Use `bd update <id> --title/--description/--notes` instead
- Always use `--json` flag when creating/querying for structured output
- Run `bd sync` after making issue changes
- Include issue ID `(bd-xxx)` in commit messages

Types: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`

## Git

Commit format: `type(scope): description (bd-xxx)`
Branch naming: `feature/*`, `fix/*` from `main`

## Do Not Modify

- `package-lock.json` manually
- `.env` files
- `infrastructure/` without explicit request

## Always

- Run tests before marking work complete
- Update `docs/DECISIONS.md` for architectural changes
- Run `bd sync` before ending a session

## Context Files

- `docs/SPEC.md` - Project specification
- `docs/DECISIONS.md` - Architecture decisions
- `openspec/specs/` - Feature specifications
