local highlight = {
  "Green",
  "White",
  "Cafe",
  "White2",
  "Red",
  "Orange",
  "Yellow",
  "Cyan",
  "Blue",
  "Violet",
}

local colors = {
  Green = "#98C379",
  White = "#ffffff",
  Cafe = "#6f4e37",
  White2 = "#ffffff",
  Red = "#E06C75",
  Orange = "#D19A66",
  Yellow = "#E5C07B",
  Cyan = "#56B6C2",
  Blue = "#61AFEF",
  Violet = "#C678DD",
}

local function setup()
  local hooks = require "ibl.hooks"
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    for name, color in pairs(colors) do
      vim.api.nvim_set_hl(0, name, { fg = color })
    end
  end)

  vim.g.rainbow_delimiters = { highlight = highlight }

  require("ibl").setup {
    indent = { highlight = highlight },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    },
    scope = { enabled = false },
  }

  hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return {
  setup = setup,
}
