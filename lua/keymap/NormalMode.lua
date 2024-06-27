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
