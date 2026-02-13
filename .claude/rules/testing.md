# Testing Rules

Code without tests is incomplete.

## Coverage Requirements

- General code: 80% minimum
- Business logic: 90% minimum
- Financial/payment and auth/security: 100%

## TDD Workflow (mandatory for new features)

1. **RED** — Write failing test first
2. **GREEN** — Write minimal code to pass
3. **REFACTOR** — Improve while keeping green
4. Repeat

Tests MUST fail before implementing. This verifies the test works.

## What to Test

- **Unit:** Happy path, edge cases (empty/null/max), error cases, boundary values
- **Integration:** Success (200/201), validation errors (400), auth errors (401/403), not found (404)
- **E2E:** Critical user flows only

## Rules

- Test behavior, not implementation
- One assertion focus per test
- Isolate tests — no shared mutable state
- No flaky tests (timing-dependent)
- Don't mock everything — prefer real dependencies
- Don't test private methods directly
- Run full suite before committing: `npm test`
