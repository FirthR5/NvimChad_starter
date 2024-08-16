local keybinds = require "prefs.keymap.plug.MASON_DAP"
-- DAP Keybindings with Which-Key https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/dap.lua

local deps = {
  "nvim-neotest/nvim-nio",
  config = function()
    require("dapui").setup()
  end,
}

return {
  "mfussenegger/nvim-dap",
  dependencies = deps,
  keys = keybinds,
}

-- # https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#dotnet
-- https://github.com/mfussenegger/nvim-dap?tab=readme-ov-file
-- https://www.lazyvim.org/extras/dap/core
-- =================================================================================

-- luego
-- https://mcalvaro.medium.com/configuracion-de-nvim-dap-en-neovim-guia-paso-a-paso-para-principiantes-4564429022cb
-- 2. https://mcalvaro.medium.com/configuracion-de-nvim-dap-en-neovim-javascript-typescript-debugging-c62e286b4c64
-- 3, https://mcalvaro.medium.com/configuracion-de-nvim-dap-en-neovim-depuracion-de-php-con-xdebug-e8aa059e3ec6
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#dotnet
