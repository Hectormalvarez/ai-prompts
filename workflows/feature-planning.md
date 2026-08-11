# Workflow: Feature Planning Pipeline

## Purpose

This workflow defines the standard operating procedure for taking a raw idea or request and turning it into an approved, actionable sprint plan. Use this workflow for new features, non-trivial modifications, or significant system architecture changes.

## Pipeline Overview

`Human Prompt` → **Product Owner** → **SDM** → **Architect** → **HUMAN APPROVAL**

---

## Step-by-Step Execution

### Step 1: Discovery (Product Owner)

* **Trigger:** You have a feature idea or high-level project goal.
* **Action:** Invoke `ai/personas/product-owner.md`.
* **Input:** Raw concept, feature request, or problem statement.
* **Output:** Drafted User Story using `ai/templates/user-story.md` (or Epic using `ai/templates/epic.md`), including problem statement, target user, and high-level acceptance criteria.

### Step 2: Sprint Breakdown & Risk Assessment (SDM)

* **Trigger:** User stories created by the Product Owner.
* **Action:** Invoke `ai/personas/sdm.md`.
* **Input:** Drafted user stories, `tasks/backlog.md`, and current `tasks/sprint.md`.
* **Output:** Detailed acceptance criteria refinement, dependency mapping, task breakdown, and proposed sprint update.

### Step 3: Technical Constraints & Validation (Architect)

* **Trigger:** Proposed sprint tasks and user stories from the SDM.
* **Action:** Invoke `ai/personas/architect.md`.
* **Input:** Proposed user stories, `docs/ARCHITECTURE.md`, and current stack context.
* **Output:** Architectural constraints, file boundaries, technology validation, and ADR draft (`ai/templates/adr.md`) if architectural patterns are changing.

### Step 4: Human Gatekeeper Approval

* **Trigger:** Complete plan with business requirements, task breakdown, and architectural guidelines.
* **Action:** You review the proposed stories and technical plan.
* **Decision:**
  * **Approved:** Move stories to active sprint (`tasks/sprint.md`) and hand off to the Developer persona.
  * **Changes Requested:** Loop back to PO, SDM, or Architect with specific feedback.
