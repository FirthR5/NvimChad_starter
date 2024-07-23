local M = {}

local options = {
  formatters_by_ft = {
    -- lua = { "stylua" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },
    -- javascript = { "prettier" },
    -- javascript = { "prettierd", "prettier", stop_after_first = true },

    cs = { "csharpier" },
    python = { "isort", "black" },
    lua = { "stylua" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier", "markdownlint" },
    sql = { "sql_formatter" },
    ["*"] = { "injected" },
  },
  formatters = {
    csharpier = {
      command = "dotnet-csharpier",
      args = { "--write-stdout" },
    },
  },
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
  lsp = {
    signature = {
      enabled = false, -- https://github.com/LazyVim/LazyVim/discussions/941
    },
  },
}
local event = { "LspAttach", "BufWritePre", "BufReadPre", "BufNewFile" }

local formatter_path = ""
local sysname = vim.loop.os_uname().sysname

if sysname == "Windows_NT" then
  formatter_path = vim.fn.stdpath "config" .. "\\lua\\prefs\\formatter\\"
else
  formatter_path = vim.fn.stdpath "config" .. "/lua/prefs/formatter/"
end

M = {
  -- https://www.josean.com/posts/neovim-linting-and-formatting
  "stevearc/conform.nvim",
  event = event, -- "BufWritePre", -- uncomment for format on save
  config = function()
    require("conform").setup(options)
    local sqlpath = formatter_path .. "sql.json"
    local mdpath = formatter_path .. "markdown.json"
    require("conform").formatters.sql_formatter = {
      prepend_args = { "-c", vim.fn.expand(sqlpath) },
    }
    require("conform").formatters.markdownlint = {
      prepend_args = { "-c", vim.fn.expand(mdpath) },
    }
  end,
}

return M
