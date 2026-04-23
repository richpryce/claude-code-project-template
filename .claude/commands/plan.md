# Plan

Create an implementation plan before writing any code.

## Instructions

### 1. Locate the spec

Check for OpenSpec artifacts in priority order:
```bash
ls openspec/changes/    # preferred for active change work
ls openspec/specs/      # fallback for simpler features
```

- **If `openspec/changes/<change-id>/` exists**: read the proposal and acceptance criteria from there.
- **If `openspec/specs/<feature>.md` exists**: read the spec from there.
- **If NEITHER exists**: STOP. Do not proceed with planning or coding.
  - Tell the user: "No OpenSpec artifact found. Run `/brain-dump` to create one first, or create a spec manually at `openspec/specs/<feature>.md` with acceptance criteria before planning."
  - Do not generate a plan based on `docs/SPEC.md` alone — that file is a summary, not a spec.

### 2. Restate requirements from the spec

Summarize:
- Goal (what success looks like)
- Acceptance criteria (verbatim from spec)
- Explicit non-goals
- Open questions that must be resolved before coding starts

### 3. Produce a phased plan

Each phase must include verification and a checkpoint gate:
```
Phase 1: [Name]
- Task -> verify: [how to check]
- Checkpoint gate -> user approves before Phase 2
```

Include mandatory sections:
- **Assumptions** — what you're taking as true
- **Risks** — with mitigations
- **Testing strategy** — outside-in order: acceptance/E2E first, integration next, unit for complex logic

### 4. WAIT FOR CONFIRMATION

Do NOT write code until the user explicitly approves the plan.

After approval:
1. `/start-bead`
2. Implement phase by phase
3. `/checkpoint` at each phase gate (human review)
4. `/complete-bead` when done
