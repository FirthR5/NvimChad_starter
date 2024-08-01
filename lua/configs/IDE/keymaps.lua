local options = {
  -- default options given to `vim.keymap.set()`
  default_opts = {
    silent = true,
    noremap = true,
  },
}

return {
  "crispybaccoon/keymaps.nvim",
  priority = 2000, -- load before setting keymaps
  opts = options,
  config = function()
    require("keymaps").setup()
  end,
}
