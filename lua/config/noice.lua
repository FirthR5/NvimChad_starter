local options = {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      ["vim.lsp.util.stylize_markdown"] = false,
      ["cmp.entry.get_documentation"] = false,
      hover = { enabled = true },
      signature = { enabled = false },
    },
  },
  progress = {
    enabled = true,
  },
  hover = {
    enabled = false,
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true,
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
}

local dependencies = {
  "MunifTanjim/nui.nvim",
  "smjonas/inc-rename.nvim",
  "rcarriga/nvim-notify",
}

local function setup()
  require("noice").setup(options)
end

return {
  setup = setup,
  dependencies = dependencies,
}
