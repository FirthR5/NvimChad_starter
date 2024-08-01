local handlers = {
  function(config)
    -- all sources with no handler get passed here

    -- Keep original functionality
    require("mason-nvim-dap").default_setup(config)
  end,
  python = function(config)
    config.adapters = {
      type = "executable",
      command = "C:/Users/RFF-07/scoop/apps/python/current/python3.exe",
      args = {
        "-m",
        "debugpy.adapter",
      },
    }
    require("mason-nvim-dap").default_setup(config)
  end,
  firefox = function()
    require("mason-nvim-dap").setup { ensure_installed = { "firefox", "node2" } }
  end,
}

return {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    handlers = {},
  },
  config = function()
    local options = {
      ensure_installed = { "stylua", "jq" },
      handlers = handlers, -- sets up dap in the predefined manner
    }

    require("mason-nvim-dap").setup(options)
  end,
}
