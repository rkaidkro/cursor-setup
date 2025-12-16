Commit all relevant changes in this repo with a rich, high-context Git commit message.

Instructions:
- Inspect the git diff for all staged and unstaged changes.
- Infer the high-level intent of this work from the current conversation.
- Stage all appropriate source files (ignore obvious build artefacts and large generated files).
- Create ONE commit using this message structure:

<type>: <short summary>

Context:
- 1–4 short bullets explaining WHY this change exists.
- Capture important reasoning and direction from this session in concise form.

Changes:
- 2–8 bullets summarising WHAT was actually changed and where (files / modules / behaviors).

Rules:
- Valid <type> values: feat, fix, refactor, docs, chore, test.
- No secrets, tokens, passwords, .env contents, or sensitive log lines.
- Rich context is good, but keep the whole message under roughly 5 KB.
- Do not push. Only stage and commit.
