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
  config = function()
    Cconfiguration()
  end,
}

return M
