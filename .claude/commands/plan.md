# Plan

Create an implementation plan before writing any code.

## Instructions

1. **Restate requirements** — check `openspec/specs/` for a relevant spec first. If one exists, use it as the source of truth. If not, clarify the user's request in specific terms. Ask if ambiguous.

2. **Break into phases** with concrete tasks and verification steps:
   ```
   Phase 1: [Name]
   - Task -> verify: [how to check]
   ```

3. **Identify dependencies** — external services, libraries, DB changes, APIs.

4. **Assess risks** — CRITICAL/HIGH/MEDIUM/LOW with mitigations.

5. **WAIT FOR CONFIRMATION** — Do NOT write code until the user explicitly approves.

After approval:
1. `/start-bead` to create a tracked issue
2. Implement phase by phase
3. `/checkpoint` between phases
4. `/complete-bead` when done
