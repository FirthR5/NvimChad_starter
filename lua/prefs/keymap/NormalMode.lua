-- Imports
local map = vim.keymap.set
-- local keymap = vim.api.nvim_set_keymap
-- ───────────────────────────────────────────────────────────

-- ╭──────────────────────────────────────────────────────────╮
-- │ Default                                                  │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<leader>cf", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy File Name" })
map("n", "<leader>o", "<cmd>Nvdash<CR>", { desc = "Nvim Dashboard", noremap = true, silent = true })

-- Close Buffer without losing split
-- ───────────────────────────────────────────────────────────
map("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Select All
-- ───────────────────────────────────────────────────────────
map("n", "<C-a>", "gg0<S-v>G$")

-- Tab Section
-- ───────────────────────────────────────────────────────────
map("n", "te", "<cmd>tabedit<CR>", { desc = "Open New Tab" })
map("n", "tn", "<cmd>tabnext<CR>", { desc = "Open Next Tab" })
map("n", "tp", "<cmd>tabprev<CR>", { desc = "Open Previous Tab" })
map("n", "tw", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })
map("n", "tx", "<cmd>tabclose<CR>", { desc = "Close Current Tab" })

-- errors
-- ───────────────────────────────────────────────────────────
-- map("n", "<leader>mf", "<cmd>lua vim.diagnostic.setqflist<CR>", { desc = "List Errores" })
-- ───────────────────────────────────────────────────────────

-- ╭──────────────────────────────────────────────────────────╮
-- │ Extenal commands                                         │
-- ╰──────────────────────────────────────────────────────────╯
map("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason Menu" })
map("n", "<leader>tt", "<cmd>Telescope<CR>", { desc = "Open Telescope" })
map("n", "<leader>mt", "<cmd>Telescope<CR>", { desc = "Open Telescope" })
map("n", "<leader>ml", "<cmd>Lazy<CR>", { desc = "Open Lazy Packer" })
map("n", "<space>mp", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", { noremap = true, silent = true })

-- ╭──────────────────────────────────────────────────────────╮
-- │ COPY to Clipboard                                        │
-- ╰──────────────────────────────────────────────────────────╯
-- Core
map("n", "<leader>.", "", { desc = "Core Commands" })
-- map("n", "<leader>.C", '"_C', "Change until EOL without yanking"

-- Using the OS clipboard
map("n", "<leader>.c", '"+y', { desc = "Yank to clipboard" }) -- E.g: <leader>yy will yank current line to os clipboard
map("n", "<leader>.C", '"+y$', { desc = "Yank until EOL to clipboard" })
-- ───────────────────────────────────────────────────────────

-- ╭──────────────────────────────────────────────────────────╮
-- │ REMOVE YANKING ON DEL/CHANGE/X                           │
-- ╰──────────────────────────────────────────────────────────╯

-- Delete Without Yanking
-- ───────────────────────────────────────────────────────────
map("n", "d", '"_d', { desc = "Delete without yanking" })
map("n", "dd", '"_dd', { desc = "Delete line without yanking" })
map("n", "dw", '"_dw', { desc = "Delete word without yanking" })
map("n", "diw", '"_diw', { desc = "Delete inner word without yanking" })

-- Delete without yanking for all 'd' combinations
map("n", "d0", '"_d0', { desc = "Delete to beginning of the line without yanking" })
map("n", "db", '"_db', { desc = "Delete to previous word without yanking" })
map("n", "dB", '"_dB', { desc = "Delete to previous WORD without yanking" })
map("n", "de", '"_de', { desc = "Delete to end of word without yanking" })
map("n", "dE", '"_dE', { desc = "Delete to end of WORD without yanking" })
map("n", "df", '"_df', { desc = "Delete until character forward without yanking" })
map("n", "dF", '"_dF', { desc = "Delete until character backward without yanking" })
map("n", "dG", '"_dG', { desc = "Delete to the end of the file without yanking" })

map("n", "dh", '"_dh', { desc = "Delete left (h) without yanking" })
map("n", "dj", '"_dj', { desc = "Delete down (j) without yanking" })
map("n", "dk", '"_dk', { desc = "Delete up (k) without yanking" })
map("n", "dl", '"_dl', { desc = "Delete right (l) without yanking" })
map("n", "dt", '"_dt', { desc = "Delete until character (t) without yanking" })
map("n", "dT", '"_dT', { desc = "Delete until character backward (T) without yanking" })
map("n", "dw", '"_dw', { desc = "Delete word forward without yanking" })
map("n", "dW", '"_dW', { desc = "Delete WORD forward without yanking" })
map("n", "d$", '"_d$', { desc = "Delete to end of the line without yanking" })
-- %
-- vim.keymap.set("n", "d,", '"_d,', { desc = "Delete until previous command repetition without yanking" })
map("n", "d/", '"_d/', { desc = "Delete until next search (/) without yanking" })
-- vim.keymap.set("n", "d;", '"_d;', { desc = "Delete until next command repetition without yanking" })
map("n", "d?", '"_d?', { desc = "Delete until previous search (?) without yanking" })
map("n", "d^", '"_d^', { desc = "Delete to first non-blank character (^) without yanking" })
-- vim.keymap.set("n", "d{", '"_d{', { desc = "Delete until previous paragraph ({) without yanking" })
-- vim.keymap.set("n", "d}", '"_d}', { desc = "Delete until next paragraph (}) without yanking" })
-- vim.keymap.set("n", "da", '"_da', { desc = "Delete around text object (a) without yanking" })

map("n", "dgg", '"_dgg', { desc = "Delete to the top of the file without yanking" })
-- ───────────────────────────────────────────────────────────

-- Change
-- ───────────────────────────────────────────────────────────
-- Change without yanking for base cases
map("n", "c", '"_c', { desc = "Change without yanking" })
map("n", "cc", '"_cc', { desc = "Change line without yanking" })
map("n", "cw", '"_cw', { desc = "Change word without yanking" })
map("n", "ciw", '"_ciw', { desc = "Change inner word without yanking" })

-- Change without yanking for all 'c' combinations
map("n", "c0", '"_c0', { desc = "Change to beginning of the line without yanking" })
map("n", "cb", '"_cb', { desc = "Change to previous word without yanking" })
map("n", "cB", '"_cB', { desc = "Change to previous WORD without yanking" })
map("n", "ce", '"_ce', { desc = "Change to end of word without yanking" })
map("n", "cE", '"_cE', { desc = "Change to end of WORD without yanking" })
map("n", "cf", '"_cf', { desc = "Change until character forward without yanking" })
map("n", "cF", '"_cF', { desc = "Change until character backward without yanking" })
map("n", "cG", '"_cG', { desc = "Change to the end of the file without yanking" })

map("n", "ch", '"_ch', { desc = "Change left (h) without yanking" })
map("n", "cj", '"_cj', { desc = "Change down (j) without yanking" })
map("n", "ck", '"_ck', { desc = "Change up (k) without yanking" })
map("n", "cl", '"_cl', { desc = "Change right (l) without yanking" })
map("n", "ct", '"_ct', { desc = "Change until character (t) without yanking" })
map("n", "cT", '"_cT', { desc = "Change until character backward (T) without yanking" })
map("n", "cw", '"_cw', { desc = "Change word forward without yanking" })
map("n", "cW", '"_cW', { desc = "Change WORD forward without yanking" })
map("n", "c$", '"_c$', { desc = "Change to end of the line without yanking" })
-- %
-- Change without yanking for various 'c' combinations
map("n", "c,", '"_c,', { desc = "Change until previous command repetition without yanking" })
map("n", "c;", '"_c;', { desc = "Change until next command repetition without yanking" })
map("n", "c/", '"_c/', { desc = "Change until next search (/) without yanking" })
map("n", "c?", '"_c?', { desc = "Change until previous search (?) without yanking" })
map("n", "c^", '"_c^', { desc = "Change to first non-blank character (^) without yanking" })
map("n", "c{", '"_c{', { desc = "Change until previous paragraph ({) without yanking" })
map("n", "c}", '"_c}', { desc = "Change until next paragraph (}) without yanking" })
map("n", "ca", '"_ca', { desc = "Change around text object (a) without yanking" })

-- Change to the top of the file without yanking
map("n", "cgg", '"_cgg', { desc = "Change to the top of the file without yanking" })
-- c+a+ b, B, p, s, t, w, W, ", ',(, ), <, >, [, ], `, {, }
-- d+a+ b, B, p, s, t, w, W, ", ',(, ), <, >, [, ], `, {, }

-- Change around various text objects without yanking
local objects = { "b", "B", "p", "s", "t", "w", "W", '"', "'", "<", ">", "[", "]", "`", "{", "}" }

for _, obj in ipairs(objects) do
  map("n", "ca" .. obj, '"_ca' .. obj, { desc = "Change around text object (a " .. obj .. ") without yanking" })
  map("n", "da" .. obj, '"_da' .. obj, { desc = "Delete around text object (a " .. obj .. ") without yanking" })
end

-- Change and Delete around for g, c, e (for c+g+ and d+g+)
-- c+g+ c,e,g
-- d+g+ c,e,g
local g_objects = { "c", "e", "g" }

for _, obj in ipairs(g_objects) do
  map("n", "cg" .. obj, '"_cg' .. obj, { desc = "Change around g-object (g " .. obj .. ") without yanking" })
  map("n", "dg" .. obj, '"_dg' .. obj, { desc = "Delete around g-object (g " .. obj .. ") without yanking" })
end

-- Change and Delete inside for text objects (for c+i+ and d+i+)
-- c+i+ b, B, p, s, t, w, W, ", ',(, ), <, >, [, ], `, {, }
-- d+i+ b, B, p, s, t, w, W, ", ',(, ), <, >, [, ], `, {, }
local i_objects = { "b", "B", "p", "s", "t", "w", "W", '"', "'", "(", ")", "<", ">", "[", "]", "`", "{", "}" }

for _, obj in ipairs(i_objects) do
  map("n", "ci" .. obj, '"_ci' .. obj, { desc = "Change inside text object (i " .. obj .. ") without yanking" })
  map("n", "di" .. obj, '"_di' .. obj, { desc = "Delete inside text object (i " .. obj .. ") without yanking" })
end
-- ───────────────────────────────────────────────────────────

-- Replace without Yanking (Other Modes)
-- ───────────────────────────────────────────────────────────
-- map("x", "x", '"_x', { desc = "Replace without yanking" })
-- map("x", "X", '"_X', { desc = "Replace without yanking" })

-- Delete without yanking in visual mode
-- ───────────────────────────────────────────────────────────
-- map("x", "X", '"_X', { desc = "Replace without yanking" })
-- map("v", "d", '"_d', { desc = "Delete in visual mode without yanking" })
map("v", "c", '"_c', { desc = "Change in visual mode without yanking" })

-- Optional: Shift+V in visual line mode without yanking (line-wise)
-- ───────────────────────────────────────────────────────────
map("v", "d", '"_d', { desc = "Delete line in visual line mode without yanking" })
map("v", "D", '"_D', { desc = "Delete line in visual line mode without yanking" })

-- vim.api.nvim_set_keymap("n", "ciw", '"_ciw', { desc = "Change inner word without yanking" })
-- ───────────────────────────────────────────────────────────

-- ───────────────────────────────────────────────────────────
-- Tabline binds
-- ───────────────────────────────────────────────────────────
-- https://ofirgall.github.io/learn-nvim/chapters/06-splits-and-actual-tabs.html

-- TODO: Check this plugins later
-- https://github.com/gbprod/yanky.nvim
-- https://github.com/gennaro-tedesco/nvim-peekup
-- https://github.com/tversteeg/registers.nvim
