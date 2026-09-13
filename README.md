# ai-prompts — Cline Rules & Skills

Personal Cline configuration repository: global rules that are always active, plus on-demand skills (personas, pipelines, document writers) that load only when invoked.

## Architecture

Cline loads two kinds of configuration from this repo, and each is used for what it does best:

| Layer | Location | Loaded | What lives here |
| :--- | :--- | :--- | :--- |
| **Rules** | `~/.cline/rules` → `rules/` | Every task, always | Short, universal execution guardrails |
| **Skills** | `~/.cline/skills` → `skills/` | On demand (~100 tok metadata; body only when triggered) | Personas, pipelines, document writers |

### Design principles

1. **Personas are lenses, not agents.** Each persona skill is invoked manually (or via the pipeline) at a specific stage. None run autonomously.
2. **The human is the approval gateway.** Pipelines stop at every gate. The AI never approves its own work — QA and Code Review are separate from Implementation.
3. **Sequential interaction.** Each persona's output is the next persona's input.
4. **Rules stay terse.** Rules consume context on every task, so only universal, non-native-to-Cline guidance goes there. Project-specific conventions belong in each project's own `.clinerules/`.

## Install

```bash
./install.sh --dry-run   # preview
./install.sh             # link rules/ and skills/ into ~/.cline/
```

Existing real files/directories at the targets are backed up (never overwritten). After installing, reload Cline so it re-scans `~/.cline/`.

## Skills

### Personas (role lenses, invoked manually or by pipelines)

| Skill | Role | Bundled templates |
| :--- | :--- | :--- |
| `persona-product-owner` | Idea → MVP-scoped user story | — |
| `persona-sdm` | Stories → sprints, tasks, priorities | `templates/epic.md` |
| `persona-architect` | Technical decisions, constraints, ADRs | — (uses `write-adr`) |
| `persona-developer` | Implements approved stories | — |
| `persona-qa` | Adversarial verification vs. acceptance criteria | `templates/bug.md` |
| `persona-code-reviewer` | Maintainability, security, APPROVED/CHANGES verdicts | — |
| `persona-auditor` | Periodic project health audit (report-only) | — |

### Pipelines (gated multi-persona processes)

- `feature-pipeline` — PO → SDM → Architect → **human gate** → Developer → QA → Code Reviewer → close-out. Fails route back one level.
- `bugfix-pipeline` — reproduce → diagnose → fix (+ regression test) → verify → review. Never fix before diagnosing.

### Utilities

- `write-user-story` — fill the user-story template from an idea (`templates/user-story.md`)
- `write-adr` — record a significant technical decision (`templates/adr.md`)

Invoke any skill by its name as a slash command (e.g., `/feature-pipeline`) or let Cline auto-trigger it from the description.

## Rules

| Rule | Concern |
| :--- | :--- |
| `01-execution-discipline.md` | Plan/Act separation, one-action determinism, context hygiene |
| `02-edit-protocols.md` | Edit tool selection, SEARCH/REPLACE formatting, error recovery |
| `03-done-ness.md` | No scope creep, stop on ambiguity, verify before completion |
| `04-commit-discipline.md` | Micro commits, one concern per commit, Conventional Commits format |

## Per-project configuration

Project-specific rules, skills, and memory banks live under `projects/` — see [`projects/README.md`](projects/README.md). Project rules are symlinked into each repo's `.clinerules/` and **override** global rules on conflict.

## Adding to this repo

- New always-on behavior → a new file in `rules/` (one concern per file, terse, imperative).
- New repeatable process → a new skill: directory matching the skill name, `SKILL.md` with frontmatter (`name` must equal the directory name; `description` states *when to invoke*), optional `templates/`, `docs/`, `scripts/`.
- New project → a directory under `projects/` named after the repo.
