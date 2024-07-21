require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- local mason_packages = vim.fn.stdpath "data" .. "/mason/packages"
local lspconfig = require "lspconfig"

local servers = {
  -- ===================================================
  -- Defaults SHELL
  "bashls", -- npm i -g bash-language-server
  "lua_ls",
  "vimls",

  -- ===================================================
  -- Database
  "sqlls",
  -- "sqlfmt",
  -- "sqlfluff",
  -- ============================================================
  -- Web Dev Basics
  "html",
  "cssls",

  -- ============================================================
  -- Web Dev Front Frameworks
  "vuels", -- npm install -g vls
  -- Alternative: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
  "angularls",
  -- "tsserver",
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
  "kotlin_language_server",
  -- "texlab"i
  --phpactor,
  "pyright",
  --

  -- ============================================================
  -- Text Processors
  "jsonls",
  -- "yamlls",
  -- "r_language_server"
  --"azure_pipelines_ls",
  --"clangd",
  -- ===================================================
}
-- local on_attach2 = function(client, bufnr)
--   require("plugins.configs.lspconfig").on_attach(client, bufnr)
--
--   -- refresh codelens when buffer enters and buffer is saved
--   -- insertleave textchanged
--   vim.api.nvim_create_autocmd({ "bufenter", "bufwritepre" }, {
--     buffer = bufnr,
--     callback = vim.lsp.codelens.refresh,
--   })
--
--   -- trigger code lens
--   vim.api.nvim_exec_autocmds("user", { pattern = "lspattached" })
-- end
--
-- capabilities.textDocument.foldingRange = {
--   dynamicRegistration = false,
--   lineFoldingOnly = true,
-- }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

----

-- local cmd = {
--   "ngserver",
--   "--stdio",
--   "--tsProbeLocations",
--   project_library_path,
--   "--ngProbeLocations",
--   project_library_path,
-- }
-- lspconfig.angularls.setup {
--   cmd = cmd,
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }
-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach2,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server.cmd", "--stdio" },
-- }
--
-- local project_library_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver"
-- local cmd =
--   { "ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path }
--
-- require("lspconfig").angularls.setup {
--   cmd = cmd,
--   on_new_config = function(new_config, new_root_dir)
--     new_config.cmd = cmd
--   end,
-- }
-- require("lspconfig").angularls.setup {}

-- -- @server angular-language-server
-- -- https://github.com/yavuloh/nvim_angular/blob/main/lua/custom/configs/lspconfig.lua#L47
-- local angular_language_server_path = mason_packages .. "/angular-language-server/node_modules/.bin/ngserver"
-- local typescript_language_server_path = mason_packages .. "/typescript-language-server/node_modules/.bin/tsserver"
-- local anigular_logs_path = vim.fn.stdpath "state" .. "/angularls.log"
-- local node_modules_global_path = "/usr/local/lib/node_modules"
--
-- local ngls_cmd = {
--   -- "node",
--   angular_language_server_path,
--   "--stdio",
--   "--tsProbeLocations",
--   typescript_language_server_path,
--   "--ngProbeLocations",
--   node_modules_global_path,
--   "--includeCompletionsWithSnippetText",
--   "--includeAutomaticOptionalChainCompletions",
--   "--logToConsole",
--   "--logFile",
--   anigular_logs_path,
-- }
-- local util = require "lspconfig.util"
-- lspconfig.angularls.setup {
--   cmd = ngls_cmd,
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   on_new_config = function(new_config, _)
--     new_config.cmd = ngls_cmd
--   end,
--   -- filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
--   root_dir = util.root_pattern ".git", --,"angular.json", "project.json"),
-- }

-- local languageServerPath = "/home/user/.fnm/node-versions/v12.22.12/installation/lib/node_modules"
-- local cmd = {"ngserver", "--stdio", "--tsProbeLocations", languageServerPath , "--ngProbeLocations", languageServerPath}
--
-- lspconfig.angularls.setup({
--   on_attach = on_attach,
--   capabilities = .capabilities,
--   cmd = cmd,
--   on_new_config = function(new_config,new_root_dir)
--     new_config.cmd = cmd
--   end,
-- })
-- https://github.com/neovim/nvim-lspconfig/issues/1155
