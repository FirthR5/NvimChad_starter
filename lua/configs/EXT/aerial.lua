local options = {
  -- https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#setup
  backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
  manage_folds = "auto",
  lazy_load = true,
  highlight_on_hover = true,
  autojump = false,
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "<leader>{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "<leader>}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
}

require("aerial").setup(options) -- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
