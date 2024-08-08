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
    "nvim-lua/plenary.nvim", -- Default by NvChad
  }
end

local M = {}
M = {
  "kdheepak/lazygit.nvim",
  cmd = Cmd(),
  dependencies = Dependencies(),
  keys = require("prefs.keymap.plug.EXT_MISC").lazygit,
  -- config = require("configs.EXT.lazygit").setup(),
}
return M
