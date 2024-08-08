-- https://github.com/mrjones2014/legendary.nvim
local M = {}
local options = {

  keymaps = require("prefs.keymap.plug.IDE_Keys").legendary,
  autocmds = {
    -- Create autocmds and augroups
    { "BufWritePre", vim.lsp.buf.format, description = "Format on save" },
    {
      name = "MyAugroup",
      clear = true,
      -- autocmds here
    },
  },
  extensions = {
    -- automatically load keymaps from lazy.nvim's `keys` option
    lazy_nvim = true,
    -- load keymaps and commands from nvim-tree.lua

    -- nvim_tree = true,
    -- load commands from smart-splits.nvim
    -- and create keymaps, see :h legendary-extensions-smart-splits.nvim
    -- smart_splits = {
    --   directions = { "h", "j", "k", "l" },
    --   mods = {
    --     move = "<C>",
    --     resize = "<M>",
    --   },
    -- },

    -- https://github.com/mrjones2014/smart-splits.nvim
    -- load commands from op.nvim
    op_nvim = true,
    -- load keymaps from diffview.nvim
    diffview = true,
  },
  scratchpad = {
    view = "float",
    results_view = "float",
  },
}

M = {
  "mrjones2014/legendary.nvim",
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("legendary").setup(options)
  end,
  -- sqlite is only needed if you want to use frecency sorting
  -- dependencies = { 'kkharji/sqlite.lua' }
}

return M
