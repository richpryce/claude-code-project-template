# Start Bead

Start a new tracked task with Beads.

## Instructions

1. Check for in-progress issues:
   ```bash
   bd list --json
   ```
   If an issue is already in-progress, ask the user whether to continue on it or start fresh.

2. Check for ready issues:
   ```bash
   bd ready --json
   ```
   If ready issues exist, show them and ask whether to pick one or create new.

3. If creating new — ask for description, then:
   ```bash
   bd create "[user's description]" -p [priority] --json
   bd update [id] --status in_progress
   ```

4. Check `openspec/specs/` for a spec related to this issue. If one exists, read it and confirm the requirements with the user. If none exists, suggest creating one before implementation.

5. Confirm the active issue and suggest reading relevant files.

NEVER use `bd edit`. Use `bd update <id> --flags` for modifications.
