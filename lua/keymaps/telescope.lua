local M = {}

local function get_live_grep_args()
  local ok, lga_actions = pcall(require, "telescope-live-grep-args.actions")
  if not ok then
    return {}
  end

  return {
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
end

M.live_grep_args = get_live_grep_args()

M.telescope = {
    --{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find Files" },
    { "<leader>fa", "<cmd>Telescope find_files no_ignore=true<cr>", desc = "Find Files All" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fh",
      "<cmd>Telescope help_tags<cr>",
      desc = "Help Tags",
    },
}

return M
