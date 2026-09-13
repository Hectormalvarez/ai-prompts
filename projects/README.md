# Per-Project Configuration

This directory holds Cline configuration that belongs to a *specific* project rather than globally. Global rules and skills (in the repo root) apply everywhere; the files here apply to one repository and can **override** global rules, since workspace rules take precedence over global rules in Cline.

## Pattern

Each project gets a subdirectory:

```text
projects/
└── my-project/
    ├── rules/              # per-project rules
    ├── skills/             # project-specific skills
    └── memory-bank/        # optional: project memory bank (created in the target repo)
```

## Wiring a project

1. **Rules** — author them here first (micro commits, one rule per commit), then copy the whole rules directory into the target repo and commit it there too:

   ```bash
   cp -r /home/hadev/Projects/Code/ai-prompts/projects/my-project/rules /path/to/my-project/.clinerules
   ```

   Rules are maintained in **both places**: canonical source here, committed copy in the target repo. When updating rules, change them here, then re-copy to the project and commit the update there. Project rules override globals on conflict.

2. **Skills** — either copy or symlink individual skills into `~/.cline/skills/` (global) or into the project's `.cline/skills/` (project-only).

3. **Memory bank (optional)** — the memory bank rule lives in the project's rules (committed as part of step 1); the generated `memory-bank/` files themselves live in the target repo. Ask Cline to "initialize memory bank". This gives Cline persistent project context across sessions. Best for long-lived repos where context is repeatedly rebuilt.

## Naming

Use the actual repository name as the directory name (`ai-prompts`, `my-api`, `portfolio-site`, ...). One directory per project, no shared or "misc" buckets.

## Authoring rules

- **Budget:** keep each rule file under ~50 lines. If a change would exceed it, move the detail into a doc the rule links to (ADR, runbook, `CONTRIBUTING.md`) and leave a pointer.
- **Point, don't paste:** a rule is an index into the repo (file names, `make` targets, ADR numbers) — never inline the content it references.
- **Audit periodically:** every always-on line is a per-task tax. Delete rules that haven't prevented a failure recently; don't encode what lint/CI already enforces mechanically.

## What belongs here vs. global

| Goes here (project)                        | Goes in repo root (global)           |
| ------------------------------------------ | ------------------------------------ |
| Language/framework coding standards        | Universal execution discipline       |
| Build/test command requirements            | File edit protocols                  |
| Path-conditional rules (`paths:` globs)    | Done-ness and scope guardrails       |
| Project-specific skills                    | Personas and pipeline skills         |
| Memory bank                                | Templates and role definitions       |