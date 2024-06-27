return {
  -- Formatter
  {
    -- https://www.josean.com/posts/neovim-linting-and-formatting
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- Notifications
  {
    "rcarriga/nvim-notify",
    lazy = false,
    opts = {
      timeout = 200,
      background_color = "blue",
      render = "wrapped-compact",
    },
    config = function()
      vim.opt.termguicolors = true
      require("notify").setup {
        background_colour = "#58afe8",
      }
      --require('telescope').extensions.notify.setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "smjonas/inc-rename.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
            ["vim.lsp.util.stylize_markdown"] = false,
            ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
            hover = { enabled = true }, -- <-- HERE!
            signature = { enabled = true }, -- <-- HERE!
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true, -- use a classic bottom cmdline for search
          command_palette = true, -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },

        routes = {
          {
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
      }
    end,
  },

  -- {
  --   "smjonas/inc-rename.nvim",
  --   config = function()
  --     require("inc_rename").setup()
  --   end,
  -- },
  -- https://github.com/mg979/vim-visual-multi
  -- https://www.reddit.com/r/neovim/comments/yizrri/nvim_alternative_for_vimvisualmulti/
  -- {
  --   "mg979/vim-visual-multi",
  --   branch = "master",
  --   lazy = false,
  --   init = function()
  --     vim.g.VM_Maps = {
  --       ["Find Under"] = "<C-l>"
  --     }
  --   end
  -- },
  -- -- https://github.com/anuvyklack/pretty-fold.nvim
  --   use{ 'anuvyklack/pretty-fold.nvim',
  --      config = function()
  --         require('pretty-fold').setup()
  --      end
  --   }

  -- TODO: Add NeoTests for HTTP re
}
