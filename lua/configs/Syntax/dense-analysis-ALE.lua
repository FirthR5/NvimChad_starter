local linters = {
  -- ruby = { "rubocop", "ruby" },
  -- lua = { "lua_language_server" },
  cs = { "csharpier" },
}
return {
  "dense-analysis/ale",
  lazy = true,
  event = "VeryLazy",
  config = function()
    -- Configuration goes here.
    local g = vim.g
    g.ale_ruby_rubocop_auto_correct_all = 1
    g.ale_linters = linters
  end,
}
