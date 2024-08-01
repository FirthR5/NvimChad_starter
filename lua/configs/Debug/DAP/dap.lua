local keybinds = {
  { "<leader>dd", "", desc = "+debug", mode = { "n", "v" } },
  {
    "<leader>dB",
    function()
      require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end,
    desc = "Breakpoint Condition",
  },
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "Continue",
  },
  {
    "<leader>da",
    function()
      require("dap").continue { before = get_args }
    end,
    desc = "Run with Args",
  },
  {
    "<leader>dC",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "Run to Cursor",
  },
  {
    "<leader>dg",
    function()
      require("dap").goto_()
    end,
    desc = "Go to Line (No Execute)",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<leader>dj",
    function()
      require("dap").down()
    end,
    desc = "Down",
  },
  {
    "<leader>dk",
    function()
      require("dap").up()
    end,
    desc = "Up",
  },
  {
    "<leader>dl",
    function()
      require("dap").run_last()
    end,
    desc = "Run Last",
  },
  {
    "<leader>do",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
  },
  {
    "<leader>dO",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<leader>dp",
    function()
      require("dap").pause()
    end,
    desc = "Pause",
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.toggle()
    end,
    desc = "Toggle REPL",
  },
  {
    "<leader>ds",
    function()
      require("dap").session()
    end,
    desc = "Session",
  },
  {
    "<leader>dt",
    function()
      require("dap").terminate()
    end,
    desc = "Terminate",
  },
  {
    "<leader>dw",
    function()
      require("dap.ui.widgets").hover()
    end,
    desc = "Widgets",
  },
}
local deps = {
  "mfussenegger/nvim-dap",
  "nvim-neotest/nvim-nio",
  config = function()
    require("dapui").setup()
  end,
}

return {
  "mfussenegger/nvim-dap",
  dependencies = deps,
  keys = keybinds,
  config = function(_, _)
    -- require("core.utils").load_mappings "dap"
  end,
}

-- # https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#dotnet
-- https://github.com/mfussenegger/nvim-dap?tab=readme-ov-file
-- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
-- https://www.lazyvim.org/extras/dap/core
-- https://github.com/jay-babu/mason-nvim-dap.nvim?tab=readme-ov-file#configuration
