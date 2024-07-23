local M = {}

M = {
  "kelly-lin/ranger.nvim",
  config = function()
    require("ranger-nvim").setup {
      enable_cmds = false,
      replace_netrw = false,
      keybinds = {
        ["ov"] = ranger_nvim.OPEN_MODE.vsplit,
        ["oh"] = ranger_nvim.OPEN_MODE.split,
        ["ot"] = ranger_nvim.OPEN_MODE.tabedit,
        ["or"] = ranger_nvim.OPEN_MODE.rifle,
      },
      ui = {
        border = "none",
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
      },
    }

    vim.api.nvim_set_keymap("n", "<leader>fe", "", {
      desc = "open ranger",
      noremap = true,
      callback = function()
        require("ranger-nvim").open(true)
      end,
    })
  end,
}

return M
