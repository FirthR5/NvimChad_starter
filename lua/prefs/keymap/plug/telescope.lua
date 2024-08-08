local lga_actions = require "telescope-live-grep-args.actions"

local keybinds = {}

keybinds.telescope = {
  i = {
    -- https://github.com/nvim-telescope/telescope.nvim
    ["<C-k>"] = lga_actions.quote_prompt(),
    ["<C-i>"] = lga_actions.quote_prompt {
      postfix = " --iglob ",
    },
    -- freeze the current list and start a fuzzy search in the frozen list
    -- ["<C-space>"] = actions.to_fuzzy_refine,
  },
}

return keybinds
