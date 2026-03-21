-- load NvChad LSP defaults (compatible with Neovim 0.10)
dofile(vim.g.base46_cache .. "lsp")
require("nvchad.lsp").diagnostic_config()

-- ===================================================
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities
local lspconfig = require "lspconfig"
-- ===================================================

-- References: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
-- ╭──────────────────────────────────────────────────────────╮
-- │  Setup Default Servers                                   │
-- ╰──────────────────────────────────────────────────────────╯
local servers = {
  -- ===================================================
  -- Defaults SHELL
  "bashls", -- npm i -g bash-language-server
  "lua_ls",
  "vimls",

  -- ===================================================
  -- Database
  -- "sqls",
  "sqlls",
  -- ============================================================
  -- Web Dev Basics
  "html",
  "cssls",
  -- "emmetls", -- Custom Config

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

-- ============== Setup Configs =====================
local config_emmet_ls = {
  capabilities = capabilities,
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
}

local common_config = {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- https://github.com/b0o/SchemaStore.nvim
local config_yaml = vim.tbl_deep_extend("force", common_config, {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/jesseduffield/lazygit/master/schema/config.json"] = "*.yaml",
      },
    },
  },
})

local config_jsonls = vim.tbl_deep_extend("force", common_config, {
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

local config_Luals = {
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
}

-- ============== Setup Angular Config on Windows =====================
local is_windows = vim.loop.os_uname().version:match "Windows"

if is_windows then
  local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"
  local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver.CMD"
  local util = require "lspconfig.util"
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
  local config_angularls = {
    cmd = ngls_cmd,
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    on_new_config = function(new_config, _)
      new_config.cmd = ngls_cmd
    end,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
    root_dir = util.root_pattern ".git",
  }

  lspconfig.angularls.setup(config_angularls)
else
  table.insert(servers, "angularls")
end

-- ============== Setup Custom Configs =====================
lspconfig.emmet_ls.setup(config_emmet_ls)
lspconfig.yamlls.setup(config_yaml)
lspconfig.jsonls.setup(config_jsonls)

-- ============== Setup Configs =====================
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
