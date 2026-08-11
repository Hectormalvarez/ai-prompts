# AI-Assisted Development Organization

This directory contains the system prompts, workflows, and templates that define the AI personas assisting in this project's development lifecycle. 

## Core Design Principles

1. **Personas are Lenses, Not Agents:** Personas are invoked manually by the human developer at specific stages of the workflow. They do not operate autonomously.
2. **Sequential Interaction:** The AI organization operates in a pipeline. An output from one persona serves as the input for the next, with the human developer acting as the approval gateway in the center.
3. **Strict Constraints:** Each persona has a tightly scoped role. Personas must not step outside their defined responsibilities (e.g., the Product Owner does not write code; the Architect does not invent features).
4. **Productive Friction:** Personas are designed to challenge assumptions. Quality Assurance and Code Review are separate from Implementation to prevent the AI from validating its own mistakes.

## Directory Structure

* `/personas/` - System prompts defining the role, constraints, and outputs for each AI worker.
* `/workflows/` - Standard operating procedures mapping out which personas to invoke for different types of tasks (e.g., bug fixes vs. epic features).
* `/templates/` - Standardized markdown structures (ADRs, user stories, sprint plans) that personas must use when generating output.

## The Pipeline

**Idea** → `Product Owner` → `SDM` → `Architect` → **HUMAN APPROVAL** → `Developer` (Cline) → `QA` → `Code Reviewer` → `SDM` → **Done**