options = {
  presets = { inc_rename = true },
  --input_buffer_type = "dressing",
}
require("inc_rename").setup(options)
vim.keymap.set("n", "<leader>rr", ":IncRename ")

-- vim.keymap.set("n", "<leader>rr", function()
--   return ":IncRename " .. vim.fn.expand("<cword>")
-- end, { expr = true })
