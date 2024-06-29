require "nvchad.options"

-- Vim Variables
local o = vim.o
local cmd = vim.cmd

-- Numbers and Tabs
o.expandtab = true
o.relativenumber = true
vim.opt.smarttab = true

cmd.highlight { "link", "Warning", "Error" }

-- Indent
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.inccommand = "split"
vim.opt.breakindent = true
vim.opt.wrap = true
