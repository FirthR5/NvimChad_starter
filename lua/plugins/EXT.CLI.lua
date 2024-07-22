local trouble = require "configs.EXT.trouble"
local ranger = require "configs.EXT.ranger"
local lazygit = require "configs.EXT.lazygit"
local gitsigns = require "configs.EXT.gitsigns"
local dadbotUI = require "configs.EXT.dadbotUI"
local keymaps = require "configs.TERM.keymaps"
local legendary = require "configs.TERM.legendary"
local web_tools = require "configs.EXT.web_tools"

local plugins = {
  -- ==================================================================
  -- External software integration
  -- ==================================================================
  ranger,
  trouble,
  -- ==================================================================
  -- Lazy GIT
  lazygit,
  gitsigns,
  -- Rest Nvim
  --dadbotUI,
  -- keymaps,
  legendary,
  web_tools,
  -- ==================================================================
  -- TODO: CHECK OUT
  -- {--https://github.com/sindrets/diffview.nvim?tab=readme-ov-file
  --   "sindrets/diffview.nvim",
  --
  -- },
  -- .dap

  -- obsidian
  -- zenmode
  -- codesnap
  -- harpoon
}

return plugins
