require "nvchad.options"

-- Vim Variables
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd

o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
-- Numbers and Tabs
o.expandtab = true
o.relativenumber = true
opt.smarttab = true

--cmd.colorscheme("habamax")-- slate, habamax
cmd.highlight { "link", "Warning", "Error" }
-- https://neovim.io/doc/user/lua-guide.html

-- Indent
opt.autoindent = true
opt.smartindent = true
-- vim.opt.cmdheight = 0
-- vim.opt.laststatus = 0
-- vim.opt.inccommand = "split"
opt.smarttab = true
opt.breakindent = true
opt.wrap = true
opt.clipboard = ""
-- vim.o.shell = "pwsh" --"C:/Program Files/PowerShell/7/pwsh.exe"

--require "configs.vim_configs"
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/options.lua
-- https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
--https://hatchjs.com/neovim-copy-to-system-clipboard/
-- https://stackoverflow.com/questions/2362914/fold-function-in-vim
