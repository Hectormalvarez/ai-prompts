#!/usr/bin/env bash
#
# install.sh — wire this repo into Cline's global configuration (~/.cline/).
#
# Symlinks ~/.cline/rules -> ./rules and ~/.cline/skills -> ./skills so edits
# to this repo apply everywhere instantly (single source of truth, live edits).
#
# Idempotent and safe:
#   - Existing symlinks pointing at this repo are left alone / refreshed.
#   - Real files/dirs at the targets are backed up once, never overwritten.
#
# Usage:
#   ./install.sh             # apply
#   ./install.sh --dry-run   # show what would happen, change nothing

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLINE_DIR="${HOME}/.cline"

DRY_RUN=false
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=true
fi

log() {
  if [[ "$DRY_RUN" == true ]]; then
    echo "[dry-run] $*"
  else
    echo "$*"
  fi
}

# Move a real (non-symlink) target aside once so it is never destroyed.
backup_if_real() {
  local target="$1"
  if [[ -e "$target" && ! -L "$target" ]]; then
    local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
    log "Backing up real ${target} -> ${backup}"
    if [[ "$DRY_RUN" == false ]]; then
      mv "$target" "$backup"
    fi
  fi
}

# Ensure dst is a symlink to src (whole-directory link).
link_dir() {
  local src="$1"
  local dst="$2"

  backup_if_real "$dst"

  if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
    log "OK (already linked): ${dst} -> ${src}"
    return
  fi

  log "Linking: ${dst} -> ${src}"
  if [[ "$DRY_RUN" == false ]]; then
    mkdir -p "$(dirname "$dst")"
    ln -sfn "$src" "$dst"
  fi
}

log "Repo:     ${REPO_DIR}"
log "Cline:    ${CLINE_DIR}"
log ""

link_dir "${REPO_DIR}/rules"  "${CLINE_DIR}/rules"
link_dir "${REPO_DIR}/skills" "${CLINE_DIR}/skills"

log ""
if [[ "$DRY_RUN" == true ]]; then
  log "Dry run complete. Re-run without --dry-run to apply."
else
  log "Done. Restart Cline (or reload the window) so it re-scans ~/.cline/."
fi