# Commit Discipline

Every completed unit of work becomes a commit. Rationale: small commits are reviewable, revertable, and bisectable; uncommitted verified work is a lost asset.

## Micro Commits

- Commit after each coherent, self-contained change — one concern per commit, not one task per commit.
- Never bundle unrelated edits into one commit; split them.
- Never leave verified work uncommitted at session end.
- Only stage files that belong to the change (`git status` first; never `git add -A` blindly).
- Run the relevant checks (build/lint/tests) before committing when feasible.

## Messages

- Conventional Commits: `type(scope): summary` — types: feat, fix, refactor, test, docs, chore, ci.
- Summary in imperative mood, ≤ 72 chars, no trailing period.
- Scope is the affected module or area (e.g. `feat(portfolio): ...`). Omit only when truly global.
- Optional body explains *why*; never narrate what the diff already shows.