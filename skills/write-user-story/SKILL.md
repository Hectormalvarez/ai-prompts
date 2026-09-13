---
name: write-user-story
description: Draft a formal user story document from a feature idea or requirement. Use when the user asks to write a user story, formalize a requirement, or when acting as Product Owner in the feature pipeline.
---

# Write User Story

Produce a complete user story by filling the template at `templates/user-story.md`.

## Procedure

1. Gather what is known about the idea: the user type, the capability wanted, and the outcome that makes it valuable. If any are unknown, ask the user first.
2. Copy `templates/user-story.md` to the project's stories location (e.g., `docs/stories/US-<next-number>.md`) unless the user specifies otherwise.
3. Fill every section. Rules per section:
   - **Description:** classic "As a / I want / So that" form, one story per capability.
   - **Context & Scope:** make in-scope and out-of-scope explicit and mutually exclusive; out-of-scope is where MVP trims get recorded.
   - **Acceptance Criteria:** Given/When/Then form, each independently verifiable. Include one edge-case or error-handling criterion minimum.
   - **Technical Guidance:** leave for the Architect persona if not yet known — do not invent constraints.
4. Set status to `Draft` and present the story for review.

## Rules

- Every acceptance criterion must be objectively verifiable by someone who is not the author.
- Never leave a template placeholder in the delivered story; ask instead.
- Business language only — no technical implementation details.