return {
  "onsails/lspkind.nvim",
  -- lazy = false,
  event = "VeryLazy",
  options = {
    mode = "symbol_text",
    preset = "codicons",
  },
  config = function()
    require("lspkind").init()
  end,
}
