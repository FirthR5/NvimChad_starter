local M = {}

local options = {}
local dependencies = {
  {
    "folke/todo-comments.nvim",
    opts = {},
  },
}

function M.setup()
  require("trouble").setup()
end

function M.dependencies()
  return dependencies
end

return M
