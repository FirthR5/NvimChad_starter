
-- ============================================================
-- -- https://github.com/mg979/vim-visual-multi
-- https://www.reddit.com/r/neovim/comments/yizrri/nvim_alternative_for_vimvisualmulti/
-- Cursor
-- {
--   "mg979/vim-visual-multi",
--   branch = "master",
--   lazy = false,
--   init = function()
--     vim.g.VM_Maps = {
--       ["Find Under"] = "<C-l>"
--     }
--   end
-- },
-- Foldable
-- -- https://github.com/anuvyklack/pretty-fold.nvim
--   use{ 'anuvyklack/pretty-fold.nvim',
--      config = function()
--         require('pretty-fold').setup()
--      end
--   }