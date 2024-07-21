local snippets = {
  -- ============================================================
  -- Formatter
  {
    -- https://www.josean.com/posts/neovim-linting-and-formatting
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- ============================================================
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  -- Cursor
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
  -- Foldable
  -- -- https://github.com/anuvyklack/pretty-fold.nvim
  --   use{ 'anuvyklack/pretty-fold.nvim',
  --      config = function()
  --         require('pretty-fold').setup()
  --      end
  --   }
}

return snippets
