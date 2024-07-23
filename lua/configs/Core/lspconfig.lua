require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

-- Alternative: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
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

  -- ============================================================
  -- Web Dev Front Frameworks
  -- "vuels", -- npm install -g vls
  "volar",
  "angularls",
  "tsserver",
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
  --

  -- ============================================================
  -- Text Processors
  "jsonls",
  "yamlls",
  -- "r_language_server"
  --"azure_pipelines_ls",
  --"clangd",
  -- ===================================================
}

-- https://github.com/aca/emmet-ls
local configs = require "lspconfig.configs"
local capabilities2 = vim.lsp.protocol.make_client_capabilities()
capabilities2.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup {
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
    -- "typescriptreact",
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
-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

----

-- -- @server angular-language-server
-- -- https://github.com/yavuloh/nvim_angular/blob/main/lua/custom/configs/lspconfig.lua#L47
-- https://github.com/neovim/nvim-lspconfig/issues/1155
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#angularls
-- https://angular.dev/tools/language-service
-- https://github.com/iamcco/coc-angular/issues/70
-- https://v17.angular.io/guide/language-service#neovim

--local sysname = vim.loop.os_uname().sysname
-- if sysname == "Windows_NT" then
local is_windows = vim.loop.os_uname().version:match "Windows"

if is_windows then
  local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"
  local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver.CMD"
  local typescript_language_server_path = mason_packages .. "/typescript-language-server/node_modules/.bin/tsserver"
  local angular_logs_path = vim.fn.stdpath "state" .. "/angularls.log"

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
    "--logToConsole",
    "--logFile",
    angular_logs_path,
  }

  local util = require "lspconfig.util"
  lspconfig.angularls.setup {
    cmd = ngls_cmd,
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    on_new_config = function(new_config, _)
      new_config.cmd = ngls_cmd
    end,
    filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
    root_dir = util.root_pattern ".git", --,"angular.json", "project.json"),
  }
else
  local nothing = ""
  -- linux
  -- local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"
  -- local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver.CMD"
  -- local typescript_language_server_path = mason_packages .. "/typescript-language-server/node_modules/.bin/tsserver"
  -- local angular_logs_path = vim.fn.stdpath "state" .. "/angularls.log"

  local node_modules_global_path = "/usr/local/lib/node_modules"
end

-- VUE
-- local options_vue = {
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
--         languages = {"javascript", "typescript", "vue"},
--       },
--     },
--   },
--   filetypes = {
--     "javascript",
--     "typescript",
--     "vue",
--   },
-- }
--
--
-- require'lspconfig'.tsserver.setup(options_vue)
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
-- You must make sure volar is setup
-- e.g. require'lspconfig'.volar.setup{}
-- See volar's section for more information
