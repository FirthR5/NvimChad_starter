local map = vim.keymap.set

-- Default
-- CMD
-- map("n", ";", ":",
-- { desc = "CMD enter command mode" })

map("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })

map("n", "<leader>o", "<cmd>Nvdash<CR>", { desc = "Nvim Dashboard", noremap = true, silent = true })

-- Close Buffer without losing split
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Select All
map("n", "<C-a>", "gg0<S-v>G$")

-- Tab Section
map("n", "te", "<cmd>tabedit<CR>", { desc = "Open New Tab" })
map("n", "tn", "<cmd>tabnext<CR>", { desc = "Open Next Tab" })
map("n", "tp", "<cmd>tabprev<CR>", { desc = "Open Previous Tab" })
map("n", "tw", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })

-- Extenal commands
map("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason Menu" })

map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Open Telescope" })

map("n", "<leader>mt", "<cmd>Telescope<CR>", { desc = "Open Telescope" })

map("n", "<leader>ml", "<cmd>Lazy<CR>", { desc = "Open Lazy Packer" })

map("n", "<space>mp", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { noremap = true, silent = true })
-- errors
-- map("n", "<leader>mf", "<cmd>lua vim.diagnostic.setqflist<CR>", { desc = "List Errores" })

-- ======================================
-- map("x", "<leader>p", '"_dP', "Replace without yanking")
-- map("n", "<leader>d", '"_d', "Delete without yanking") -- e.g <leader>dd deletes the current line without yanking it
-- map("n", "<leader>D", '"_D', "Delete until EOL without yanking")

-- map("n", "<leader>c", '"_c', "Change without yanking")
-- map("n", "<leader>C", '"_C', "Change until EOL without yanking")

-- -- Using the OS clipboard

-- map("", "<leader>y", '"+y', "Yank to clipboard") -- E.g: <leader>yy will yank current line to os clipboard
-- map("", "<leader>Y", '"+y$', "Yank until EOL to clipboard")

-- map("n", "<leader>p", '"+p', "Paste after cursor from clipboard")
-- map("n", "<leader>P", '"+P', "Paste before cursor from clipboard")

-- https://ofirgall.github.io/learn-nvim/chapters/06-splits-and-actual-tabs.html
-- Tabline binds
-- map("n", "<C-q>", function()
--   require("bufdelete").bufdelete(0, true)
-- end) -- shift+Quit to close current tab
--
-- map("n", "g1", function()
--   require("bufferline").go_to_buffer(1, true)
-- end)
--
-- map("n", "g2", function()
--   require("bufferline").go_to_buffer(2, true)
-- end)
--
-- map("n", "g3", function()
--   require("bufferline").go_to_buffer(3, true)
-- end)
--
-- map("n", "g4", function()
--   require("bufferline").go_to_buffer(4, true)
-- end)
--
-- map("n", "g5", function()
--   require("bufferline").go_to_buffer(5, true)
-- end)
--
-- map("n", "g6", function()
--   require("bufferline").go_to_buffer(6, true)
-- end)
--
-- map("n", "g7", function()
--   require("bufferline").go_to_buffer(7, true)
-- end)
--
-- map("n", "g8", function()
--   require("bufferline").go_to_buffer(8, true)
-- end)
--
-- map("n", "g9", function()
--   require("bufferline").go_to_buffer(9, true)
-- end)
--
-- map("n", "g0", function()
--   require("bufferline").go_to_buffer(10, true)
-- end)
--
-- TODO: Check this plugins later
-- https://github.com/gbprod/yanky.nvim
-- https://github.com/gennaro-tedesco/nvim-peekup
-- https://github.com/tversteeg/registers.nvim
