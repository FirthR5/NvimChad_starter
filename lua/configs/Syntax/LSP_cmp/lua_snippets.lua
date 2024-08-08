function MySetup()
  local lua_snippets_my_path = ""
  local sysname = vim.loop.os_uname().sysname

  if sysname == "Windows_NT" then
    lua_snippets_my_path = vim.fn.stdpath "config" .. "\\lua\\prefs\\snippets\\"
  else
    lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/prefs/snippets/"
  end
  require("luasnip.loaders.from_vscode").load()

  require("luasnip.loaders.from_lua").load { paths = lua_snippets_my_path }
  vim.g.lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/prefs/snippets/"
end

--   -- ========================================================================
-- Lista de referencia para sacar los Snippets

-- VUE:
-- require("luasnip.session.snippet_collection").clear_snippets("r")
-- $ npm install vue-meta --save
-- --------------------- https://github.com/nuxt/vue-meta
-- ============================================================

local M = {}

M = {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  after = "nvim-cmp",
  enable_autosnippets = true,
  dependencies = { "rafamadriz/friendly-snippets" }, -- Default by NvChad
  build = "make install_jsregexp",
  config = function()
    MySetup()
  end,
}
return M
