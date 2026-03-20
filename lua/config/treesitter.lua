local inst_TS = require "data.treesitter-ensure"

local options = {
  highlight = { enable = true },
  incremental_selection = { enable = false },
  auto_install = true,
  sync_install = true,
  indent = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  autopairs = { enable = true },
  autotag = { enable = true },
  matchup = { enable = true },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    lint_events = { "BufWrite", "CursorHold" },
  },
}

local function treesitter_setup()
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.o.foldlevel = 4

  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.gitconfig" },
    command = "set filetype=gitconfig",
  })
end

return {
  ensure_installed = inst_TS,
  options = options,
  setup = treesitter_setup,
}
