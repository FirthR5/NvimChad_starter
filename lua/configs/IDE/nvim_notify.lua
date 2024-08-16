local M = {}

local options = {
  -- Animation style
  stages = "fade_in_slide_out",
  -- Default timeout for notifications
  timeout = 1200,
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
