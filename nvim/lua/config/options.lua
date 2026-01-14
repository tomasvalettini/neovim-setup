vim.g.mapleader = " "

-- basic options
local o = vim.opt

o.number = true
o.hidden = true
o.smartindent = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.updatetime = 300
o.cursorline = false  -- uncomment to enable

-- clipboard (disabled for now - enable if needed)
o.clipboard = "unnamedplus"

-- UI behavior
vim.cmd("syntax on")     -- can be replaced with treesitter later
vim.cmd("filetype plugin indent on")
