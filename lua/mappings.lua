require "nvchad.mappings"
local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- ====== Normal Mode =======
require "keymap.addons_binding"
require "keymap.NormalMode"

-- ======= Inserts Mode =====
require "keymap.InsertMode"

---- comments
-- Normal: gcc, gbc, gco,gcO,gcA
-- Visual: gc, gb,
