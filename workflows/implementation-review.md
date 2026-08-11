# Workflow: Implementation & Quality Pipeline

## Purpose

This workflow defines the operational loop for executing approved user stories, verifying functionality, and ensuring engineering quality. Use this workflow when building features that have already passed through the Feature Planning pipeline.

## Pipeline Overview

**Approved Task** → **Developer (Cline)** → **QA Engineer** → **Code Reviewer** → **SDM** → **Done**

---

## Step-by-Step Execution

### Step 1: Execution (Developer / Cline)

* **Trigger:** An approved User Story from `tasks/sprint.md`.
* **Action:** Invoke `ai/personas/developer.md`.
* **Input:** Story specifications (`ai/templates/user-story.md`), acceptance criteria, and architectural constraints.
* **Execution Protocols:**
  * Use **Plan Mode** first to generate a step-by-step modification plan.
  * Switch to **Act Mode** to execute file changes using mode-appropriate edit rules (`write_to_file` vs `replace_in_file`).
  * Run project tests/build commands before finishing.
* **Output:** Working code changes, passing automated tests, and an execution summary.

### Step 2: Functional Verification (QA Engineer)

* **Trigger:** Developer completes execution and marks task ready for review.
* **Action:** Invoke `ai/personas/qa.md`.
* **Input:** User story acceptance criteria, developer output summary, and test results.
* **Output:** QA Assessment Report (PASS / FAIL per criterion).
  * If **FAIL**: Generate bug report using `ai/templates/bug.md` and send back to Developer.
  * If **PASS**: Pass output to Code Reviewer.

### Step 3: Engineering Standards Review (Code Reviewer)

* **Trigger:** QA Engineer issues a PASS status.
* **Action:** Invoke `ai/personas/code-reviewer.md`.
* **Input:** Git diffs, modified files, and codebase style guidelines.
* **Output:** Review verdict (APPROVED / CHANGES REQUESTED) covering code cleanliness, security, and maintainability.
  * If **CHANGES REQUESTED**: Return feedback to Developer to resolve blockers.
  * If **APPROVED**: Advance task to final tracking.

### Step 4: Sprint Reconciliation (SDM)

* **Trigger:** QA and Code Review approval.
* **Action:** Invoke `ai/personas/sdm.md`.
* **Input:** Approved story and review logs.
* **Output:** Update `tasks/sprint.md` status to "Done" and select the next task.
