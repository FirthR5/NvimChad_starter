return {
  { "<leader>tdd", "", desc = "+[dd]ebug", mode = { "n", "v" } },
  {
    "<leader>tdB",
    function()
      require("dap").set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end,
    desc = "[d]ebug [B]reakpoint Condition",
  },
  {
    "<leader>tdb",
    function()
      require("dap").toggle_breakpoint()
    end,
    desc = "[d]ebug [b]reakpoint",
  },
  {
    "<leader>tdc",
    function()
      require("dap").continue()
    end,
    desc = "[d]ebug [c]ontinue",
  },
  {
    "<leader>tda",
    function()
      require("dap").continue { before = get_args }
    end,
    desc = "[d]ebug Run with [a]rgs",
  },
  {
    "<leader>tdC",
    function()
      require("dap").run_to_cursor()
    end,
    desc = "[d]ebug Run to [c]ursor",
  },
  {
    "<leader>tdg",
    function()
      require("dap").goto_()
    end,
    desc = "[d]ebug [g]o to Line (No Execute)",
  },
  {
    "<leader>tdi",
    function()
      require("dap").step_into()
    end,
    desc = "[d]ebug [l]Step Into",
  },
  {
    "<leader>tdj",
    function()
      require("dap").down()
    end,
    desc = "[d]ebug [j]Down",
  },
  {
    "<leader>tdk",
    function()
      require("dap").up()
    end,
    desc = "[d]ebug [k]Up",
  },
  {
    "<leader>tdl",
    function()
      require("dap").run_last()
    end,
    desc = "[d]ebug Run [l]ast",
  },
  {
    "<leader>tdo",
    function()
      require("dap").step_out()
    end,
    desc = "[d]ebug Step [o]ut",
  },
  {
    "<leader>tdO",
    function()
      require("dap").step_over()
    end,
    desc = "[d]ebug Step [O]ver",
  },
  {
    "<leader>tdp",
    function()
      require("dap").pause()
    end,
    desc = "[d]ebug [p]ause",
  },
  {
    "<leader>tdr",
    function()
      require("dap").repl.toggle()
    end,
    desc = "[d]ebug Toggle [r]EPL",
  },
  {
    "<leader>tds",
    function()
      require("dap").session()
    end,
    desc = "[d]ebug [s]ession",
  },
  {
    "<leader>tdt",
    function()
      require("dap").terminate()
    end,
    desc = "[d]ebug [t]erminate",
  },
  {
    "<leader>tdw",
    function()
      require("dap.ui.widgets").hover()
    end,
    desc = "[d]ebug [w]idgets",
  },
}
