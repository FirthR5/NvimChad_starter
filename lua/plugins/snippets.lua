local snippets = {
  --   -- ============================================================
  -- AutoClose Tags

  -- Comment code
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup {
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
        },
      }
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    enable_autosnippets = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local lua_snippets_my_path = ""

      -- -- Configurar la ruta de snippets según el sistema operativo
      if sysname == "Windows_NT" then
        lua_snippets_my_path = vim.fn.stdpath "config" .. "\\lua\\lua_snippets\\"
      else
        lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/lua_snippets/"
      end
      -- load snippets from path/of/your/nvim/config/my-cool-snippets

      require("luasnip.loaders.from_vscode").load()

      require("luasnip.loaders.from_lua").load { paths = lua_snippets_my_path }
    end,
  },

  --   -- ========================================================================
  -- Lista de referencia para sacar los Snippets

  -- VUE:
  -- require("luasnip.session.snippet_collection").clear_snippets("r")
  -- $ npm install vue-meta --save
  -- --------------------- https://github.com/nuxt/vue-meta

  --   {
  --     "L3MON4D3/LuaSnip",
  --     -- follow latest release.
  --     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  --     -- install jsregexp (optional!).
  --     build = "make install_jsregexp",
  --     enable_autosnippets = true,
  --     config = function()
  --       --require('config.snippets')
  --       require('luasnip.loaders.from_vscode')
  --             local ruta =vim.fn.stdpath('config') .. '/lua/lua_snippets/tet.json'
  --       require('luasnip.loaders.from_vscode').lazy_load({ paths = { ruta } })
  --       -- require('luasnip.loader.from_vscode').lazy_load( {"vue"})
  --     end,

  --     dependencies = {
  --       -- "rafamadriz/friendly-snippets",
  --       "benfowler/telescope-luasnip.nvim",
  --     },
  --   },

  --     -- Snippet Courtesy of @Zeioth,

  --     -- {
  --     --   "L3MON4D3/LuaSnip",
  --     --   build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,
  --     --   dependencies = {
  --     --     "rafamadriz/friendly-snippets",
  --     --     "benfowler/telescope-luasnip.nvim",
  --     --   },
  --     --   config = function(_, opts)
  --     --     if opts then require("luasnip").config.setup(opts) end
  --     --     vim.tbl_map(
  --     --       function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
  --     --       { "vscode", "snipmate", "lua" }
  --     --     )
  --     --     -- friendly-snippets - enable standardized comments snippets
  --     --     require("luasnip").filetype_extend("typescript", { "tsdoc" })
  --     --     require("luasnip").filetype_extend("javascript", { "jsdoc" })
  --     --     require("luasnip").filetype_extend("lua", { "luadoc" })
  --     --     require("luasnip").filetype_extend("python", { "pydoc" })
  --     --     -- require("luasnip").filetype_extend("rust", { "rustdoc" })
  --     --     require("luasnip").filetype_extend("cs", { "csharpdoc" })
  --     --     -- require("luasnip").filetype_extend("java", { "javadoc" })
  --     --     require("luasnip").filetype_extend("c", { "cdoc" })
  --     --     require("luasnip").filetype_extend("cpp", { "cppdoc" })
  --     --     -- require("luasnip").filetype_extend("php", { "phpdoc" })
  --     --     require("luasnip").filetype_extend("kotlin", { "kdoc" })
  --     --     require("luasnip").filetype_extend("ruby", { "rdoc" })
  --     --     require("luasnip").filetype_extend("sh", { "shelldoc" })
  --     --     -- require("luasnip").filetype_extend("vue", { "vuedoc" })
  --     --   end,
  --     -- },
}

return snippets
