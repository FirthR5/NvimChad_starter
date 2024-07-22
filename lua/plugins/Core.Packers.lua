local inst_Mason = require "opts.inst.Mason"
local inst_TS = require "opts.inst.TreeSitter"
local config_treesitter = require "configs.Core.tree-sitter"
-- local config_telescope = require "configs.Core.telescope"

local plugins = {
  -- ==================================================================
  -- Default by NvChad
  -- ==================================================================/
  -- - nvim-web-devicons.nvim
  -- - nvim-tree.lua
  -- - which-key.nvim
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.Core.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = inst_Mason,
    },
  },
  config_treesitter,
  {
    "nvim-telescope/telescope.nvim",
    dependencies = require "opts.deps.telescope",
    config = function()
      require("configs.Core.telescope").Setup()
    end,
  },
}
return plugins
