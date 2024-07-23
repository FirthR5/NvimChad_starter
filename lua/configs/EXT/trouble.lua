local dependencias = {
  {
    "folke/todo-comments.nvim",
    opts = {},
  },
}

local the_keys = {
  {
    "<leader>d",
    desc = "Diagnostics",
  },
  {
    "<leader>dt",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
  },
  {
    "<leader>dT",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Buffer Diagnostics (Trouble)",
  },
  {
    "<leader>ds",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    desc = "Symbols (Trouble)",
  },
  {
    "<leader>dr",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  {
    "<leader>dll",
    "<cmd>Trouble loclist toggle<cr>",
    desc = "Location List (Trouble)",
  },
  {
    "<leader>dQ",
    "<cmd>Trouble qflist toggle<cr>",
    desc = "Quickfix List (Trouble)",
  },
}

function Configuration()
  require("trouble").setup()
end

local M = {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TodoTrouble" },
  dependencies = dependencias,
  keys = the_keys,
  config = function()
    Configuration()
  end,
}

return M
