# Brain Dump

Turn an unstructured project brain dump into an execution-ready brief with minimal back-and-forth.

## Instructions

### Step 0: Ensure tracking/spec tooling exists

If `.beads/` is missing:
```bash
bd init
bd hooks install
```

If OpenSpec is installed, ensure instructions are current:
```bash
openspec update
```

### Step 1: Parse the dump into a structured brief

Ask clarifying questions to resolve:
- Open questions that block coding
- Ambiguous scope (what is explicitly out of scope?)
- Key technical decisions with rationale

Then populate:
- `docs/SPEC.md` — high-level goals, scope, non-goals, success criteria, assumptions, risks, checkpoint plan (human approval gates)
- `docs/DECISIONS.md` — key technical decisions + rationale
- `CLAUDE.md` — stack-specific commands/structure (update placeholders)
- `README.md` — project quick start and purpose

`docs/SPEC.md` is a human-readable summary. It is NOT the authoritative spec for implementation — that lives in `openspec/`.

### Step 2: Create OpenSpec artifacts (REQUIRED — primary spec source)

This step is mandatory, not optional. OpenSpec artifacts under `openspec/` are the authoritative source of truth for implementation work.

For each significant feature or change:
- **Preferred:** create a change artifact under `openspec/changes/<change-id>/` (proposal, tasks, spec deltas)
- **Simpler/legacy mode:** create/update `openspec/specs/<feature>.md`

Every artifact MUST include:
- Explicit acceptance criteria (testable, unambiguous)
- Open questions / assumptions
- Risks and mitigations

Do NOT create beads issues that have no corresponding OpenSpec artifact. The spec comes before the task queue.

### Step 3: Create Beads execution queue

Create beads issues linked to spec/change artifacts:
```bash
bd create "feat: [feature] (spec: openspec/...)" -p N --json
```

Add dependencies where needed:
```bash
bd dep add <id> --blocked-by <other-id>
```

Store traceability in notes (mandatory):
```bash
bd update <id> --notes "Spec source: openspec/..."
```

### Step 4: Build checkpointed execution plan

Output phases with:
- objective
- outside-in tests to write first (acceptance/E2E -> integration -> unit)
- completion evidence
- checkpoint gate (requires human approval before next phase)

### Step 5: Summarize and handoff

Summarize:
- Generated OpenSpec artifacts (list paths)
- Generated beads issues (list IDs and titles)
- Unresolved blockers / open questions
- First recommended bead to start

Then suggest:
```bash
bd ready --json
/start-bead
```
