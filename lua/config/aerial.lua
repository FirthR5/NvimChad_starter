local keymaps = require("keymaps.lsp").aerial

local options = {
  backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
  manage_folds = "auto",
  lazy_load = true,
  highlight_on_hover = true,
  autojump = true,
  open_automatic = false,
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },
  on_attach = function(bufnr)
    vim.keymap.set("n", keymaps.prev, "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", keymaps.next, "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  filetypes = {},
}

local function setup()
  require("aerial").setup(options)
  vim.keymap.set("n", keymaps.toggle, "<cmd>AerialToggle!<CR>")
end

return {
  setup = setup,
}
