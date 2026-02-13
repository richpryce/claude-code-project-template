# Complete Bead

Finish the current task, run verification, and close the beads issue.

## Instructions

1. Find the in-progress issue:
   ```bash
   bd list --json
   ```
   If no issue is in-progress, inform the user and suggest `/start-bead`.

2. Run verification (adapt commands to project stack):
   ```bash
   npm test
   npm run lint
   ```

3. Review uncommitted changes:
   ```bash
   git status
   git diff --stat
   ```

4. If checks pass — stage specific changed files (NOT `git add -A`), commit with issue ID, close and sync:
   ```bash
   git add [specific files]
   git commit -m "type(scope): description (bd-xxx)"
   bd close [id] --reason "Completed" --json
   bd sync
   ```

5. If checks fail — show failures, offer to help fix. Do NOT close the issue.

NEVER use `git add -A` (may stage secrets). Stage specific files by name.
