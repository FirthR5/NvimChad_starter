local trouble = require "configs.EXT.trouble"
local ranger = require "configs.EXT.ranger"
local lazygit = require "configs.EXT.lazygit"
local gitsigns = require "configs.EXT.gitsigns"
local dadbotUI = require "configs.EXT.dadbotUI"
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
  web_tools,
}

return plugins
