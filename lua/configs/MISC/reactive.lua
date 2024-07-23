return 
  {
    "rasulomaroff/reactive.nvim",
    config = function()
      require("reactive").setup {
        builtin = {
          cursorline = true,
          cursor = true,
          modemsg = true,
        },
  
      }
  
    end,
  }
  -- TODO: https://github.com/johmsalas/text-case.nvim
  -- https://ofirgall.github.io/learn-nvim/chapters/07-vim-goodies.html#substitute-command

