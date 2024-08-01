-- https://github.com/windwp/nvim-ts-autotag
local options = {
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false, -- Auto close on trailing </
  },
  per_filetype = {
    ["html"] = {
      enable_close = true,
    },
    ["markdown"] = {
      enable_close = true,
    },
    ["typescript"] = {
      enable_close = true,
    },
    ["vue"] = {
      enable_close = true,
    },
  },
}

local M = {
  "windwp/nvim-ts-autotag",
  after = "nvim-treesitter",
  config = function()
    require("nvim-ts-autotag").setup(options)
  end,
}

return M
