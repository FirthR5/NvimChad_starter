return {
  "joeveiga/ng.nvim",
  lazy = false,
  config = function()
    local ng = require "ng"
    -- local opts = { noremap = true, silent = true, desc = "" }

    local keybinds = require("prefs.keymap.plug.LSP_Keys").ng
    -- Key mappings with default behavior
    vim.keymap.set(
      "n",
      keybinds.goto_template_for_component,
      ng.goto_template_for_component,
      { noremap = true, silent = true, desc = "Go to Template Html File Component" }
    )
    vim.keymap.set(
      "n",
      keybinds.goto_component_with_template_file,
      ng.goto_component_with_template_file,
      { noremap = true, silent = true, desc = "Go to Template Typescript File Component" }
    )
    vim.keymap.set(
      "n",
      keybinds.get_template_tcb,
      ng.get_template_tcb,
      { noremap = true, silent = true, desc = "Get Temlate TCB" }
    )
  end,
}
