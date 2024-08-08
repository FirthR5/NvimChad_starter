local M = {}
M = {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  keys = require("prefs.keymap.plug.EXT_MISC").dadbotUI,
}

return M

-- https://github.com/JazzyGrim/dotfiles/blob/master/.config/nvim/lua/plugins/ui.lua
