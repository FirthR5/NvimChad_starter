local M = {}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Trouble                                                  │
-- ╰──────────────────────────────────────────────────────────╯
M.trouble = {
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

-- ╭──────────────────────────────────────────────────────────╮
-- │ Ranger                                                   │
-- ╰──────────────────────────────────────────────────────────╯
function M.ranger()
  local ranger_nvim = require "ranger-nvim"
  vim.api.nvim_set_keymap("n", "<leader>rf", "", {
    desc = "open ranger",
    noremap = true,
    callback = function()
      require("ranger-nvim").open(true)
    end,
  })
end

-- ╭──────────────────────────────────────────────────────────╮
-- │ Tmux Navigator                                           │
-- ╰──────────────────────────────────────────────────────────╯
M.tmux_nav = {
  { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  -- Resize Tmux with Alt- Arrow Keys
  --[[{ "<M-Up>", "<cmd><C-U>TmuxResizeUp<cr>" },
  { "<M-Down>", "<cmd><C-U>TmuxResizeDown<cr>" },
  { "<M-Left>", "<cmd><C-U>TmuxResizeLeft<cr>" },
  { "<M-Right>", "<cmd><C-U>TmuxResizeRight<cr>" },
  ]]
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ DadbodUI                                                 │
-- ╰──────────────────────────────────────────────────────────╯
M.dadbod_ui = {
  {
    "<leader>db",
    "<cmd>NvimTreeClose<cr><cmd>tabnew<cr><bar><bar><cmd>DBUI<cr>",
  },
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Goto Preview                                             │
-- ╰──────────────────────────────────────────────────────────╯
function M.goto_preview()
  vim.api.nvim_set_keymap(
    "n",
    "gpd",
    '<cmd>lua require("goto-preview").goto_preview_definition()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpt",
    '<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpi",
    '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpD",
    '<cmd>lua require("goto-preview").goto_preview_declaration()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gP",
    '<cmd>lua require("goto-preview").close_all_win()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpr",
    '<cmd>lua require("goto-preview").goto_preview_references()<CR>',
    { noremap = true, silent = true }
  )
end

-- ╭──────────────────────────────────────────────────────────╮
-- │ Shade                                                    │
-- ╰──────────────────────────────────────────────────────────╯
M.shade = {
  brightness_up = "<C-Up>",
  brightness_down = "<C-Down>",
  toggle = "<Leader>s",
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Legendary                                                │
-- ╰──────────────────────────────────────────────────────────╯
M.legendary = {
  { "<leader>Lk", ":Legendary keymaps<CR>", description = "Legendary: Keymaps" },
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ TimeSpent                                                │
-- ╰──────────────────────────────────────────────────────────╯
M.timespent = {
  "<leader>ts",
  "<cmd>:ShowTimeSpent<cr>",
}

return M
