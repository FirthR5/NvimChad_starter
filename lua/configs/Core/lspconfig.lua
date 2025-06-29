-- load defaults i.e lua_lsp
require('nvchad.configs.lspconfig').defaults()

-- ===================================================
local nvlsp = require "nvchad.configs.lspconfig"
local on_attach = nvlsp.on_attach
local on_init = nvlsp.on_init
local capabilities = nvlsp.capabilities
local lspconfig = require "lspconfig"
-- ===================================================

-- References: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
-- ===================================
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
  -- "sqlfmt",
  -- "sqlfluff",
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
  -- "typescript",
  --"typescriptreact", "typescript.tsx",

  -- ============================================================
  -- Backend
  "csharp_ls", -- dotnet tool install --global csharp-ls
  --"asp-grep", --npm install [-g] @ast-grep/cli
  -- TODO: MORE INFO IN: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ast_grep
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls

  -- ============================================================
  -- Low Level
  -- cpp,c, cua: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
  -- Arduino
  --"arduino-language-server" or "arduino"

  -- ============================================================
  -- Other Languages
  -- "kotlin_language_server",
  -- "texlab"i
  -- phpactor,
  "pyright",
  "pylsp",

  -- ============================================================
  -- Text Processors
  -- "jsonls", -- Custom Config
  -- "yamlls", -- Custom Config
  -- "r_language_server"
  --"azure_pipelines_ls",
  --"clangd",
  -- "lemminx",
  -- ===================================================
}

-- https://github.com/aca/emmet-ls
-- local configs = require "lspconfig.configs"
-- local capabilities2 = vim.lsp.protocol.make_client_capabilities()
-- capabilities2.textDocument.completion.completionItem.snippetSupport = true

-- ============== Setup Configs =====================
local config_emmet_ls = {
  -- on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    -- "javascriptreact",
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
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
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
      --  schemaStore = {
      --   -- You must disable built-in schemaStore support if you want to use
      --   -- this plugin and its advanced options like `ignore`.
      --   enable = false,
      --   -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
      --   url = "",
      -- },
      -- schemas = require('schemastore').yaml.schemas(),
      schemas = {
        ["https://raw.githubusercontent.com/jesseduffield/lazygit/master/schema/config.json"] = "*.yaml",
      },
    },
  },
})

-- lspconfig.lemminx.setup(config_xmlls)
local config_jsonls = vim.tbl_deep_extend("force", common_config, {
  settings = {
    json = {
      -- schemas = require("schemastore").json.schemas(),
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
          -- description= "App Settings for Csharp .NET",
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

-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/lspsettings/lua_ls.lua
local config_Luals = {
  settings = {
    Lua = {
      format = {
        enable = false,
      },
      diagnostics = {
        globals = { "vim", "spec" },
      },
      runtime = {
        version = "LuaJIT",
        special = {
          spec = "require",
        },
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
        arrayIndex = "Disable", -- "Enable" | "Auto" | "Disable"
        await = true,
        paramName = "Disable", -- "All" | "Literal" | "Disable"
        paramType = true,
        semicolon = "All", -- "All" | "SameLine" | "Disable"
        setType = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- local config_roslyn ={
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

-- ============== Setup Angular Config on Windows =====================
--local sysname = vim.loop.os_uname().sysname
-- if sysname == "Windows_NT" then
local is_windows = vim.loop.os_uname().version:match "Windows"

if is_windows then
  local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"
  local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver.CMD"
  local typescript_language_server_path = mason_packages .. "/typescript-language-server/node_modules/.bin/tsserver"
  local angular_logs_path = vim.fn.stdpath "state" .. "/angularls.log"
  local util = require "lspconfig.util"

  local node_modules_global_path = "C:/Users/RFF-07/AppData/Roaming/npm/node_modules"

  local ngls_cmd = {
    -- "node",
    angular_language_server_path,
    "--stdio",
    "--tsProbeLocations",
    node_modules_global_path,
    "--ngProbeLocations",
    node_modules_global_path,
    "--includeCompletionsWithSnippetText",
    "--includeAutomaticOptionalChainCompletions",
    -- "--logToConsole",
    -- "--logFile",
    -- angular_logs_path,
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

  -- lspconfig.powershell_es.setup {
  --   filetypes = { "ps1", "psm1", "psd1" },
  --   bundle_path = "~/AppData/Local/nvim-data/mason/packages/powershell-editor-services",
  --   settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
  --   init_options = {
  --     enableProfileLoading = false,
  --   },
  -- }
else
  table.insert(servers, "angularls")
end

-- ============== Setup Custom Configs =====================
lspconfig.emmet_ls.setup(config_emmet_ls) -- lsps with default config
lspconfig.yamlls.setup(config_yaml)
lspconfig.jsonls.setup(config_jsonls) -- https://github.com/ecosse3/nvim/blob/master/lua/config/lsp/servers/jsonls.lua
-- require("roslyn").setup(config_roslyn)
-- =========================================================

-- ============== Setup Configs =====================
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

--────────────────────────────────────────────────────────────────────────────────────
-- Refernces
--
-- Angular
-- -- @server angular-language-server
-- -- https://github.com/yavuloh/nvim_angular/blob/main/lua/custom/configs/lspconfig.lua#L47
-- https://github.com/neovim/nvim-lspconfig/issues/1155
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#angularls
-- https://angular.dev/tools/language-service
-- https://github.com/iamcco/coc-angular/issues/70
-- https://v17.angular.io/guide/language-service#neovim
--
-- linux
-- local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"
-- local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver.CMD"
-- local typescript_language_server_path = mason_packages .. "/typescript-language-server/node_modules/.bin/tsserver"
-- local angular_logs_path = vim.fn.stdpath "state" .. "/angularls.log"

-- local node_modules_global_path = "/usr/local/lib/node_modules"
