# Status

Show implementation status with spec ↔ task traceability.

## Instructions

Run these commands and summarize the results:

```bash
bd list --json
bd ready --json
git status --short
git branch --show-current
git log --oneline -5
ls openspec/changes/ 2>/dev/null || echo "(no changes/)"
ls openspec/specs/   2>/dev/null || echo "(no specs/)"
```

### Report the following

1. **Beads state**
   - Active (in_progress) bead(s): ID, title, spec reference in notes (or flag if missing)
   - Ready (unblocked) tasks: count and top priorities
   - Blocked tasks: count and what's blocking them

2. **Spec state**
   - OpenSpec changes: list artifacts in `openspec/changes/` (or "none")
   - OpenSpec specs: list artifacts in `openspec/specs/` (or "none")
   - Flag if active beads exist but have no spec linkage in their notes

3. **Git state**
   - Current branch
   - Uncommitted changes (files)
   - Last 5 commits

4. **Checkpoint readiness**
   - Next checkpoint gate and required evidence
   - Any blockers or open questions from current spec/change artifacts

### Spec linkage check

If any in-progress bead is missing a `Spec source:` entry in its notes, surface this as a warning:
> "WARNING: bead bd-XXX has no spec linkage. Update with: `bd update bd-XXX --notes 'Spec source: openspec/...'`"
