local dependencies = {
  {
    "hrsh7th/cmp-buffer", -- Default by NvChad
  },
  {
    "hrsh7th/cmp-path", -- Default by NvChad
  },
  {
    "hrsh7th/cmp-cmdline", -- Default by NvChad
  },
  {
    "saadparwaiz1/cmp_luasnip", -- Default by NvChad
  },
  {
    "hrsh7th/cmp-nvim-lsp", -- Default by NvChad
  },
  {
    "hrsh7th/cmp-nvim-lua", -- Default by NvChad
  },
  {
    "L3MON4D3/LuaSnip", -- Default by NvChad
    -- follow latest release.
    -- version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- Default by NvChad
    },
    opts = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
return dependencies
