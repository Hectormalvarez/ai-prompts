# Workflow: Project Audit Pipeline

## Purpose

A periodic, high-level project health assessment executed every few sprints or at key milestones. Designed to prevent scope creep, track technical debt accumulation, and align repository documentation with active code reality.

## Pipeline Overview

**Milestone / Trigger** → **Project Auditor (Chief of Staff)** → **Human Executive Review**

---

## Step-by-Step Execution

### Step 1: Health Inspection (Project Auditor)

* **Trigger:** End of a major milestone, completion of 2–3 sprints, or noticeable technical drift.
* **Action:** Invoke `ai/personas/auditor.md`.
* **Input:** `docs/PROJECT.md`, `docs/ARCHITECTURE.md`, `docs/DECISIONS.md`, `tasks/backlog.md`, `tasks/sprint.md`, and recent git log history.
* **Output:** Comprehensive Project Health Assessment covering:
  * **Scope Control:** Identification of feature creep or unapproved work.
  * **Architecture & ADR Sync:** Discrepancies between code structure and written docs.
  * **Task & Backlog Health:** Stale issues, unlinked code changes, or orphaned tasks.
  * **Technical Debt Assessment:** Code smells or structural risks.

### Step 2: Executive Decision Gate

* **Trigger:** Auditor output generated.
* **Action:** Human review of Auditor findings.
* **Outcome:** Direct the SDM persona to create technical debt user stories (`ai/templates/user-story.md`), update documentation, or prune stale backlog items as needed.
