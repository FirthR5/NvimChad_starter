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

return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function()
    local hooks = require "ibl.hooks"
    -- create the highlight groups in the highlight setup hook
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "Green", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "White", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "Cafe", { fg = "#6f4e37" })
      vim.api.nvim_set_hl(0, "White2", { fg = "#ffffff" })
      vim.api.nvim_set_hl(0, "Red", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "Orange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "Yellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "Cyan", { fg = "#56B6C2" })
      vim.api.nvim_set_hl(0, "Blue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "Violet", { fg = "#C678DD" })
    end)

    vim.g.rainbow_delimiters = { highlight = highlight }
    local opts = {
      indent = { highlight = highlight },
      whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
      },
      scope = { enabled = false },
    }

    require("ibl").setup(opts)
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
