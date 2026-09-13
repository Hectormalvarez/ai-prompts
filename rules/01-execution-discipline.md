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
- Delegate broad, read-only, multi-area investigation (repo audits, cross-cutting scans, summarizing large docs) to subagents — especially when it would mean reading many files into the main context.
- Subagents see nothing from this session: brief them self-contained — name the files/paths, state the exact scope, and specify what to return.
- Never delegate edits, iterative work, or anything depending on session state. Subagent results are reports; any changes they propose are applied and verified in the main thread.