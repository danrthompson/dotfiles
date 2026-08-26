# Canonical Editor Setup

This Mac uses a deliberate split between fast human editing, heavyweight IDE work,
documents, utility text editing, and agentic coding.

## Responsibilities

| Tool | Role |
| --- | --- |
| Zed | Primary human source editor, repository browsing, navigation, targeted edits, and local diff review |
| VS Code Workbench | Debugging, notebooks, GitHub and PR workflows, specialized extensions, and compatibility work |
| BBEdit | Optional lightweight Mac utility editor for text, logs, and one-off manipulation |
| Typora | Markdown documents |
| Xcode | Swift and Xcode-specific projects and assets |
| Claude Code and Codex | Primary agentic coding environments |
| Cursor | Optional agent environment and historical configuration reference |
| Tot | Lightweight scratchpad experiment |
| Drafts | Existing cross-device capture library, kept intact with a simplified Mac interface |

## Shell Vocabulary

The definitions live in `zsh_omz/aliases.zsh`.

```sh
e file.py          # Zed
e file.py:42       # Zed at a line
e .                # Browse a repository in Zed
u .                # Transitional Zed alias
cur .              # Cursor
bb notes.txt        # BBEdit
md README.md        # Typora
ide .               # VS Code Workbench profile
bbdiff old new      # BBEdit comparison
git difftool        # Zed split diff
git mergetool       # VS Code Workbench merge editor
```

`EDITOR` and `VISUAL` are `zed --wait`. Native commands remain available:
`zed`, `bbedit`, `bbdiff`, `code`, `cursor`, `claude`, and `codex`.

## Zed

Configuration: `~/.config/zed/settings.json`

- VS Code base keymap
- Monaspace Neon, 18px, weight 450
- System-following theme: One Light in light mode and VSCode Dark Modern in dark mode
- AI disabled so Claude Code and Codex remain the agentic layer
- Formatting on save, inlay hints, split diffs, no minimap, and minimal whitespace markers
- JavaScript and TypeScript: ESLint fixes with the repository formatter
- Python: basedpyright for intelligence and Ruff for formatting and import organization
- Representative TypeScript and Python navigation and formatting were validated

The basedpyright default-language-server banner is informational. It does not
indicate a Python failure.

Project Diff:

1. Open the Command Palette with `Cmd-Shift-P`.
2. Run `Git: Diff`.
3. Review, stage, unstage, or open individual files from the combined diff.

## VS Code Workbench

Always launch the clean profile with `ide`. The profile configuration is stored at:

`~/Library/Application Support/Code/User/profiles/-4c63baf/settings.json`

Direct extensions:

- Ruff
- ESLint
- GitLens
- Prettier
- GitHub Pull Requests and Issues
- Rainbow CSV
- Python
- Jupyter
- Prisma
- Kanagawa
- YAML
- Tombi TOML

Python, Pylance, debugpy, and Jupyter helper extensions are installed as dependencies.
Five XML snippets were preserved. Historical keybindings, MSSQL, ActivityWatch,
Lightrun, CodeStream, overlapping AI extensions, and Cursor-specific AI settings
were not migrated.

Built-in Chat remains available. Inline Copilot completions and GitLens AI remain
disabled by default. GitHub sign-in is appropriate for PR support. Settings Sync
should only be enabled deliberately after checking for old remote configuration.

Recommended cloud posture:

- Settings Sync: useful after reviewing remote data; sync the clean Workbench profile
- Cloud Changes: leave off unless using Continue Working On with uncommitted changes
- Remote Tunnel Access: leave off until remote access to this Mac is specifically needed
- GitLens account: optional; local history works without it, while GitKraken cloud features require it

## Jupyter

A standalone scratch kernel avoids mutating a real repository:

- Environment: `~/.local/share/venvs/jupyter-kernel`
- Kernel name: `dan-user`
- Display name: `Python 3.12 (User)`

Select that kernel for general notebooks. Project notebooks should still use their
own environment when project-specific packages are required.

## BBEdit

BBEdit is deliberately unconfigured and owns no default file associations. Its
CLI tools are available as `bbedit`, `bbdiff`, and the semantic alias `bb`.
Evaluate it during the trial rather than turning it into another IDE.

## File Associations

| Files | Default app |
| --- | --- |
| Python, JavaScript, TypeScript, Go, Rust, Java, C/C++, shell, and SQL | Zed |
| JSON, YAML, TOML, XML, CSV, plain text, and logs | Zed |
| Markdown variants | Typora |
| Swift and Xcode projects, workspaces, playgrounds, storyboards, and assets | Xcode |
| HTML | Google Chrome |
| `.mts` media | VLC |

BBEdit and VS Code own no default associations.

## Drafts and Tot

Tot was already installed and configured separately.

Drafts keeps all existing content, tags, workspaces, actions, and shortcuts. On the
Mac, the tag entry, action bar, workspace shortcut bar, and full action panel are
hidden for a quieter interface. The draft list remains visible. Menu-bar access and
iCloud sync are enabled. Current global shortcuts:

- Main window: `Shift-Command-1`
- Quick capture: `Shift-Command-2`

## Backups and Recovery

The rebuild backup is:

`~/Backups/editor-rebuild/20260826-124859-EDT`

It contains checksummed copies of shell, Git, Zed, Cursor, VS Code, Typora,
LaunchServices, snippets, extension ledgers, and the original VS Code application.
The `follow-up` directory also contains the pre-change Zed and Drafts preferences
from the light-theme and Drafts simplification pass.

## Deferred Maintenance

- Do not remove old Cursor or VS Code data as part of editor maintenance.
- Keep Settings Sync off until old remote state is reviewed.
- Homebrew needs a separate maintenance pass: update Command Line Tools, repair the
  stale `libass` installation used by `ffmpeg`, and review deprecated formulae and taps.
- Broader disk cleanup remains separate from editor configuration.
