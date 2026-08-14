# Workflow: Sprint Task to Cline Prompt Translation

## Objective
Translate sprint user stories and task tickets into highly deterministic, context-optimized prompts for the Cline AI coding agent[cite: 2]. This workflow prevents model drift, diff editing loops, and context window saturation while enforcing task batching and zero code bloat[cite: 2].

---

## Workflow Steps

### Step 1: Context Scoping & Anchor Selection (`developer`)
* **Goal:** Identify exact target files and scope constraints before prompting Cline[cite: 2].
* **Action:** Map the sprint task to specific repository paths and attach explicit reference anchors (`@file`, `@folder`, `@problems`) directly in the prompt rather than allowing open directory searches[cite: 2].
* **Gate:** Verify that all relevant files are explicitly linked to minimize context window overhead[cite: 2].

### Step 2: Verification-Bound Task Batching (`sdm` / `developer`)
* **Goal:** Group subtasks by a shared validation check[cite: 2].
* **Action:** Group all subtasks into a single prompt execution step that can be verified at once by running a single build or test command (`pytest`, `npm run build`)[cite: 2].
* **Gate:** Confirm the task batch does not contain unneeded setup scripts, unused helpers, or dead code.

### Step 3: Plan Mode Drafting (`architect` / `developer`)
* **Goal:** Establish a static, read-only implementation blueprint[cite: 2].
* **Action:** Initiate the task in Cline's **Plan Mode**[cite: 2]. Prompt the agent to use read-only tools (`read_file`, `search_files`) to analyze target code and generate a numbered, step-by-step execution plan[cite: 2].
* **Gate:** Confirm the plan contains zero speculative additions and requires surgical edits before approving transition to Act Mode[cite: 2].

### Step 4: Act Mode Execution (`developer`)
* **Goal:** Execute code modifications step-by-step[cite: 2].
* **Action:** Switch Cline to **Act Mode** to carry out the approved plan[cite: 2]. Enforce single tool executions per turn and ensure files under 200 lines use `write_to_file` while larger files use minimal 2–3 line `replace_in_file` SEARCH blocks[cite: 2].
* **Gate:** Verify each tool call succeeds before permitting the next step[cite: 2]. If a diff edit fails twice, enforce full file overwrite via `write_to_file`[cite: 2].

### Step 5: Verification & Compaction (`qa` / `developer`)
* **Goal:** Validate changes and maintain context hygiene[cite: 2].
* **Action:** Run non-interactive verification commands (`pytest`, `npm run build`, `cargo check`)[cite: 2]. Trigger `/compact` if conversation history or tool output buffers become saturated[cite: 2].
* **Gate:** Require a passing build/test output before calling `attempt_completion`[cite: 2].

---

## Execution Guardrails
* **Context Hygiene:** Avoid open-ended workspace searches[cite: 2]. Use explicit `@file` references to keep input token consumption minimal[cite: 2].
* **Zero Dead Code Policy:** Strictly forbid adding unused imports, `TODO` comments, speculative config options, or uncalled helper functions.
* **Diff Fallback Thresholds:** For files under 200 lines, default to `write_to_file`[cite: 2]. For larger files, enforce strict sequential SEARCH/REPLACE blocks with 2–3 surrounding lines of exact indentation[cite: 2].
* **Strict Mode Separation:** Never allow file edits while in Plan Mode[cite: 2]. Require explicit user approval to move from Plan Mode to Act Mode[cite: 2].

---

## Cline Prompt Template

```markdown
### TASK: [Sprint Ticket Key] - [Brief Summary]

**Context Anchors:**
- Active Files: @file:path/to/target_file.ext
- Diagnostics: @problems

**Batch Scope:**
- Grouped Subtasks: [List all subtasks verified together by the test command]
- Verification Command: `[e.g., pytest tests/test_feature.py or npm run build]`

**Objective:**
[1-2 sentences stating the exact functional change required]

**Plan Mode Instructions:**
1. Read the attached files using read-only tools (`read_file`, `search_files`)[cite: 2].
2. Provide a numbered execution plan for the grouped subtasks[cite: 2].
3. Do NOT make file modifications until moved to Act Mode[cite: 2].

**Act Mode Execution Rules:**
- Implement all grouped subtasks in a single pass up to the verification command[cite: 2].
- Output ZERO unused imports, helper functions, speculative configs, or commentary (`// TODO`).
- For files under 200 lines, use `write_to_file` directly[cite: 2].
- Run the verification command (`pytest`, `npm run build`) and pause for review[cite: 2].
