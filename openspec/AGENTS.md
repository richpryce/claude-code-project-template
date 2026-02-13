# OpenSpec Workflow

## For AI Agents

1. Check `openspec/specs/` for existing specs before implementing
2. Read specs thoroughly — follow requirements exactly
3. Ask about ambiguities, don't assume
4. Update specs with implementation decisions after building

## Creating a Spec

Save to `openspec/specs/[feature].md`:

```markdown
# [Feature Name]

## Status: Draft | Review | Approved | Implemented

## Overview
[2-3 sentences]

## Requirements
- [ ] FR1: [Requirement with acceptance criteria]

## Design
[Data model, API, components]

## Test Cases
- [ ] [Test description]

## Open Questions
- [ ] [Unresolved question]
```

## Change Proposals

Save to `openspec/changes/[change].md` for modifications to existing features.
Include: motivation, affected specs, changes, migration plan, rollback plan.

## Integration with Beads

```bash
bd create "spec: create auth specification" -p 2 --json
# Create spec, get review
bd close <id> --reason "Completed" --json

bd create "feat: implement auth per spec" -p 1 --json
# Implement from spec
bd close <id> --reason "Completed" --json
```
