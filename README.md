# VSCode Neovim Configuration (API-first)

Configurations for VSCode Neovim Plugin. The focus here is to seamlessly integrate vim motions into VSCode's workflow.

**All editor keybindings live in `init.lua`** and call VS Code commands via `VSCodeNotify`.
Only contexts **outside the editor** (terminal focus, files explorer focus) remain in `keybindings.json` because Neovim is not active there.

## Files
- `init.lua` — **All editor keymaps** (Normal/Visual) implemented with `vim.fn.VSCodeNotify(...)`.
- `settings.json` — Editor behavior, Prettier defaults, UI choices, and `jj` escape via `vscode-neovim.compositeKeys`.
- `keybindings.json` — Minimal bindings for **terminal-focus** and **explorer-focus** actions only.

## Why this split?
- The VSCode Neovim extension recommends binding editor actions in Neovim config using `VSCodeNotify`.
- When the **terminal** or **explorer** has focus, Neovim is not the active input handler; therefore VS Code keybindings must be used for those views.

## Keymap summary (from `init.lua`)
- Tabs: `H` prev, `L` next, `gt` next, `gT` prev, `<Tab>/<S-Tab>` next/prev
- Groups: `<leader>h/j/k/l` focus left/below/above/right
- Splits: `<leader>s` split down, `<leader>v` split right
- File ops: `<leader>w` save, `<leader>q` close, `<leader>x` save+close
- Actions: `<leader>f` Quick Open, `<leader>p` Format, `<leader>ca` Quick Fix, `gh` Peek def, `<leader>c` Toggle comment
- Diagnostics: `[d` prev, `]d` next
- Clipboard: `<C-c>` copy (normal/visual)
- Visual edit: `<` outdent, `>` indent, `J`/`K` move lines; **`j`/`k` unaffected**

## Terminal / Explorer (from `keybindings.json`)
- Terminal (when terminal focused): `Ctrl+Shift+N` new, `Ctrl+Shift+W` kill, `Ctrl+Shift+A` next, `Ctrl+Shift+B` previous
- Explorer: `Ctrl+E` focus explorer; inside explorer: `n` new file, `Shift+N` new folder, `r` rename, `d` delete
