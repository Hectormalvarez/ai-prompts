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

1. **Rules** — symlink this repo's project rules into the target repo:

   ```bash
   ln -sfn /home/hadev/Projects/Code/ai-prompts/projects/my-project/rules /path/to/my-project/.clinerules
   ```

   Because the target is a symlink, editing rules here updates the project instantly. Project rules override globals on conflict.

2. **Skills** — either symlink individual skills into `~/.cline/skills/` (global) or into the project's `.cline/skills/` (project-only):

   ```bash
   ln -sfn "$HOME/Projects/Code/ai-prompts/projects/my-project/skills/deploy-checklist" \
           "$HOME/.cline/skills/deploy-checklist"
   ```

3. **Memory bank (optional)** — copy `projects/_template/memory-bank-rule.md` into the project's `.clinerules/` (or merge it in), then ask Cline to "initialize memory bank". This gives Cline persistent project context across sessions. Best for long-lived repos where context is repeatedly rebuilt.

## Naming

Use the actual repository name as the directory name (`ai-prompts`, `my-api`, `portfolio-site`, ...). One directory per project, no shared or "misc" buckets.

## What belongs here vs. global

| Goes here (project)                        | Goes in repo root (global)           |
| ------------------------------------------ | ------------------------------------ |
| Language/framework coding standards        | Universal execution discipline       |
| Build/test command requirements            | File edit protocols                  |
| Path-conditional rules (`paths:` globs)    | Done-ness and scope guardrails       |
| Project-specific skills                    | Personas and pipeline skills         |
| Memory bank                                | Templates and role definitions       |