# Brain Dump

Process an unstructured project brain dump into structured documentation.

## Instructions

### Step 0: Ensure beads is initialized

Check if `.beads/` directory exists. If not:
```bash
bd init
bd hooks install
```
Tell the user beads has been initialized for task tracking.

### Step 1: Gather the brain dump

If the user hasn't shared yet, prompt them to share thoughts on:
- What they're building, tech preferences, target users
- Must-haves vs nice-to-haves, constraints, open questions

### Step 2: Populate project docs

Process the brain dump and populate these files:
- `docs/SPEC.md` — Requirements, scope, success criteria
- `docs/DECISIONS.md` — Technology choices as ADRs
- `openspec/project.md` — Project identity, users, phase
- `CLAUDE.md` — Update commands/structure for chosen stack
- `README.md` — Project name, quick start, structure

For complex features, create stub specs in `openspec/specs/`.

### Step 3: Create beads issues from the spec

Review `docs/SPEC.md` and suggest beads issues for each feature/task:
```bash
bd create "chore: project scaffolding" -p 1 --json
bd create "feat: [feature from spec]" -p N --json
bd create "feat: [feature from spec]" -p N --json
```
Set up dependencies where features depend on each other:
```bash
bd dep add <id> --blocked-by <other-id>
```

### Step 4: Summarize

Summarize what was populated, flag open questions, and list the created issues.
Suggest the user start with: `bd ready --json` to pick their first task.
