local inst_TS = require "opts.inst.TreeSitter"

function setup()
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.foldlevel = 4
  -- vim.o.foldlevelstart = 2
  -- vim.o.foldnestmax = 0
  -- vim.opt.foldmethod="indent"

  -- https://andrewcourter.substack.com/p/code-folding-in-neovim
  -- zc - Close (fold) the current fold under the cursor.
  -- zo - Open (unfold) the current fold under the cursor.
  -- za - Toggle between closing and opening the fold under the cursor.
  -- zR - Open all folds in the current buffer.
  -- zM - Close all folds in the current buffer.
end

function highlight()
  return {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = true,
  }
end
-- incremental_selection = {
--   enable = true,
--   keymaps = {
--     init_selection = "gnn",
--     node_incremental = "grn",
--     scope_incremental = "grc",
--     node_decremental = "grm",
--   },
-- },
function auto_install()
  return true
end

function sync_install()
  return true
end

function autotag()
  return {
    enable = true,
  }
end
function events()
  return { "BufRead", "BufWinEnter", "BufNewFile" }
end

local ts_autotag = {}

function dependencies()
  return require "configs.FMT.tsAutoTag"
end
-- --ft = require("config.lsp").filetypes_with_lsp(),
-- function M.fts()

local M = {}
M = {
  "nvim-treesitter/nvim-treesitter",
  opts = { ensure_installed = inst_TS },
  event = events(),
  -- ft=config_treesitter.fts(),
  highlight = highlight(),
  auto_install = auto_install(),
  sync_install = sync_install(),
  autotag = autotag(),
  dependencies = dependencies(),
  config = setup(),
  -- indent = {
  --   enable = true,
  -- },
}

return M
