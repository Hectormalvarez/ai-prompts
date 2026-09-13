# Done-ness and Scope

Rationale: protects the human approval gate and prevents scope creep.

## Scope

- Implement only what was requested. Never add unrequested features, refactors, or "improvements".
- If a requested change requires touching files outside its stated scope, stop and ask first.
- New dependencies require explicit approval.

## Ambiguity

- If requirements, contracts, or acceptance criteria are unclear, stop and ask. Do not guess.
- Surface conflicts between instructions, rules, and the actual codebase instead of silently picking one.

## Verification Before Completion

- Run the project's build and test commands non-interactively before claiming completion.
- Confirm compiler diagnostics and tests are clean; report any known remaining issues explicitly.
- Do not self-approve: state what a reviewer or QA should verify next.