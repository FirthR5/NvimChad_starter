local map = vim.keymap.set

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5
local options = {
  sync_root_with_cwd = true,
  git = { enable = true },
  filters = { custom = { "^.git$" }, dotfiles = false },
  filesystem_watchers = {
    ignore_dirs = {
      "node_modules",
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    full_name = false,
    symlink_destination = true,

    highlight_git = true,
    highlight_opened_files = "icon",
    special_files = { "README.md", "Makefile", "TODO" },
    icons = {
      glyphs = {
        bookmark = "󰆤",
        modified = "●",
        symlink = "",
        hidden = "󰜌",
        folder = {
          symlink = "",
          arrow_closed = "",
          arrow_open = "",
          symlink_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
        },
      },
      git_placement = "before",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
        hidden = false,
        diagnostics = true,
        bookmarks = true,
      },
    },
  },
  view = {
    signcolumn = "no",
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 15,
    side = "left",
    preserve_window_proportions = false,
    number = true,
    relativenumber = true,
  },
}

return options
