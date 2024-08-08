local inst_Mason = require "opts.inst.Mason"
-- local inst_TS = require "opts.inst.TreeSitter"
local config_treesitter = require "configs.Core.tree-sitter"
-- local config_telescope = require "configs.Core.telescope"

local plugins = {
  -- ==================================================================
  -- Default by NvChad
  -- ==================================================================/
  -- - nvim-web-devicons.nvim
  -- - nvim-tree.lua
  -- - which-key.nvim
  require "configs.Core.nvim-tree",
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.Core.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = inst_Mason,
        automatic_installation = true,
      }
    end,
  },
  config_treesitter,
  {
    "nvim-telescope/telescope.nvim",
    dependencies = require "opts.deps.telescope",
    config = function()
      require("configs.Core.telescope").Setup()
    end,
  },

  -- {
  --   "NvChad/nvterm",
  --   config = function()
  --     -- vim.cmd 'let g:terminal_shell =
  --     require("nvterm").setup(vim.tbl_deep_extend("force", opts, {
  --       terminals = {
  --         shell = "C:\\Program Files\\PowerShell\\7\\pwsh.exe",
  --         --shell = "/bin/zsh",
  --       },
  --     }))
  --   end,
  -- },
}
return plugins
