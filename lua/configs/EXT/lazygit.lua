local M = {}

function M.setup()
  -- Aquí puedes añadir configuración adicional si es necesario
  -- require "configs.EXT."
end

function M.cmd()
  return {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  }
end
-- optional for floating window border decoration
function M.dependencies()
  return {
    "nvim-lua/plenary.nvim",
  }
end
-- setting the keybinding for LazyGit with 'keys' is recommended in
-- order to load the plugin when the command is run for the first time
function M.keys()
  return {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  }
end

return M
