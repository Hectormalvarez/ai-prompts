# Execution Discipline

Applies to every task. Rationale: prevents wasted context, unauthorized changes, and unverifiable completions.

## Mode Separation

- In **Plan mode**, analyze with read-only tools and produce a numbered implementation plan before proposing any edit.
- In **Act mode**, execute strictly against the approved plan. If reality diverges from the plan, stop and return to Plan mode.
- Small tasks with an obvious solution may skip planning; never skip verification.

## Determinism

- Execute exactly one tool call per turn and read its feedback before proceeding. Never assume success.
- After any file edit, re-read the changed region before building on it.

## Context Hygiene

- Use explicit context anchors (`@file`, `@problems`, `@terminal`, `@git`) instead of open-ended repository searches.
- When exploration is needed, search with narrow patterns and list specific directories, not the whole tree.
- For broad multi-area investigation, use subagents instead of burning the main context window.