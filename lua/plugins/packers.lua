local plugins = {

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- MUST READ
  --   event = { "BufRead", "BufWinEnter", "BufNewFile" },
  -- https://learnvim.irian.to/basics/macros
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { -- Text Processors
        "markdown-toc", -- "texlab", "textlint","textlsp",
        -- "tree-sitter-cli",
        "yamlfix",
        "yaml-language-server",
        "xmlformatter", -- Bash / SHELL
        "lua-language-server",
        "stylua", -- "bash-lsp/bash-language-server",
        -- "luaformatter","luacheck",
        -- Database
        "sql-formatter",
        "sqlls",
        "standardjs", -- Web Dev
        "html-lsp", -- "htmlhint", --"htmlbeautifier",
        "css-lsp",
        "prettier",
        "some-sass-language-server", -- css-lsp, --tailwindcss-language-server, --shellcheck
        -- "ts-standard",
        ---  "typescript-language-server",--
        "vue-language-server",
        "volar",
        -- https://www.reddit.com/r/neovim/comments/12e6a7j/volar_with_vuejs_3/
        "angular-language-server", -- Dot Net
        "csharp-language-server",
        "csharpier",
        "omnisharp", -- PHP
        -- "phpactor", "phpcbf", "phpstan"
        -- "pretty-php",
        -- Java Env
        -- "java-debug-adapter",
        -- "java-language-server",
        -- KotlinGOD
        "kotlin-language-server", -- Python
        "pylyzer", -- "r-languageserver",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { -- defaults
        "vim",
        "lua",
        "vimdoc",
        "gitignore", -- web devs
        "html",
        "css",
        "javascript", -- "typescript",
        "tsx",
        "angular",
        "vue",
        "scss",
        "http",
        "scss",
        "htmldjango", -- backend
        "c_sharp",
        "php",
        "python",
        "sql",
        "r", -- low level
        "c",
        "cpp",
        "groovy", -- "cmake","arduino",
        -- other
        "markdown",
        "toml",
        "yaml",
        "xml",
        "csv",
        "json",
      },
    },
    event = { "BufRead", "BufWinEnter", "BufNewFile" },
    --ft = require("config.lsp").filetypes_with_lsp(),
    config = function()
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.o.foldlevel = 1
      vim.o.foldlevelstart = 2
      -- vim.o.foldnestmax = 0
    end,
    highlight = {
      enable = true,
    },
    -- incremental_selection = {
    --   enable = true,
    --   keymaps = {
    --     init_selection = "gnn",
    --     node_incremental = "grn",
    --     scope_incremental = "grc",
    --     node_decremental = "grm",
    --   },
    -- },
    auto_install = true,
    sync_install = true,
    autotag = { enable = true },
    dependencies = {
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
      },
    },
  },
  -- https://github.com/neovim/nvim-lspconfig/issues/1494
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
    config = function()
      local telescope = require "telescope"
      local lga_actions = require "telescope-live-grep-args.actions"

      telescope.setup {
        extensions = {
          live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = { -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt {
                  postfix = " --iglob ",
                },
              },
            },
          },
        },
      }
      telescope.load_extension "live_grep_args"
    end,
  },
  --   {
  --       "neoclide/coc.nvim"
  --   },
}
return plugins
