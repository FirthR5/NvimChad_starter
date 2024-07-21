require "nvchad.options"

--require "configs.vim_configs"
-- add yours here!
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/options.lua
-- https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
--https://hatchjs.com/neovim-copy-to-system-clipboard/
-- https://stackoverflow.com/questions/2362914/fold-function-in-vim
--

-- Vim Variables
local o = vim.o
local cmd = vim.cmd
--local api = vim.api
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Numbers and Tabs
o.expandtab = true
o.relativenumber = true
vim.opt.smarttab = true

--cmd.colorscheme("habamax")-- slate, habamax
cmd.highlight { "link", "Warning", "Error" }
-- https://neovim.io/doc/user/lua-guide.html

--vim.api.nvim_create_user_command("TestCommand", function()
--    print("Test Command")
--end, {})
-- vim.opt.viewoptions = "folds,cursor"
--vim.opt.sessionoptions = "folds"

-- Indent
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.opt.cmdheight = 0
-- vim.opt.laststatus = 0
-- vim.opt.inccommand = "split"
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = true
-- vim.opt.backspace = {"start", 'eol', 'indent'}

--o.foldclose = 'all'
-- o.foldmethod = 'syntax'
-- o.foldmethod = 'syntax'
-- o.foldlevel = 0

--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- set nofoldenable                     --" Disable folding at startup.
-- vim.o.foldlevel = 0
-- vim.o.foldlevelstart = 1
-- vim.o.foldnestmax = 1
-- vim.opt.foldmethod="indent"
