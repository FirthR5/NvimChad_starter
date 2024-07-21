local dependencies =
{
  {
    'hrsh7th/cmp-buffer'
  },
  {
    'hrsh7th/cmp-path'
  },
  {
    'hrsh7th/cmp-cmdline'
  },
  {
    'saadparwaiz1/cmp_luasnip'
  },
  {
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    'hrsh7th/cmp-nvim-lua',
  },
  {
    'L3MON4D3/LuaSnip',
    -- follow latest release.
    version = '1.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
    dependencies = {
      'rafamadriz/friendly-snippets'
    },
    opts = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },
}
return dependencies
