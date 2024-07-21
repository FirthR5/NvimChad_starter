return {
  --   {
  --       "neoclide/coc.nvim"
  --   },
  -- {
  --   "smjonas/inc-rename.nvim",
  --   config = function()
  --     require("inc_rename").setup()
  --   end,
  -- },
  -- https://github.com/mg979/vim-visual-multi
  -- https://www.reddit.com/r/neovim/comments/yizrri/nvim_alternative_for_vimvisualmulti/
  -- ============================================================
  {
    "hrsh7th/nvim-cmp",
    -- dependencies = {
    --   -- ai based completion
    --   {
    --     "jcdickinson/codeium.nvim",
    --     config = function()  require("codeium").setup {}   end,
    --   },
    -- },
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
