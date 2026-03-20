local mason_dap_settings = {
  ensure_installed = { "python", "stylua", "jq", "firefox" },
  automatic_installation = true,
}

local function setup_mason_dap()
  require("mason-nvim-dap").setup(mason_dap_settings)

  local dap = require "dap"

  -- Python
  require("dap-python").setup "~/.myenv/bin/python"
  dap.configurations.python = {
    {
      name = "Launch file",
      type = "python",
      request = "launch",
      program = "${file}",
      pythonPath = function()
        return "/usr/bin/python3"
      end,
    },
  }
end

local function setup_dap_ui()
  local dap = require "dap"
  local dapui = require "dapui"
  dapui.setup()

  dap.listeners.before.attach.dapui_config = function()
    vim.notify "Attaching to debugger"
  end

  dap.listeners.before.launch.dapui_config = function()
    vim.notify "Debugger attached"
    vim.keymap.set("n", "<Leader>dk", function()
      require("dap.ui.widgets").hover()
    end, { desc = "[D]debug [k]hover" })
    vim.keymap.set("n", "<Leader>dUo", dapui.open, { desc = "[D]ebug [U]I [o]pen" })
    vim.keymap.set("n", "<Leader>dUc", dapui.close, { desc = "[D]ebug [U]I [c]lose" })
    dapui.open()
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

return {
  setup_mason_dap = setup_mason_dap,
  setup_dap_ui = setup_dap_ui,
}
