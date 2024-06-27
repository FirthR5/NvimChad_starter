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
      -- set nofoldenable                     --" Disable folding at startup.
      -- vim.opt.foldmethod="indent"
      vim.o.foldlevel = 0
      -- vim.o.foldlevelstart = 0
      -- vim.o.foldnestmax = 0

      -- https://andrewcourter.substack.com/p/code-folding-in-neovim
      -- zc - Close (fold) the current fold under the cursor.
      -- zo - Open (unfold) the current fold under the cursor.
      -- za - Toggle between closing and opening the fold under the cursor.
      -- zR - Open all folds in the current buffer.
      -- zM - Close all folds in the current buffer.
    end,
    highlight = {
      enable = true,
    },
    auto_install = true,
    sync_install = true,
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
            -- define mappings, e.g.
            mappings = { -- extend mappings
              i = {
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["<C-i>"] = lga_actions.quote_prompt {
                  postfix = " --iglob ",
                },
                -- freeze the current list and start a fuzzy search in the frozen list
                -- ["<C-space>"] = actions.to_fuzzy_refine,
              },
            },
            -- ... also accepts theme settings, for example:
            -- theme = "dropdown", -- use dropdown theme
            -- theme = { }, -- use own theme spec
            -- layout_config = { mirror=true }, -- mirror preview pane
          },
        },
      }

      -- don't forget to load the extension
      telescope.load_extension "live_grep_args"
    end,
  },
  --   {
  --       "neoclide/coc.nvim"
  --   },
}
return plugins
