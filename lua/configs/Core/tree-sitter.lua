local M = {}

-- function M.inst_TS()
--   return require "opts.inst.TreeSitter"
-- end

-- function M.opts()
--   return {
--     ensure_installed = M.inst_TS(),
--   }
-- end

function M.setup()
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

function M.highlight()
  return {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
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
function M.auto_install()
  return true
end

function M.sync_install()
  return true
end

function M.autotag()
  return {
    enable = true,
  }
end
function M.events()
  return { "BufRead", "BufWinEnter", "BufNewFile" }
end

function M.dependencies()
  return {
    {
      "windwp/nvim-ts-autotag",
      config = function()
        require("nvim-ts-autotag").setup()
      end,
    },
  }
end
-- --ft = require("config.lsp").filetypes_with_lsp(),
-- function M.fts()
return M
