local map = vim.keymap.set

map("i", "jk", "<esc>")
map("i", "<c-z>", "<c-o>u", { desc = "undo" })
map("i", "<c-g>", "<Esc>o")
