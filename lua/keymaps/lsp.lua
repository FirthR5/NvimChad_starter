local M = {}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Angular (ng.nvim)                                        │
-- ╰──────────────────────────────────────────────────────────╯
M.ng = {
  goto_template_for_component = "<leader>at",
  goto_component_with_template_file = "<leader>ac",
  get_template_tcb = "<leader>aT",
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ IncRename                                                │
-- ╰──────────────────────────────────────────────────────────╯
M.inc_rename = {
  rename = "<leader>rr",
}

-- ╭──────────────────────────────────────────────────────────╮
-- │ Aerial                                                   │
-- ╰──────────────────────────────────────────────────────────╯
M.aerial = {
  prev = "<leader>{",
  next = "<leader>}",
  toggle = "<leader>ae",
}

return M
