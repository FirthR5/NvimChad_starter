local lua_snippets = require "configs.FMT.lua_snippets"
local commment = require "configs.FMT.comment"
local colorizer = require "configs.FMT.colorizer"
local conform = require "configs.FMT.conform"
-- local coc = require "configs.FMT.coc"
local cmp = require "configs.FMT.nvim_cmp"
local inc_rename = require "configs.FMT.inc_rename"
local tsAutoTag = require "configs.FMT.tsAutoTag"
local lspkind = require "configs.FMT.lspkind"
local codium = require "configs.FMT.AI_Codium"
local vimrazor = require "configs.FMT.vim-razor"

local snippets = {

  -- ==================================================================
  -- Default by NvChad
  -- ==================================================================/
  colorizer,
  conform,
  lua_snippets, --    | cmp
  cmp,
  --| nvim-autopairs
  --| friendly-snippets.nvim | cmp
  --| plenary.nvim     | inc-rename
  --| indent-blankline.nvim
  tsAutoTag,

  -- ============================================================
  -- Formatter
  -- ==================================================================
  commment,
  -- coc,
  -- codium,
  inc_rename,
  --lspkind,
  -- vimrazor,
}

return snippets
