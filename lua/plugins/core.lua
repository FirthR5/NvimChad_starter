-- Core plugins: LSP, Mason, TreeSitter, Telescope, NvimTree
local mason_ensure = require "data.mason-ensure"
local ts_config = require "config.treesitter"

return {
  -- ─── Blink.cmp (NvChad integration, testing for 2 months) ─────────────────
  -- https://github.com/NvChad/NvChad/discussions/3244
  { import = "nvchad.blink.lazyspec" },

  -- ─── NvimTree ──────────────────────────────────────────────────────────────
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("config.nvim-tree"),
  },

  -- ─── Material Icons ────────────────────────────────────────────────────────
  {
    "DaikyXendo/nvim-material-icon",
    lazy = false,
    opts = {
      override_by_filename = {
        [".vuerc"] = { icon = " 󰡄", color = "#1cac78", name = "vuerc" },
        [".gitmessage.txt"] = { icon = "", color = "#f54d27", name = "config" },
        ["Packages"] = { icon = "", color = "#00ff00", name = "linox" },
        ["tsconfig.tsbuildinfo"] = { icon = "", color = "#cbcb41", name = "tsconfig.tsbuildinfo" },
      },
      override_by_extension = {
        ["gitconfig"] = { icon = "", color = "#f54d27", name = "config" },
        ["gitignore"] = { icon = "", color = "#f1502f", name = "GitIgnore" },
        ["Brew"] = { icon = "", color = "#e3c778", name = "Brew" },
        ["Flatpak"] = { icon = "󰏓", color = "#82d9dc", name = "Flatpak" },
        ["Pacman"] = { icon = "", color = "#2596be", name = "Pacman" },
        ["Snap"] = { icon = "", color = "#25be53", name = "Snap" },
        ["tsx"] = { icon = "", color = "#519aba", cterm_color = "26", name = "Tsx" },
        ["npmignore"] = { icon = "", color = "#c63c42", name = ".npmignore" },
      },
    },
  },

  -- ─── LSP ───────────────────────────────────────────────────────────────────
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp").setup()
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
        ensure_installed = mason_ensure,
        automatic_installation = true,
      }
    end,
  },

  -- ─── TreeSitter ────────────────────────────────────────────────────────────
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = ts_config.options,
    config = function(_, opts)
      opts.ensure_installed = ts_config.ensure_installed
      require("nvim-treesitter").setup(opts)
      ts_config.setup()
    end,
  },

  -- ─── Telescope ─────────────────────────────────────────────────────────────
  {
    "nvim-telescope/telescope.nvim",
    dependencies = require "data.telescope-deps",
    config = function()
      require("config.telescope").setup()
    end,
  },
}
