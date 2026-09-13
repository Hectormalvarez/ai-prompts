---
name: write-adr
description: Write an Architecture Decision Record documenting a significant technical decision. Use when a technology, framework, data model, or structural approach is chosen or changed, or when the persona-architect skill issues a significant decision.
---

# Write ADR

Record a significant technical decision using the template at `templates/adr.md`.

## Procedure

1. Confirm the decision is worth an ADR: it constrains future work, is expensive to reverse, or would surprise a new contributor. Trivial choices do not need ADRs.
2. Copy `templates/adr.md` to the project's decisions location (e.g., `docs/decisions/ADR-<next-number>.md`).
3. Fill every section:
   - **Context & Problem Statement:** the challenge and why a decision is needed now.
   - **Decision Drivers:** concrete factors (memory footprint, stack compatibility, testability).
   - **Considered Options:** at least two real alternatives, including the status quo if viable.
   - **Decision Outcome:** chosen option, rationale tied back to drivers, honest positive AND negative consequences.
   - **Technical Implementation Guidance:** specific constraints Developers must follow.
4. Set status to `Proposed` and present for human acceptance.

## Rules

- An ADR that lists no downside is a red flag — find the tradeoff.
- Never leave template placeholders in the delivered ADR.
- Do not modify an Accepted ADR; supersede it with a new one that references it.