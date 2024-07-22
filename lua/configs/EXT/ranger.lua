function MySetup()
  require("ranger-nvim").setup { replace_netrw = true }
  vim.api.nvim_set_keymap("n", "<leader>fe", "", {
    desc = "open ranger",
    noremap = true,
    callback = function()
      require("ranger-nvim").open(true)
    end,
  })
end

local M = {}

M = {
  "kelly-lin/ranger.nvim",
  config = function()
    MySetup()
  end,
}

return M
