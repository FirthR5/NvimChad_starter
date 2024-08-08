local Keys = require("prefs.keymap.plug.LSP_Keys").Aerial

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
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", Keys.AerialPrev, "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", Keys.AerialNext, "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
  -- List of filetypes to ignore.
  filetypes = {},
}

local dependencies = {
  "nvim-treesitter/nvim-treesitter", -- Default by NvChad
  "nvim-tree/nvim-web-devicons", -- Default by NvChad
}

return {
  "stevearc/aerial.nvim",
  lazy = true,
  -- dependencies = dependencies,
  config = function()
    require("aerial").setup(options) -- You probably also want to set a keymap to toggle aerial
    vim.keymap.set("n", Keys.AeriealToggle, "<cmd>AerialToggle!<CR>")
  end,
}

-- https://github.com/stevearc/aerial.nvim?tab=readme-ov-file#setup
