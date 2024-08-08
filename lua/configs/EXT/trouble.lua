local dependencias = {
  {
    "folke/todo-comments.nvim",
    opts = {},
  },
}

function Configuration()
  require("trouble").setup()
end

local M = {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TodoTrouble" },
  dependencies = dependencias,
  keys = require("prefs.keymap.plug.EXT_MISC").trouble,
  config = function()
    Configuration()
  end,
}

return M
