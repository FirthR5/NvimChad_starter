local M = {}

local options = {
  exclude_filetypes = { "NvimTree" },
}

function M.setup()
  require("shade").setup(options)
end

return M
