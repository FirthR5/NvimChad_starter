return {
  -- {
  --   "neoclide/coc.nvim",
  --   branch = "release",
  --   lazy = false,
  -- },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("configs.FMT.inc_rename")
    end,
  },
  -- https://github.com/mg979/vim-visual-multi
  -- https://www.reddit.com/r/neovim/comments/yizrri/nvim_alternative_for_vimvisualmulti/
  -- ============================================================
  {
    "hrsh7th/nvim-cmp",
    dependencies = require("opts.deps.nvim_cmp"),

    config = function()
      require("configs.FMT.nvim_cmp")
    end

  },

  {
    "ray-x/web-tools.nvim",
    config = function()
      require "configs.FMT.web-tools"
    end,
  },
  -- ============================================================
  -- AutoClose Tags
  -- {
  --   "windwp/nvim-ts-autotag",
  --   after = "nvim-treesitter",
  --   config = function()
  --     require "custom.plugins.nvim-ts-autotag"
  --   end,
  -- },
}
