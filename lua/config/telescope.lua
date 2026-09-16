local telescope = require "telescope"

local options = {
  extensions = {
    aerial = {
      show_nesting = {
        ["_"] = false,
        json = true,
        yaml = true,
      },
      show_columns = "both",
    },
    live_grep_args = {
      auto_quoting = true,
      mappings = require("keymaps.telescope").live_grep_args,
    },
    file_explorer = {
      theme = "ivy",
      hijack_netrw = true,
      group_folders = true,
      --mappings = require("keymaps.telescope").file_explorer,
      mappings = {
        ["<CR>"] = "file_browser_execute",
      },
    },
  },
}

local M = {}

function M.setup()
  telescope.setup(options)
  telescope.load_extension "live_grep_args"
  telescope.load_extension "aerial"
end

return M
