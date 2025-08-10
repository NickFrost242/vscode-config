-- VSCode Neovim-centric config: all editor keymaps live here using VSCodeNotify
if not vim.g.vscode then return end

-- Leader & core editor behavior
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"   -- system clipboard
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.number = true
vim.opt.relativenumber = true

-- Helper to bind VS Code commands
local function nmap(lhs, cmd)
  vim.keymap.set("n", lhs, function() vim.fn.VSCodeNotify(cmd) end, { silent = true })
end
local function vmap(lhs, cmd)
  vim.keymap.set("x", lhs, function() vim.fn.VSCodeNotify(cmd) end, { silent = true })
end

-- ---------- Normal mode: tabs / editors ----------
nmap("H",  "workbench.action.previousEditor")
nmap("L",  "workbench.action.nextEditor")
vim.keymap.set("n", "gt", function() vim.fn.VSCodeNotify("workbench.action.nextEditor") end, { silent = true })
vim.keymap.set("n", "gT", function() vim.fn.VSCodeNotify("workbench.action.previousEditor") end, { silent = true })
nmap("<Tab>",   "workbench.action.nextEditor")
nmap("<S-Tab>", "workbench.action.previousEditor")

-- ---------- Normal mode: group focus & splits ----------
nmap("<leader>h", "workbench.action.focusLeftGroup")
nmap("<leader>j", "workbench.action.focusBelowGroup")
nmap("<leader>k", "workbench.action.focusAboveGroup")
nmap("<leader>l", "workbench.action.focusRightGroup")
nmap("<leader>s", "workbench.action.splitEditorDown")
nmap("<leader>v", "workbench.action.splitEditorRight")

-- ---------- Normal mode: file ops & actions ----------
nmap("<leader>w",  "workbench.action.files.save")
nmap("<leader>q",  "workbench.action.closeActiveEditor")
vim.keymap.set("n", "<leader>x", function()
  vim.fn.VSCodeNotify("workbench.action.files.save")
  vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
end, { silent = true })

nmap("<leader>f",  "workbench.action.quickOpen")
nmap("<leader>p",  "editor.action.formatDocument")
nmap("<leader>ca", "editor.action.quickFix")
nmap("gh",         "editor.action.peekDefinition")
nmap("<leader>c",  "editor.action.commentLine")

-- Diagnostics
nmap("[d", "editor.action.marker.prev")
nmap("]d", "editor.action.marker.next")

-- Copy to clipboard (normal copies current line if no selection)
nmap("<C-c>", "editor.action.clipboardCopyAction")
vmap("<C-c>", "editor.action.clipboardCopyAction")

-- ---------- Visual mode helpers ----------
vmap("<", "editor.action.outdentLines")
vmap(">", "editor.action.indentLines")
vmap("J", "editor.action.moveLinesDownAction")
vmap("K", "editor.action.moveLinesUpAction")

-- Note: We intentionally do NOT map 'j'/'k' in visual mode to avoid overriding Vim selection movement.
-- They retain standard Vim behavior for moving the cursor with selection.

-- ---------- Optional: Explorer/Terminal helpers from editor ----------
-- If you prefer to trigger Explorer/Terminal actions while in the editor
-- (instead of focusing those views first), you can add additional leader mappings here, e.g.:
-- nmap("<leader>e", "workbench.files.action.focusFilesExplorer")
-- nmap("<leader>tn", "workbench.action.terminal.new")
-- nmap("<leader>tj", "workbench.action.terminal.focusNext")
-- nmap("<leader>tk", "workbench.action.terminal.focusPrevious")
-- nmap("<leader>tw", "workbench.action.terminal.kill")
