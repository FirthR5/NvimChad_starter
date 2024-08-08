function keybinds()
  -- ~/.config/nvim/lua/custom/mappings.lua
  -- Mapeos para el plugin goto-preview
  vim.api.nvim_set_keymap(
    "n",
    "gpd",
    '<cmd>lua require("goto-preview").goto_preview_definition()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpt",
    '<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpi",
    '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpD",
    '<cmd>lua require("goto-preview").goto_preview_declaration()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gP",
    '<cmd>lua require("goto-preview").close_all_win()<CR>',
    { noremap = true, silent = true }
  )
  vim.api.nvim_set_keymap(
    "n",
    "gpr",
    '<cmd>lua require("goto-preview").goto_preview_references()<CR>',
    { noremap = true, silent = true }
  )
end
