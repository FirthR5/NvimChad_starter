return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Default by NvChad
    "hrsh7th/nvim-cmp", -- Default by NvChad
  },
  config = function()
    require("codeium").setup {}
  end,
}
