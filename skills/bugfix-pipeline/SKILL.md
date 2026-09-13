---
name: bugfix-pipeline
description: Run the gated bugfix pipeline — reproduce, diagnose, fix, verify, review. Use when the user asks to fix a bug through the structured process, or says "run the bugfix pipeline". Not for features or refactors.
---

# Bugfix Pipeline

Walk the gates in order. Every gate ends with a STOP for human approval.

## Gates

1. **QA (reproduce)** — apply the `persona-qa` skill. Reproduce the defect and document it with `persona-qa`'s bug template (`templates/bug.md`): reproducible steps, expected vs. actual, logs.
   STOP: confirm reproduction and severity with the user.
2. **Diagnose** — investigate root cause read-only. Use subagents for broad investigation in large codebases. Identify the failing component and why.
   STOP: present root-cause analysis and proposed fix scope for approval.
3. **Fix** — apply the `persona-developer` skill. Implement the minimal fix within the approved scope. Add a regression test that fails before the fix and passes after.
4. **Verify** — apply the `persona-qa` skill. Confirm the regression test passes, the original repro is resolved, and adjacent behavior is unaffected. On FAIL, return to gate 3.
5. **Code Review** — apply the `persona-code-reviewer` skill. On CHANGES REQUESTED, return to gate 3.
6. **Close-out** — mark the bug Verified, summarize the fix and the test that guards it.

## Rules

- One gate per response; always name the next gate and the approval question.
- Never fix before the root cause is diagnosed and approved.
- A fix without a regression test is not done.
- If diagnosis reveals the bug is actually a missing feature, STOP and route to the `feature-pipeline` skill.