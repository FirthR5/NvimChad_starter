local M = {}

local options = {
  background_colour = "#58afe8",
}

function M.setup()
  vim.opt.termguicolors = true
  require("notify").setup(options)
end

function M.opts()
  return {
    timeout = 200,
    background_color = "blue",
    render = "wrapped-compact",
  }
end

return M
