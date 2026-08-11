# Workflow: Hotfix & Minor Fix Pipeline

## Purpose

A lightweight, fast-tracked workflow for urgent bug fixes, minor documentation updates, small styling tweaks, or typos. Bypasses broad planning phases to maintain efficiency without sacrificing basic code safety.

## Pipeline Overview

**Issue / Bug** → **Developer (Cline)** → **QA / Self-Verification** → **Done**

---

## Step-by-Step Execution

### Step 1: Scoped Problem Definition

* **Trigger:** A single bug, broken test, or minor tweak (e.g., CSS fix, typo, simple config change).
* **Action:** Create a brief bug record using `ai/templates/bug.md` or state the single issue explicitly in your prompt.

### Step 2: Targeted Implementation (Developer / Cline)

* **Trigger:** Explicit fix request.
* **Action:** Invoke `ai/personas/developer.md` with strict local scoping.
* **Constraints:**
  * Do not switch to Plan Mode unless the fix touches multiple files.
  * For small files (<200 lines), use direct file replacement.
  * Modify only the lines directly related to the issue.

### Step 3: Fast-Track Verification (QA)

* **Trigger:** Developer executes fix.
* **Action:** Run affected test suite or invoke `ai/personas/qa.md` targeting strictly the single bug criterion.
* **Completion:** Once verified, mark the issue resolved immediately.
