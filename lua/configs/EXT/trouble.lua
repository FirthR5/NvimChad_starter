local dependencias = {
  {
    "folke/todo-comments.nvim",
    opts = {},
  },
}

local the_keys = {
  {
    "<leader>xx",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
  },
  {
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Buffer Diagnostics (Trouble)",
  },
  {
    "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    desc = "Symbols (Trouble)",
  },
  {
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  {
    "<leader>xL",
    "<cmd>Trouble loclist toggle<cr>",
    desc = "Location List (Trouble)",
  },
  {
    "<leader>xQ",
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
