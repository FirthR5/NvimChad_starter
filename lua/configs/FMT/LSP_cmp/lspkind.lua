return {
  "onsails/lspkind.nvim",
  lazy = false,
  config = function()
    options = {
      mode = "symbol_text",
      preset = "codicons",
    }
    require("lspkind").init()
  end,
}
