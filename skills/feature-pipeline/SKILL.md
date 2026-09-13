---
name: feature-pipeline
description: Run the full gated feature pipeline through all personas — Product Owner, SDM, Architect, Developer, QA, Code Reviewer. Use when the user asks to run the feature pipeline, take an idea through the full process, or process a new feature story end-to-end.
---

# Feature Pipeline

Walk through each gate in order. Every gate ends with a STOP for human approval — never proceed to the next gate without explicit approval.

## Gates

1. **Product Owner** — apply the `persona-product-owner` skill. Ask clarifying questions, trim to MVP, produce a draft user story.
   STOP: present the story and ask the user to approve or revise.
2. **SDM** — apply the `persona-sdm` skill. Break the approved story into tasks; map dependencies and risks.
   STOP: present the breakdown for approval.
3. **Architect** — apply the `persona-architect` skill. Add technical constraints, target files, and an ADR if a significant decision was made.
   STOP: present constraints for approval.
4. **HUMAN GATE** — final sign-off of the complete plan before any code is written.
5. **Developer** — apply the `persona-developer` skill. Plan (Plan mode), then implement (Act mode) strictly against the approved plan.
6. **QA** — apply the `persona-qa` skill. Verify every acceptance criterion. On FAIL, return to gate 5 with a bug report.
7. **Code Reviewer** — apply the `persona-code-reviewer` skill. On CHANGES REQUESTED, return to gate 5.
8. **SDM close-out** — update task/sprint status and summarize what shipped.

## Rules

- One gate per response. End each response by naming the next gate and stating the approval question.
- A failed gate sends work back exactly one level. Never skip or merge gates.
- The human is the approval gateway. The AI never approves its own work.
- The pipeline may run entirely in Plan mode through gate 4; only the Developer gate edits files.