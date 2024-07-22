local options = {
  -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
}

local M = {}

M = {
  "numToStr/Comment.nvim",
  lazy = false,
  config = function()
    require("Comment").setup(options)
  end,
}

return M
