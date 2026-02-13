# Status

Show project and task status.

## Instructions

Run these in parallel and summarize:

```bash
bd list --json
git status --short
git branch --show-current
git log --oneline -5
bd ready --json
```

Display: active issues, git branch, uncommitted changes, recent commits, and ready tasks.
