-- Completion, snippets, formatting, linting
local cmp_deps = require "data.cmp-deps"

return {
  -- ─── nvim-cmp ──────────────────────────────────────────────────────────────
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = cmp_deps,
    config = function()
      require("config.cmp").setup()
    end,
  },

  -- ─── LuaSnip ──────────────────────────────────────────────────────────────
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    after = "nvim-cmp",
    enable_autosnippets = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp",
    config = function()
      require("config.lua-snippets").setup()
    end,
  },

  -- ─── Conform (formatting) ─────────────────────────────────────────────────
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require("config.conform").setup()
    end,
  },

  -- ─── Comment ──────────────────────────────────────────────────────────────
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  -- ─── TS AutoTag ────────────────────────────────────────────────────────────
  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
        per_filetype = {
          ["html"] = { enable_close = true },
          ["markdown"] = { enable_close = true },
          ["typescript"] = { enable_close = true },
          ["vue"] = { enable_close = true },
        },
      }
    end,
  },

  -- ─── Inc Rename ────────────────────────────────────────────────────────────
  {
    "smjonas/inc-rename.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("inc_rename").setup {
        presets = { inc_rename = true },
      }
      local keybinds = require("keymaps.lsp").inc_rename
      vim.keymap.set("n", keybinds.rename, ":IncRename ", { silent = true })
    end,
  },

  -- ─── Colorizer ────────────────────────────────────────────────────────────
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("config.colorizer").setup()
    end,
  },

  -- ─── ALE (linting) ────────────────────────────────────────────────────────
  {
    "dense-analysis/ale",
    lazy = true,
    event = "VeryLazy",
    config = function()
      vim.g.ale_ruby_rubocop_auto_correct_all = 1
      vim.g.ale_linters = {
        cs = { "csharpier" },
      }
    end,
  },

  -- ─── GitHub Copilot (core) ────────────────────────────────────────────────
  -- NOTE: Kept for CopilotChat dependency. Autocompletion disabled.
  --[[{
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    lazy = true,
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = false
          --enabled = true,
          --auto_trigger = true,
          --keymap = {
            --accept = false,       -- handled in Tab (keymaps/completion.lua)
            --accept_word = "<M-k>",
           -- accept_line = "<M-j>",
           -- next = "<M-]>",
          --  prev = "<M-[>",
            --dismiss = "<C-]>",
        --  },
        --keymap = {
        --accept = "<C-Tab>",    -- Ctrl+Tab aceptar sugerencia completa
        --accept_word = "<C-Right>", -- Ctrl+Right aceptar palabra
        --waccept_line = "<C-l>",     -- Ctrl+l aceptar línea
        --next = "<C-Down>",         -- Ctrl+Down siguiente
        --prev = "<C-Up>",           -- Ctrl+Up anterior
        --dismiss = "<C-]>",
          --},
        },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          yaml = true,
          ["."] = false,
        },
      }
    end,
  },

  -- ─── Copilot → nvim-cmp source (disabled) ────────────────────────────────
  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = "copilot.lua",
  --   dependencies = { "zbirenbaum/copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },

  -- ─── Copilot Chat ─────────────────────────────────────────────────────────
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "zbirenbaum/copilot.lua", "nvim-lua/plenary.nvim" },
    build = "make tiktoken",
    cmd = { "CopilotChat", "CopilotChatToggle", "CopilotChatExplain", "CopilotChatFix" },
    opts = {
      window = {
        layout = "vertical",
        width = 0.35,
      },
    },
    keys = {
        { "<leader>cpc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat Toggle" },
        { "<leader>cpe", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Copilot Explain" },
        { "<leader>cpf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Copilot Fix" },
        { "<leader>cpr", "<cmd>CopilotChatReview<cr>", mode = "v", desc = "Copilot Review" },
        { "<leader>cpo", "<cmd>CopilotChatOptimize<cr>", mode = "v", desc = "Copilot Optimize" },
        { "<leader>cpt", "<cmd>CopilotChatTests<cr>", mode = "v", desc = "Copilot Tests" },
        -- Copilot status
        { "<leader>cpst", "<cmd>Copilot status<cr>", desc = "Copilot Status" },
        -- Copilot Version
        { "<leader>cpv", "<cmd>Copilot version<cr>", desc = "Copilot Version" },
        -- Model
        { "<leader>cpm", "<cmd>Copilot model<cr>", desc = "Copilot Model" },
        -- panel
        { "<leader>cpp", "<cmd>Copilot panel<cr>", desc = "Copilot Panel Toggle" },
        -- suggestion
        { "<leader>cpsu", "<cmd>Copilot suggest<cr>", desc = "Copilot Suggest" },
        -- toggle
        { "<leader>cptg", "<cmd>Copilot toggle<cr>", desc = "Copilot Toggle Greet" },
        -- CopilotChatModels
        { "<leader>cpcm", "<cmd>CopilotChatModels<cr>", desc = "Copilot Chat Models" },


    },
  },]]--
}
