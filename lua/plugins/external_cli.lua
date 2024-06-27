local plugins = {

  -- ==================================================================
  -- External software integration
  -- ==================================================================
  -- RANGER
  {
    "kelly-lin/ranger.nvim",
    config = function()
      require("ranger-nvim").setup { replace_netrw = true }
      vim.api.nvim_set_keymap("n", "<leader>fe", "", {
        desc = "open ranger",
        noremap = true,
        callback = function()
          require("ranger-nvim").open(true)
        end,
      })
    end,
  },

  -- ==================================================================
  -- Lazy GIT
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  -- ==================================================================
  --{
  --'VonHeikemen/fine-cmdline.nvim',
  --requires = {
  --{'MunifTanjim/nui.nvim'}
  --}
  --},
  -- TODO: CHECK OUT
  -- keymaps
  -- plugins.misc
  -- .lualine
  -- .dap
  -- gitsigns

  -- trouble
  -- obsidian
  -- zenmode
  -- neogit
  -- codesnap
  -- harpoon
}

return plugins
