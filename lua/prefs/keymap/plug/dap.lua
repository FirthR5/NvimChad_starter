-- Configuración de los atajos de teclado para nvim
-- local map = vim.keymap.set
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Añadir breakpoint en la línea actual
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)
vim.api.nvim_set_keymap(
  "n",
  "<leader>d1",
  "<cmd>DapToggleBreakpoint<CR>",
  { noremap = true, silent = true, desc = "Add breakpoint at line" }
)

-- Iniciar o continuar el depurador
map("n", "<leader>dr", "<cmd>DapContinue<CR>", opts)
vim.api.nvim_set_keymap(
  "n",
  "<leader>d2",
  "<cmd>DapContinue<CR>",
  { noremap = true, silent = true, desc = "Start or continue the debugger" }
)
