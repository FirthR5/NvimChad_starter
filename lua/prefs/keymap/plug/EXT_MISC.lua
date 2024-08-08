local keybinds = {}

keybinds.dadbotUI = {
  {
    "<leader>db",
    "<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
  },
}

keybinds.trouble = {
  {
    "<leader>di",
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

keybinds.gitsigns = {
  prev_hunk = "<leader>gk",
  next_hunk = "<leader>gj",
  preview_hunk = "<leader>gp",
}
keybinds.lazygit = {
  { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" },
}

function keybinds.ranger()
  local ranger_nvim = require "ranger-nvim"
  vim.api.nvim_set_keymap("n", "<leader>rf", "", {
    desc = "open ranger",
    noremap = true,
    callback = function()
      require("ranger-nvim").open(true)
    end,
  })
end

keybinds.tmux_nav = {
  { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
}

return keybinds
