local function setup()
  local snippet_path = ""
  local sysname = vim.loop.os_uname().sysname

  if sysname == "Windows_NT" then
    snippet_path = vim.fn.stdpath "config" .. "\\lua\\util\\snippets\\"
  else
    snippet_path = vim.fn.stdpath "config" .. "/lua/util/snippets/"
  end

  require("luasnip.loaders.from_vscode").load()
  require("luasnip.loaders.from_lua").load { paths = snippet_path }
  vim.g.lua_snippets_my_path = vim.fn.stdpath "config" .. "/lua/util/snippets/"
end

return {
  setup = setup,
}
