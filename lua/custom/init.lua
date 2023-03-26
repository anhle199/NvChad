-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

g.maplocalleader = " "
opt.mouse = ""
opt.undofile = false
opt.timeoutlen = 500

-- Numbers
opt.numberwidth = 4

-- Backup/swap file
opt.backup = false -- creates a backup file
opt.writebackup = true -- creates a backup file while it is being edited. The backup is removed after the file was successfully written
opt.swapfile = true
opt.confirm = true -- confirm to save changes before exiting modified buffer

-- Lines
opt.wrap = true
opt.linebreak = true
opt.backspace = { "start", "eol", "indent" } -- enable 'Backspace' key in insert mode
