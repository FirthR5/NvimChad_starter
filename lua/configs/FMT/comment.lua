require("Comment").setup {
  -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
}
