local formatter_path = ""
local sysname = vim.loop.os_uname().sysname

if sysname == "Windows_NT" then
  formatter_path = vim.fn.stdpath "config" .. "\\lua\\util\\formatter\\"
else
  formatter_path = vim.fn.stdpath "config" .. "/lua/util/formatter/"
end

local options = {
  formatters_by_ft = {
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    html = { "prettier" },

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
    timeout_ms = 500,
    lsp_fallback = true,
  },
  lsp = {
    signature = {
      enabled = false,
    },
  },
}

local function setup()
  require("conform").setup(options)
  local sqlpath = formatter_path .. "sql.json"
  local mdpath = formatter_path .. "markdown.json"
  require("conform").formatters.sql_formatter = {
    prepend_args = { "-c", vim.fn.expand(sqlpath) },
  }
  require("conform").formatters.markdownlint = {
    prepend_args = { "-c", vim.fn.expand(mdpath) },
  }
end

return {
  setup = setup,
}
