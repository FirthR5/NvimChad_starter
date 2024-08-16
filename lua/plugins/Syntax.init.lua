local lua_snippets = require "configs.Syntax.LSP_cmp.lua_snippets"
local commment = require "configs.Syntax.comment"
local colorizer = require "configs.Syntax.colorizer"
local conform = require "configs.Syntax.LSP_cmp.conform"
-- local coc = require "configs.FMT.coc"
local cmp = require "configs.Syntax.LSP_cmp.nvim_cmp"
local inc_rename = require "configs.Syntax.inc_rename"
local tsAutoTag = require "configs.Syntax.LSP_cmp.tsAutoTag"
-- local lspkind = require "configs.FMT.LSP_cmp.lspkind"
-- local codium = require "configs.FMT.LSP_cmp.AI_Codium"
-- local vimrazor = require "configs.FMT.vim-razor"
local denseAnalaysisALE = require "configs.Syntax.dense-analysis-ALE"

local snippets = {

  -- ==================================================================
  -- Default by NvChad
  -- ==================================================================
  colorizer,
  conform,
  lua_snippets, --            | cmp
  cmp,
  --| nvim-autopairs          |
  --| friendly-snippets.nvim  | cmp
  --| plenary.nvim            | inc-rename
  --| indent-blankline.nvim   |
  tsAutoTag,

  -- ==================================================================
  -- Formatter
  -- ==================================================================
  commment,
  -- coc,
  -- codium,
  inc_rename,

  --lspkind,
  -- vimrazor,
  -- template: https://github.com/nvimdev/template.nvim

  denseAnalaysisALE,
}

return snippets
