# File Edit Protocols

Rationale: minimizes failed diffs and preserves file integrity.

## Tool Selection

- Files under 200 lines: use `write_to_file` to replace the entire file.
- Files 200 lines or more: use `replace_in_file` with SEARCH/REPLACE blocks.
- New files: always `write_to_file` with complete content. Never leave placeholders.

## SEARCH/REPLACE Blocks

- Include 2–3 lines of exact surrounding context in each SEARCH block.
- Match whitespace and indentation character-for-character.
- Order multiple blocks top-to-bottom. Never overlap ranges.

## Error Recovery

- If `replace_in_file` fails once, re-read the file with line numbers and rebuild the block from fresh content.
- Never retry an identical block that just failed.
- If it fails twice consecutively, read the full file and fall back to `write_to_file`.