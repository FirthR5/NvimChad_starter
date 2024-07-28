return {
  "onsails/lspkind.nvim",
  -- lazy = false,
  event = "VeryLazy",
  config = function()
    options = {
      mode = "symbol_text",
      preset = "codicons",
    }
    require("lspkind").init()
  end,
}
