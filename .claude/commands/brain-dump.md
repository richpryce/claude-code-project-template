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

### Step 2: Populate project context

Process the brain dump and populate these files:
- `openspec/project.md` — Project identity, tech stack, users, phase, constraints
- `docs/SPEC.md` — Requirements, scope, success criteria
- `docs/DECISIONS.md` — Technology choices as ADRs
- `CLAUDE.md` — Update commands/structure for chosen stack
- `README.md` — Project name, quick start, structure

### Step 3: Create feature specs

For each distinct feature identified in the brain dump, create a spec file at `openspec/specs/[feature-name].md` using this structure:

```markdown
# [Feature Name]

## Status: Draft

## Overview
[2-3 sentences]

## Requirements
- [ ] FR1: [Requirement with acceptance criteria]

## Design
[Data model, API endpoints, components — fill in what's known, mark unknowns]

## Test Cases
- [ ] [Test description]

## Open Questions
- [ ] [Unresolved question]
```

Every feature gets a spec — even simple ones. This is the source of truth that agents reference during implementation. Mark `Status: Draft` until reviewed.

### Step 4: Create beads issues from specs

For each spec in `openspec/specs/`, create a beads issue that references it:
```bash
bd create "chore: project scaffolding" -p 1 --json
bd create "feat: [feature] per openspec/specs/[feature].md" -p N --json
bd create "feat: [feature] per openspec/specs/[feature].md" -p N --json
```
Set up dependencies where features depend on each other:
```bash
bd dep add <id> --blocked-by <other-id>
```

### Step 5: Summarize

Summarize what was populated, flag open questions, and list the created specs and issues.
Suggest the user start with: `bd ready --json` to pick their first task.
