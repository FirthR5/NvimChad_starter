-- DAP: Debugger Adapter Protocol
local dap_keybinds = require "keymaps.dap"

return {
  -- ─── nvim-dap ──────────────────────────────────────────────────────────────
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-neotest/nvim-nio",
    },
    keys = dap_keybinds,
  },

  -- ─── mason-nvim-dap ───────────────────────────────────────────────────────
  {
    "jay-babu/mason-nvim-dap.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      require("config.dap").setup_mason_dap()
    end,
  },

  -- ─── nvim-dap-ui ──────────────────────────────────────────────────────────
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("config.dap").setup_dap_ui()
    end,
  },
}
