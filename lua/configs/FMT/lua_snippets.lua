local lua_snippets_my_path = ""
local sysname = vim.loop.os_uname().sysname

if sysname == "Windows_NT" then
  lua_snippets_my_path = vim.fn.stdpath "config" .. "\\lua\\prefs\\snippets\\"
else
  lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/prefs/snippets/"
end
require("luasnip.loaders.from_vscode").load()

require("luasnip.loaders.from_lua").load { paths = lua_snippets_my_path }
vim.g.lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/prefs/snippets"
