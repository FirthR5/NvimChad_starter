local map = vim.keymap.set
-- Some Credits to: https://github.com/Brobb954/dotfiles/blob/75041a0271a48226ff80380a2f5f7f9537d53069/.config/nvim/lua/plugins/override/nvim-tree.lua

return {
  "nvim-tree/nvim-tree.lua",
  init = function()
    map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
  end,
  config = function()
    dofile(vim.g.base46_cache .. "nvimtree")

    local nvtree = require "nvim-tree"
    local api = require "nvim-tree.api"

    -- Add custom mappings
    local function custom_on_attach(bufnr)
      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)
      map("n", "+", api.tree.change_root_to_node, opts "CD")
      map("n", "?", api.tree.toggle_help, opts "Help")
      map("n", "<ESC>", api.tree.close, opts "Close")
    end

    -- Automatically open file upon creation
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd("edit " .. file.fname)
    end)

    local HEIGHT_RATIO = 0.8
    local WIDTH_RATIO = 0.5

    nvtree.setup {
      on_attach = custom_on_attach,
      sync_root_with_cwd = true,
      filters = { custom = { "^.git$" } },
      git = { enable = true },
      renderer = {
        highlight_git = true,
        icons = {
          glyphs = {
            bookmark = "󰆤",
            modified = "●",
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
            },
          },
        },
      },
      view = {
        -- Allow statuscolumn to be applied on nvim-tree
        signcolumn = "no",
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
      filesystem_watchers = {
        ignore_dirs = {
          "node_modules",
        },
      },
    }
  end,
}

-- --{
--       override = require "configs.Core.devicons",
--
--       render = {
--         highlight_opened_files = "icon",
--       },
--
--       view = {
--         centralize_selection = false,
--         cursorline = true,
--         debounce_delay = 15,
--         side = "left",
--         preserve_window_proportions = false,
--         number = true,
--         relativenumber = true,
--         width = 20,
--         float = {
--           enable = false,
--           quit_on_focus_loss = true,
--           open_win_config = {
--             relative = "editor",
--             border = "rounded",
--             width = 30,
--             height = 30,
--             row = 1,
--             col = 1,
--           },
--         },
--       },
--     }
--
-- {
--   "nvim-tree/nvim-web-devicons",
--   opts = function()
--     dofile(vim.g.base46_cache .. "devicons")
--     return {
--       override = require "configs.Core.devicons",
--     }
--   end,
--   config = function()
--     -- require("nvim-tree").view = { signcolumn = "no" }
--   end,
-- },
