# Start Bead

Start work with minimal manual intervention while preserving traceability.

## Instructions

### 1. Check current beads state

```bash
bd list --json
```

**If exactly one issue is `in_progress`**: continue it automatically (skip to step 4).

**If multiple issues are `in_progress`**: flag this as unexpected — only one should be active at a time. Ask the user which to continue.

### 2. If none are `in_progress`, find work

```bash
bd ready --json
```

- If ready issues exist: auto-pick the highest-priority unblocked issue.
- If no ready issues: see step 3 before creating anything new.

### 3. Gate on OpenSpec artifact (non-trivial work)

Before marking any issue in-progress — or creating a new one — verify a corresponding OpenSpec artifact exists:

```bash
ls openspec/changes/   # preferred for active change work
ls openspec/specs/     # fallback for simpler features
```

**If OpenSpec artifacts exist** for the work: proceed to step 4.

**If NO OpenSpec artifacts exist** (or the work is non-trivial with no spec):
- STOP. Do not create a bead and start coding.
- Tell the user: "No OpenSpec artifact found for this work. Run `/brain-dump` to create specs and a proper task queue first, or point me to an existing spec in `openspec/`."
- Exception: genuinely trivial work (typo fix, config tweak, single-line change) may proceed without a spec — state the reason explicitly.

### 4. Mark issue in-progress and link to spec

```bash
bd update <id> --status in_progress
```

Link the issue to its spec artifact:
```bash
bd update <id> --notes "Spec source: openspec/..."
```

If creating a new issue (for work that already has a spec):
```bash
bd create "feat: [feature] (spec: openspec/...)" -p [priority] --json
bd update <id> --status in_progress
bd update <id> --notes "Spec source: openspec/..."
```

### 5. Confirm scope and first checkpoint

State:
- Active bead ID and title
- Source spec artifact (path)
- Objective for this slice
- First checkpoint boundary (what must be shown before continuing)

## Human-in-the-loop rule

Proceed autonomously within the current slice, but pause at checkpoints for approval before the next phase.

## Forbidden

NEVER use `bd edit`. Use `bd update <id> --flags` for modifications.
