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
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

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
  -- toggle_current_line_blame = true
}

return M
