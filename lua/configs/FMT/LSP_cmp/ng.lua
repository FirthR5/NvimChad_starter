return {
  "joeveiga/ng.nvim",
  lazy = false,
  config = function()
    local ng = require "ng"
    -- local opts = { noremap = true, silent = true, desc = "" }

    -- Key mappings with default behavior

    vim.keymap.set(
      "n",
      "<leader>At",
      ng.goto_template_for_component,
      { noremap = true, silent = true, desc = "Go to Template Html File Component" }
    )
    vim.keymap.set(
      "n",
      "<leader>Ac",
      ng.goto_component_with_template_file,
      { noremap = true, silent = true, desc = "Go to Template Typescript File Component" }
    )
    vim.keymap.set("n", "<leader>AT", ng.get_template_tcb, { noremap = true, silent = true, desc = "Get Temlate TCB" })
  end,
}
