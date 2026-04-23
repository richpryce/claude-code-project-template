# Getting Started

## Prerequisites

```bash
# Claude Code (native installer)
curl -fsSL https://claude.ai/install.sh | bash

# Beads (task tracking)
npm install -g @beads/bd
# or: brew install beads

# OpenSpec
npm install -g @fission-ai/openspec@latest
```

## Setup

### From template (recommended)

```bash
./setup.sh my-project-name
cd my-project-name
```

`setup.sh` copies the template, removes the old `.beads/` database, runs `bd init` and `bd hooks install` to create a clean fresh database, and initializes git.

### Verify clean state after setup

After `setup.sh` (or after any `git clone` / copy of an existing project), verify the beads database is clean before starting work:

```bash
bd list --json      # should return empty or only expected issues
bd ready --json     # should return only issues you intend to work on
```

If you see unexpected issues (e.g. leftover issues from a previous project), your `.beads/` was not reset. Fix it:

```bash
rm -rf .beads
bd init
bd hooks install
```

Do NOT trust `.beads.bak` or backup files — delete them along with `.beads/` when resetting.

### Manual setup

```bash
cp -r project-template my-project-name
cd my-project-name
rm -rf .git .beads
git init
bd init
bd hooks install          # Auto-syncs JSONL on commit/pull
cp .env.example .env      # Edit with your values
```

---

## The Spec-First Workflow

OpenSpec artifacts in `openspec/` are the **authoritative source of truth** for what to build. Beads issues are the execution queue derived from those specs. `docs/SPEC.md` is a human-readable summary, not the spec itself.

The correct order is:

```
1. Spec (openspec/specs/ or openspec/changes/)
2. Beads issues linked to spec artifacts
3. Code implementation
```

If you find yourself creating beads issues or writing code without a corresponding OpenSpec artifact, stop and create the spec first.

---

## Session Start: Daily Workflow

```
1. CHECK      bd list --json / bd ready --json
2. SPEC       ls openspec/changes/ openspec/specs/  (must exist before step 3)
3. START      bd update <id> --status in_progress
              bd update <id> --notes "Spec source: openspec/..."
4. WORK       claude  (AI-assisted development)
5. CHECKPOINT git add [files] && git commit -m "type(scope): msg (bd-xxx)"
              git push && bd sync
6. TEST       npm test
7. FINISH     bd close <id> --reason "Completed" --json
              bd sync && git push
```

---

## Slash Commands (in Claude Code)

| Command | Purpose |
|---------|---------|
| `/brain-dump` | Turn unstructured ideas into OpenSpec artifacts, docs, and beads issues |
| `/start-bead` | Create/pick a beads issue (gates on existing OpenSpec artifact for non-trivial work) |
| `/complete-bead` | Run tests, verify spec linkage, commit, close issue, sync, push |
| `/checkpoint` | Stage, commit, push, sync current progress |
| `/status` | Show beads state, git state, OpenSpec artifacts, and spec linkage |
| `/plan` | Plan before implementing — requires spec artifact; waits for approval |
| `/tdd` | Test-driven development cycle |
| `/code-review` | Security and quality review |

### Brain dump: what it creates

`/brain-dump` produces:
1. **OpenSpec artifacts** (primary): `openspec/changes/<id>/` or `openspec/specs/<feature>.md` — these are the authoritative spec
2. **Docs summary** (secondary): `docs/SPEC.md`, `docs/DECISIONS.md`, updated `CLAUDE.md` and `README.md`
3. **Beads issues**: linked to spec artifacts with `Spec source:` notes

---

## Beads Commands Reference

| Command | Purpose |
|---------|---------|
| `bd create "msg" -p N --json` | Create issue (priority 1-4) |
| `bd update <id> --status in_progress` | Mark issue active |
| `bd close <id> --reason "msg" --json` | Close issue |
| `bd list --json` | List all issues |
| `bd ready --json` | Show unblocked issues |
| `bd sync` | Sync database with git |
| `bd update <id> --notes "msg"` | Add notes to issue |
| `bd show <id> --json` | Show issue details |

**Never use `bd edit`** — it opens an interactive editor. Use `bd update` with flags instead.

---

## Token Efficiency Tips

- Reference files by path: `src/services/auth.ts:45-60`
- Small, focused requests — one thing at a time
- Break large tasks into steps
- Use `@file` syntax in Claude Code to reference files

---

## Documentation

- `CLAUDE.md` — Agent instructions (auto-loaded)
- `docs/SPEC.md` — Human-readable project summary (not the implementation spec)
- `docs/DECISIONS.md` — Architecture decisions
- `openspec/specs/` — Feature specifications (authoritative)
- `openspec/changes/` — Change proposals (authoritative for active changes)
- `openspec/AGENTS.md` — How AI agents should work with OpenSpec + Beads
