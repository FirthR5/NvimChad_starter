local telescope = require "telescope"

local options = {
  extensions = {
    aerial = {
      -- Display symbols as <root>.<parent>.<symbol>
      show_nesting = {
        ["_"] = false, -- This key will be the default
        json = true, -- You can set the option for specific filetypes
        yaml = true,
      },
      -- Available modes: symbols, lines, both
      show_columns = "both",
    },
    live_grep_args = {
      auto_quoting = true,
      mappings = require("prefs.keymap.plug.telescope").telescope,
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
  },
}

local M = {}
function M.Setup()
  telescope.setup(options)
  -- ====================================================
  telescope.load_extension "live_grep_args"
  -- ====================================================
  -- telescope.load_extension "aerial"
  require("telescope").load_extension "aerial"
  -- ====================================================
  -- Key Maps
  -- require("telescope").load_extension "keymaps_nvim"
  --require("telescope").extensions.keymaps_nvim.keymaps_nvim()
  -- ====================================================
end
M.dependencies = {
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    -- This will not install any breaking changes. -- For major updates, this must be adjusted manually.
    version = "^1.0.0",
  },
}

return M
