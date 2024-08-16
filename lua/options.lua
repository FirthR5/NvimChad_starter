require "nvchad.options"
-- ==================================================================
-- Vim Variables
-- ==================================================================
local o = vim.o
local opt = vim.opt
local cmd = vim.cmd
-- ==================================================================

-- ==================================================================
-- Options
-- ==================================================================
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
--cmd.colorscheme("habamax")-- slate, habamax
cmd.highlight { "link", "Warning", "Error" }
opt.wrap = true
opt.clipboard = "unnamedplus"

-- https://neovim.io/doc/user/lua-guide.html
-- ==================================================================
-- Numbers and Tabs
-- ==================================================================
o.expandtab = true
o.relativenumber = true
opt.smarttab = true
-- ==================================================================

-- ==================================================================
-- Indent
-- ==================================================================
opt.autoindent = true
opt.smartindent = true
-- vim.opt.cmdheight = 0
-- vim.opt.laststatus = 0
-- vim.opt.inccommand = "split"
opt.breakindent = true
-- ==================================================================

-- ==================================================================
-- Folding
-- ==================================================================
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- o.foldlevel = 4
-- vim.o.foldlevelstart = 2
-- vim.o.foldnestmax = 0
-- vim.opt.foldmethod="indent"

-- vim.filetype.add {
--   extension = {
--     git = { "gitconfig", "gitignore" },
--   },
--   filename = {
--     [".init.gitconfig"] = "gitconfig",
--   },
-- }
-- https://andrewcourter.substack.com/p/code-folding-in-neovim
-- zc - Close (fold) the current fold under the cursor.
-- zo - Open (unfold) the current fold under the cursor.
-- za - Toggle between closing and opening the fold under the cursor.
-- zR - Open all folds in the current buffer.
-- zM - Close all folds in the current buffer.
-- ==================================================================

-- ==================================================================
-- Auto CMDs
-- ==================================================================
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.gitconfig" },
  command = "set filetype=gitconfig",
})

-- ==================================================================

-- ==================================================================
-- vim.o.shell = "pwsh" --"C:/Program Files/PowerShell/7/pwsh.exe"

--require "configs.vim_configs"
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/options.lua
-- https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
--https://hatchjs.com/neovim-copy-to-system-clipboard/
-- https://stackoverflow.com/questions/2362914/fold-function-in-vim
-- ==================================================================
