-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

local logos = require "opts.MenuLogo"
-- https://github.com/Alexis12119/nvim-config/blob/main/lua/chadrc.lua#L159
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

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin", -- "rxyhn",
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
    NvimTreeRootFolder = { link = "NvimTreeFolderName" },
  },

  tabufline = {
    enabled = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = {
      blank = function()
        return "%#Normal#" .. "%=" -- empty space
      end,
    },
  },
  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.3, vsp = 0.2 },
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 0.5,
      height = 0.4,
      border = "single",
    },
  },
  nvdash = {
    load_on_startup = true,
    header = logos["pacman"],
    --header = concatWithSpace(logos["CR7"], logos["nvim"]),

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
  cheatsheet = { theme = "grid" }, -- simple/grid
}

--vim.api.nvim_set_hl(0, "NvDashAscii", { fg = "#FFFFFF", bg = "NONE" })

-- https://github.com/NvChad/NvChad/issues/1656
M.ui.lsp = { signature = false }

return M

-- MUST READ
-- https://linuxize.com/post/vim-find-replace/
-- https://learnvim.irian.to/basics/macros
