local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  lsp = {
    signature = {
      enabled = false, -- https://github.com/LazyVim/LazyVim/discussions/941
    },
  },
}

require("conform").setup(options)
