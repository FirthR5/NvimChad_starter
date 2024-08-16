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

-- -- Actions
-- map('n', '<leader>hs', gitsigns.stage_hunk)
-- map('n', '<leader>hr', gitsigns.reset_hunk)
-- map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
-- map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
-- map('n', '<leader>hS', gitsigns.stage_buffer)
-- map('n', '<leader>hu', gitsigns.undo_stage_hunk)
-- map('n', '<leader>hR', gitsigns.reset_buffer)
-- map('n', '<leader>hp', gitsigns.preview_hunk)
-- map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
-- map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
-- map('n', '<leader>hd', gitsigns.diffthis)
-- map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
-- map('n', '<leader>td', gitsigns.toggle_deleted)
--
-- -- Text object
-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

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
