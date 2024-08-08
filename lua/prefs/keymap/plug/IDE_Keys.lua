local M = {}

M.shade = {
  brightness_up = "<C-Up>",
  brightness_down = "<C-Down>",
  toggle = "<Leader>s",
}

M.legendary = {
  -- TODO: Add Personalized Keybindings \\ https://github.com/mrjones2014/legendary.nvim?tab=readme-ov-file#quickstart
  { "<leader>Lk", ":Legendary keymaps<CR>", description = "Legendary: Keymaps" },
}

return M
