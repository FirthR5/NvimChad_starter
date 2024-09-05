return {
  { "<leader>dd", "", desc = "+[dd]ebug", mode = { "n", "v" } },
  {
    "<leader>dB",
    function()
      require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end,
    desc = "[d]ebug [B]reakpoint Condition",
  },
  {
    "<leader>db",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "[d]ebug [b]reakpoint",
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
    desc = "[d]ebug [c]ontinue",
  },
  -- {
  --   "<leader>de",
  --   function()
  --     require("dap").eval()
  --   end,
  --   desc = "[d]ebug [e]val",
  -- },
  {
    "<leader>da",
    function()
      require("dap").continue { before = get_args }
    end,
    desc = "[d]ebug Run with [a]rgs",
  },
  {
    "<leader>dC",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "[d]ebug Run to [c]ursor",
  },
  {
    "<leader>dg",
    function()
      require("dap").goto_()
    end,
    desc = "[d]ebug [g]o to Line (No Execute)",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "[d]ebug [l]Step Into",
  },
  {
    "<leader>dj",
    function()
      require("dap").down()
    end,
    desc = "[d]ebug [j]Down",
  },
  {
    "<leader>dk",
    function()
      require("dap").up()
    end,
    desc = "[d]ebug [k]Up",
  },
  {
    "<leader>dl",
    function()
      require("dap").run_last()
    end,
    desc = "[d]ebug Run [l]ast",
  },
  {
    "<leader>do",
    function()
      require("dap").step_out()
    end,
    desc = "[d]ebug Step [o]ut",
  },
  {
    "<leader>dO",
    function()
      require("dap").step_over()
    end,
    desc = "[d]ebug Step [O]ver",
  },
  {
    "<leader>dp",
    function()
      require("dap").pause()
    end,
    desc = "[d]ebug [p]ause",
  },
  {
    "<leader>dr",
    function()
      require("dap").repl.toggle()
    end,
    desc = "[d]ebug Toggle [r]EPL",
  },
  {
    "<leader>ds",
    function()
      require("dap").session()
    end,
    desc = "[d]ebug [s]ession",
  },
  {
    "<leader>dt",
    function()
      require("dap").terminate()
    end,
    desc = "[d]ebug [t]erminate",
  },
  {
    "<leader>dw",
    function()
      require("dap.ui.widgets").hover()
    end,
    desc = "[d]ebug [w]idgets",
  },
}
