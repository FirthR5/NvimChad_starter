local options = {
  presets = { inc_rename = true },
  -- input_buffer_type = "dressing",
}

local M = {}

M = {
  "smjonas/inc-rename.nvim",
  lazy = true,
  dependencies = { "nvim-lua/plenary.nvim" }, -- Default by NvChad
  config = function()
    require("inc_rename").setup(options)
    local keybinds = require("prefs.keymap.plug.LSP_Keys").IncRename
    vim.keymap.set("n", keybinds.rename, ":IncRename ", { silent = true })
  end,
}

return M

-- vim.keymap.set("n", "<leader>rr", function()
--   return ":IncRename " .. vim.fn.expand("<cword>")
-- end, { expr = true })
