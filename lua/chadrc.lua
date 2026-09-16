-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

-- Import All Logos i saved
local logos = require "util.logo"

-- Cancatenate two logos
local function concatWithSpace(list1, list2)
  local concatenatedList = {}
  for _, line in ipairs(list1) do
    table.insert(concatenatedList, line)
  end
  table.insert(concatenatedList, "")
  for _, line in ipairs(list2) do
    table.insert(concatenatedList, line)
  end
  return concatenatedList
end


M.base46 = {
  theme = "onenord", -- "rxyhn",
  theme_toggle = { "mountain", "one_light" },
  transparency = true,

  hl_override = {
    Comment = {
      italic = true,
    },
    Pmenu = { bg = "white" },
    -- MyHighlightGroup = { -- custom highlights are also allowed
    --       fg = "red",
    --       bg = "darker_black"
    --    }
    ["@comment"] = { italic = true },

    Search = { fg = "black", bg = "NONE" },
    IncSearch = { fg = "black", bg = "NONE" },
    CurSearch = { fg = "black", bg = "NONE" },
    -- Substitute = { fg = "black", bg = "NONE" },

    NvDashAscii = { bg = "NONE", fg = "NONE" },
    NvDashButtons = { bg = "NONE" }, -- This can make transparent the background

    -- FoldColumn = { bg = "NONE" },
    LspReferenceRead = { link = "Underlined" },
    LspReferenceText = { link = "Underlined" },
    LspReferenceWrite = { link = "Underlined" },
    --TblineFill = { link = "Normal" },
    -- NvimTreeRootFolder = { link = "NvimTreeFolderName" },
  },
}

M.ui = {
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
  },
  tabufline = {
    enabled = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
  },
}

M.term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.1, vsp = 0.1 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
}

M.nvdash = {
    load_on_startup = true,
    header = logos["chad"],
    -- header = concatWithSpace(logos["CR7"], logos["nvim"]),

    buttons = {
      { txt = "  Find File", keys = "ff", cmd = "Telescope find_files hidden=true<cr>" },
      { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles hidden=true<cr>" },
      { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep hidden=true<cr>" },
      { txt = "  Bookmarks", keys = "ma", cmd = "Telescope marks" },
      { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
      { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

      { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

      {
        txt = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime) .. " ms"
          return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
        end,
        hl = "NvDashFooter",
        no_gap = true,
        content = "fit",
      },
    },
}

M.cheatsheet = { theme = "grid" } -- simple/grid
M.lsp = { signature = false }

return M

-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- https://github.com/Alexis12119/nvim-config/blob/main/lua/chadrc.lua#L159
-- MUST READ
-- https://linuxize.com/post/vim-find-replace/
-- https://learnvim.irian.to/basics/macros
