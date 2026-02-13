# TDD

Enforce test-driven development: write tests FIRST, then implement.

## Instructions

Follow the Red-Green-Refactor cycle:

1. **SCAFFOLD** — Define types/interfaces with `throw new Error('Not implemented')` stubs
2. **RED** — Write failing tests (happy path, edge cases, errors)
3. **RUN** — Verify tests FAIL (confirms they test something real)
4. **GREEN** — Write minimal code to make tests pass
5. **RUN** — Verify tests PASS
6. **REFACTOR** — Improve code while keeping tests green
7. **COVERAGE** — Check with `npm test -- --coverage`

Target: 80% minimum, 100% for financial/auth/security code.

Tests MUST fail before implementing. Do not skip step 3.
