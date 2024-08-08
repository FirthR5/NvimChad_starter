local M = {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    on_attach = function(bufnr)
      local keybinds = require("prefs.keymap.plug.EXT_MISC").gitsigns
      vim.keymap.set(
        "n",
        keybinds.prev_hunk,
        require("gitsigns").prev_hunk,
        { buffer = bufnr, desc = "[H]unk previous" }
      )
      vim.keymap.set("n", keybinds.next_hunk, require("gitsigns").next_hunk, { buffer = bufnr, desc = "[H]unk next" })
      vim.keymap.set(
        "n",
        keybinds.preview_hunk,
        require("gitsigns").preview_hunk,
        { buffer = bufnr, desc = "[H]unk preview" }
      )
    end,
  },
}

return M
