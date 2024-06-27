-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

local logos = require "core.MenuLogo"
-- https://github.com/Alexis12119/nvim-config/blob/main/lua/chadrc.lua#L159
local function concatWithSpace(list1, list2)
  -- Creamos una nueva lista vacía para almacenar la concatenación
  local concatenatedList = {}

  -- Iteramos sobre la primera lista y agregamos cada elemento a la nueva lista
  for _, line in ipairs(list1) do
    table.insert(concatenatedList, line)
  end

  -- Agregamos un espacio en blanco en la nueva lista
  table.insert(concatenatedList, "")

  -- Iteramos sobre la segunda lista y agregamos cada elemento a la nueva lista
  for _, line in ipairs(list2) do
    table.insert(concatenatedList, line)
  end

  -- Devolvemos la lista concatenada con un espacio en blanco entre las dos listas
  return concatenatedList
end

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
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
    --LspReferenceRead = { link = "Underlined" },
    --LspReferenceText = { link = "Underlined" },
    --LspReferenceWrite = { link = "Underlined" },
    --TblineFill = { link = "Normal" },
    --NvimTreeRootFolder = { link = "NvimTreeFolderName" },
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
  --

  -- https://github.com/NvChad/NvChad/discussions/2445
}

--vim.api.nvim_set_hl(0, "NvDashAscii", { fg = "#FFFFFF", bg = "NONE" })

-- https://github.com/NvChad/NvChad/issues/1656
M.ui.lsp = { signature = false }

return M

-- MUST READ
-- https://linuxize.com/post/vim-find-replace/
-- https://learnvim.irian.to/basics/macros
