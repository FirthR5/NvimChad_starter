local map = vim.keymap.set
-- Some Credits to: https://github.com/Brobb954/dotfiles/blob/75041a0271a48226ff80380a2f5f7f9537d53069/.config/nvim/lua/plugins/override/nvim-tree.lua

local HEIGHT_RATIO = 0.8
local WIDTH_RATIO = 0.5
local options = {
  -- on_attach = custom_on_attach,
  -- override = require "configs.Core.devicons",
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
        symlink = "",
        hidden = "󰜌",
        folder = {
          symlink = "",
          arrow_closed = "",
          arrow_open = "",
          symlink_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
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
  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt

  --   .gitconfig                  DevIconGitConfig                ctermfg=196 guifg=#f54d27
  view = {
    -- Allow statuscolumn to be applied on nvim-tree
    signcolumn = "no",
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 15,
    side = "left",
    preserve_window_proportions = false,
    number = true,
    relativenumber = true,

    -- width = 25,
    -- ============================================================
    -- Float Tree
    -- float = {
    --   enable = true,
    --   open_win_config = function()
    --     local screen_w = vim.opt.columns:get()
    --     local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
    --     local window_w = screen_w * WIDTH_RATIO
    --     local window_h = screen_h * HEIGHT_RATIO
    --     local window_w_int = math.floor(window_w)
    --     local window_h_int = math.floor(window_h)
    --     local center_x = (screen_w - window_w) / 2
    --     local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
    --     return {
    --       border = "rounded",
    --       relative = "editor",
    --       row = center_y,
    --       col = center_x,
    --       width = window_w_int,
    --       height = window_h_int,
    --     }
    --   end,
    -- },
    -- width = function()
    --   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    -- end,
    -- Float Tree
    -- ============================================================
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  opts = options,
}
