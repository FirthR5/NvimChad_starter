local lua_snippets = require "configs.FMT.lua_snippets"
local commment = require "configs.FMT.comment"
local colorizer = require "configs.FMT.colorizer"
local conform = require "configs.FMT.conform"
local coc = require "configs.FMT.coc"
local cmp = require "configs.FMT.nvim_cmp"
local inc_rename = require "configs.FMT.inc_rename"
local tsAutoTag = require "configs.FMT.tsAutoTag"
local lspkind = require "configs.FMT.lspkind"

local snippets = {
  -- ============================================================
  -- Formatter
  conform,
  colorizer,
  lua_snippets,
  commment,
  coc,
  cmp,
  inc_rename,
  --lspkind,
  --tsAutoTag,

  -- ============================================================
  -- -- https://github.com/mg979/vim-visual-multi
  -- https://www.reddit.com/r/neovim/comments/yizrri/nvim_alternative_for_vimvisualmulti/
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
