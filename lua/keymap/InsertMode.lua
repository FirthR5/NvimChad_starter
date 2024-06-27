local map = vim.keymap.set

map("i", "jk", "<esc>")
map("i", "<c-z>", "<c-o>u", { desc = "undo" })
map("i", "<c-g>", "<Esc>o")

--map("i", "<c-k>", "<up>", { desc = "move up" })
-- map({ "n", "i", "v" }, "<c-s>", "<cmd> w <cr>")
--local nomap = vim.keymap.del
