# Complete Bead

Finish the current task, run quality gates, and close the beads issue.

## Instructions

### 1. Find the in-progress issue

```bash
bd list --json
```

If none: suggest `/start-bead`. Do not proceed without an active issue.

### 2. Verify spec linkage

Check the bead's notes for a `Spec source:` entry. If it's missing:
- Add it now: `bd update <id> --notes "Spec source: openspec/..."`
- If no spec exists for this work, flag it: "WARNING: this bead has no linked OpenSpec artifact. Consider backfilling one in `openspec/specs/` for traceability."

### 3. Run quality gates (adapt to project stack)

```bash
npm test
npm run lint
npm run typecheck
```

If `typecheck` does not exist, continue without failing on that step.

### 4. Confirm outside-in evidence is present

- Acceptance/E2E or contract tests covering user-visible behavior
- Integration/unit coverage for critical logic

If evidence is missing for non-trivial work, do NOT close the issue — show what's missing.

### 5. Review uncommitted changes

```bash
git status
git diff --stat
```

### 6. If checks pass — commit, close, sync, push

Stage specific files (NOT `git add -A`):
```bash
git add [specific files]
git commit -m "type(scope): description (bd-xxx)"
bd close [id] --reason "Completed" --json
bd list --json --all
git push
```

### 7. If checks fail

Show failures. Fix or propose fixes. Do NOT close the issue.

## Human-in-the-loop

Before closing, provide a concise checkpoint summary:
- What changed
- Test evidence (pass/fail counts, coverage if available)
- Spec linkage confirmed or flagged
- Any risks or follow-up issues

Wait for user approval if this is a phase boundary.

## Forbidden

NEVER use `git add -A` (may stage secrets or unintended files). Stage specific files by name.
NEVER close a bead when tests are failing.
