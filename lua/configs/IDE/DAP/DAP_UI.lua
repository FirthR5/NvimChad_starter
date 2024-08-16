-- ╭──────────────────────────────────────────────────────────╮
-- │ DAP UI Setup                                             │
-- ╰──────────────────────────────────────────────────────────╯
function config_DAP_UI()
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
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  config = config_DAP_UI,
}
