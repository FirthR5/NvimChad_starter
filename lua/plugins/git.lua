-- Git integration plugins

return {
  -- ─── LazyGit ──────────────────────────────────────────────────────────────
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = require("keymaps.git").lazygit,
  },

  -- ─── Gitsigns ─────────────────────────────────────────────────────────────
  {
    "lewis6991/gitsigns.nvim",
    opts = require("config.gitsigns").opts,
  },
}
