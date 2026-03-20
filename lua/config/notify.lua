local options = {
  stages = "fade_in_slide_out",
  timeout = 1200,
  background_colour = "#58afe8",
}

local opts = {
  timeout = 200,
  background_color = "blue",
  render = "wrapped-compact",
}

local function setup()
  vim.opt.termguicolors = true
  require("notify").setup(options)
end

return {
  setup = setup,
  opts = opts,
}
