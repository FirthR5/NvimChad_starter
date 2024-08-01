local inst_TS = require "opts.inst.TreeSitter"

local options = {
  highlight = { enable = true },
  incremental_selection = { enable = false },
  auto_install = true,
  sync_install = true,
  indent = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
    disable = { "python", "yaml" },
  },
  autopairs = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
  -- ft=config_treesitter.fts(),
}

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

local M = {}
M = {
  "nvim-treesitter/nvim-treesitter",
  -- tag = "v0.9.1",
  opts = { ensure_installed = inst_TS, opts = options },
  event = { "BufRead", "BufWinEnter", "BufNewFile" },
  dependencies = require "configs.Syntax.LSP_cmp.tsAutoTag",
  config = setup(),
}

return M

-- incremental_selection = {
--   enable = true,
--   keymaps = {
--     init_selection = "gnn",
--     node_incremental = "grn",
--     scope_incremental = "grc",
--     node_decremental = "grm",
--   },
-- },
