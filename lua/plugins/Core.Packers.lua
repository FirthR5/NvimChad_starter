local inst_Mason = require "opts.inst.Mason"
local inst_TS = require "opts.inst.TreeSitter"
local config_treesitter = require "configs.Core.tree-sitter"
-- local config_telescope = require "configs.Core.tree-sitter"

local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.Core.lspconfig"
    end,
  },
  -- MUST READ
  --   event = { "BufRead", "BufWinEnter", "BufNewFile" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = inst_Mason,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = inst_TS },
    event = config_treesitter.events(),
    -- ft=config_treesitter.fts(),
    config = config_treesitter.setup(),
    highlight = config_treesitter.highlight(),
    auto_install = config_treesitter.auto_install(),
    sync_install = config_treesitter.sync_install(),
    autotag = config_treesitter.autotag(),
    dependencies = config_treesitter.dependencies(),
    indent = {
      enable = true,
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = require "opts.deps.telescope",
    config = function()
      require("configs.Core.telescope").Setup()
      -- require "configs.Core.telescope"
    end,
  },
}
return plugins
