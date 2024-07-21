return {
  --   -- ========================================================================
  -- Lista de referencia para sacar los Snippets

  -- VUE:
  -- require("luasnip.session.snippet_collection").clear_snippets("r")
  -- $ npm install vue-meta --save
  -- --------------------- https://github.com/nuxt/vue-meta
  -- ============================================================
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    after = "nvim-cmp",
    enable_autosnippets = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require "configs.FMT.lua_snippets"
    end,
  },
  -- ============================================================
  -- Comment code
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require "configs.FMT.comment"
    end,
  },
}
