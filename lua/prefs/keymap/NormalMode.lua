local map = vim.keymap.set
-- local keymap = vim.api.nvim_set_keymap
-- ==================================================================
-- Default
-- ==================================================================
map("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })

map("n", "<leader>o", "<cmd>Nvdash<CR>", { desc = "Nvim Dashboard", noremap = true, silent = true })

-- ==================================================================
-- Close Buffer without losing split
-- ==================================================================
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })

-- ==================================================================
-- Select All
-- ==================================================================
map("n", "<C-a>", "gg0<S-v>G$")

-- ==================================================================
-- Tab Section
-- ==================================================================
map("n", "te", "<cmd>tabedit<CR>", { desc = "Open New Tab" })
map("n", "tn", "<cmd>tabnext<CR>", { desc = "Open Next Tab" })
map("n", "tp", "<cmd>tabprev<CR>", { desc = "Open Previous Tab" })
map("n", "tw", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
map("n", "tx", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })

-- ==================================================================
-- Extenal commands
-- ==================================================================
map("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason Menu" })

map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Open Telescope" })

map("n", "<leader>mt", "<cmd>Telescope<CR>", { desc = "Open Telescope" })

map("n", "<leader>ml", "<cmd>Lazy<CR>", { desc = "Open Lazy Packer" })

map("n", "<space>mp", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { noremap = true, silent = true })

-- errors
-- map("n", "<leader>mf", "<cmd>lua vim.diagnostic.setqflist<CR>", { desc = "List Errores" })

-- ======================================
map("x", "p", '"_dP', { desc = "Replace without yanking" })
map("n", "<leader>.", "", { desc = "Core Commands" })
-- map("n", "<leader>.C", '"_C', "Change until EOL without yanking")
-- -- Using the OS clipboard
map("n", "<leader>.c", '"+y', { desc = "Yank to clipboard" }) -- E.g: <leader>yy will yank current line to os clipboard
map("n", "<leader>.C", '"+y$', { desc = "Yank until EOL to clipboard" })

-- map("n", "d", '"_D', { desc = "Delete until EOL without yanking" })
-- map("n", "d", '"_d', { desc = "Delete without yanking" }) -- e.g <leader>dd deletes the current line without yanking it

-- https://ofirgall.github.io/learn-nvim/chapters/06-splits-and-actual-tabs.html
-- Tabline binds

-- TODO: Check this plugins later
-- https://github.com/gbprod/yanky.nvim
-- https://github.com/gennaro-tedesco/nvim-peekup
-- https://github.com/tversteeg/registers.nvim
