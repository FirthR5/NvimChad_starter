function MySetup()
  -- Aquí puedes añadir configuración adicional si es necesario
  -- require "configs.EXT."
end

function Cmd()
  return {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  }
end
-- optional for floating window border decoration
function Dependencies()
  return {
    "nvim-lua/plenary.nvim",
  }
end
-- setting the keybinding for LazyGit with 'keys' is recommended in
-- order to load the plugin when the command is run for the first time
function MyKeys()
  return {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  }
end

local M = {}
M = {
  "kdheepak/lazygit.nvim",
  cmd = Cmd(),
  dependencies = Dependencies(),
  keys = MyKeys(),
  -- config = require("configs.EXT.lazygit").setup(),
}
return M
