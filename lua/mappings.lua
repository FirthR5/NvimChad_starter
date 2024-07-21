require "nvchad.mappings"
local map = vim.keymap.set

-- ====== Normal Mode =======
-- require "keymap.addons_binding"
require "prefs.keymap.NormalMode"

-- ======= Inserts Mode =====
require "prefs.keymap.InsertMode"

---- comments
-- Normal:  gcc, gbc, gco,gcO, gcA
-- Visual: gc, gb,
