-- NvChad LSP defaults: loads cache, diagnostics, LspAttach autocmd,
-- vim.lsp.config("*") with capabilities/on_init, and lua_ls
require("nvchad.configs.lspconfig").defaults()

-- ===================================================
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities
-- ===================================================

-- References: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
-- ╭──────────────────────────────────────────────────────────╮
-- │  Servers with default config (inherit from "*")          │
-- ╰──────────────────────────────────────────────────────────╯
local servers = {
  -- ===================================================
  -- Defaults SHELL
  "bashls", -- npm i -g bash-language-server
  -- "lua_ls", -- already enabled by NvChad defaults()
  "vimls",

  -- ===================================================
  -- Database
  -- "sqls",
  "sqlls",
  -- ============================================================
  -- Web Dev Basics
  "html",
  "cssls",
  -- "emmetls", -- Custom Config below

  -- ============================================================
  -- Web Dev Front Frameworks
  -- "vuels", -- npm install -g vls
  "volar",
  --"angularls", -- Custom Config (because Windows)
  "ts_ls",

  -- ============================================================
  -- Backend
  "csharp_ls", -- dotnet tool install --global csharp-ls

  -- ============================================================
  -- Other Languages
  "pyright",
  "pylsp",
}

-- ╭──────────────────────────────────────────────────────────╮
-- │  Custom server configs (vim.lsp.config)                  │
-- ╰──────────────────────────────────────────────────────────╯

-- emmet_ls
vim.lsp.config("emmet_ls", {
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "less",
    "sass",
    "scss",
    "svelte",
    "pug",
    "typescriptreact",
    "vue",
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
})

-- https://github.com/b0o/SchemaStore.nvim
vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/jesseduffield/lazygit/master/schema/config.json"] = "*.yaml",
      },
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
        {
          fileMatch = { ".prettierrc", ".prettierrc.json", "prettier.config.json" },
          url = "https://json.schemastore.org/prettierrc.json",
        },
        {
          fileMatch = { ".eslintrc", ".eslintrc.json" },
          url = "https://json.schemastore.org/eslintrc.json",
        },
        {
          fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
          url = "https://json.schemastore.org/babelrc.json",
        },
        {
          fileMatch = { "lerna.json" },
          url = "https://json.schemastore.org/lerna.json",
        },
        {
          fileMatch = { "now.json", "vercel.json" },
          url = "https://json.schemastore.org/now.json",
        },
        {
          fileMatch = { "appsettings.json", "appsettings.Development.json" },
          url = "https://json.schemastore.org/aspire-8.0.json",
        },
        {
          fileMatch = { "ecosystem.json" },
          url = "https://json.schemastore.org/pm2-ecosystem.json",
        },
      },
      validate = { enable = true },
    },
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      format = { enable = false },
      diagnostics = { globals = { "vim", "spec" } },
      runtime = {
        version = "LuaJIT",
        special = { spec = "require" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
      hint = {
        enable = false,
        arrayIndex = "Disable",
        await = true,
        paramName = "Disable",
        paramType = true,
        semicolon = "All",
        setType = false,
      },
      telemetry = { enable = false },
    },
  },
})

-- ╭──────────────────────────────────────────────────────────╮
-- │  Angular on Windows (custom cmd/root_dir)                │
-- ╰──────────────────────────────────────────────────────────╯
local is_windows = vim.uv.os_uname().version:match "Windows"

if is_windows then
  local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"
  local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver.CMD"
  local node_modules_global_path = "C:/Users/RFF-07/AppData/Roaming/npm/node_modules"

  local ngls_cmd = {
    angular_language_server_path,
    "--stdio",
    "--tsProbeLocations",
    node_modules_global_path,
    "--ngProbeLocations",
    node_modules_global_path,
    "--includeCompletionsWithSnippetText",
    "--includeAutomaticOptionalChainCompletions",
  }

  vim.lsp.config("angularls", {
    cmd = ngls_cmd,
    on_new_config = function(new_config, _)
      new_config.cmd = ngls_cmd
    end,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
    root_markers = { ".git" },
  })
else
  table.insert(servers, "angularls")
end

-- ╭──────────────────────────────────────────────────────────╮
-- │  Enable all servers                                      │
-- ╰──────────────────────────────────────────────────────────╯
-- Custom-configured servers
vim.lsp.enable { "emmet_ls", "yamlls", "jsonls" }

if is_windows then
  vim.lsp.enable "angularls"
end

-- Default servers (inherit capabilities/on_init from "*")
vim.lsp.enable(servers)
