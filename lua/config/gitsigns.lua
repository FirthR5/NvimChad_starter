local keymaps = require("keymaps.git").gitsigns

local opts = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┆" },
  },
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
  on_attach = function(bufnr)
    vim.keymap.set("n", keymaps.prev_hunk, require("gitsigns").prev_hunk, { buffer = bufnr, desc = "[H]unk previous" })
    vim.keymap.set("n", keymaps.next_hunk, require("gitsigns").next_hunk, { buffer = bufnr, desc = "[H]unk next" })
    vim.keymap.set("n", keymaps.preview_hunk, require("gitsigns").preview_hunk, { buffer = bufnr, desc = "[H]unk preview" })
  end,
}

return {
  opts = opts,
}
