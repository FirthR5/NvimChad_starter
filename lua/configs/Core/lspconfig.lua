require("nvchad.configs.lspconfig").defaults()

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
-- require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local servers = {
  -- ===================================================
  -- Defaults SHELL
  "bashls", -- npm i -g bash-language-server
  "lua_ls",
  "vimls",

  -- ===================================================
  -- Database

  -- ============================================================
  -- Web Dev Basics
  "html",
  "cssls",

  -- ============================================================
  -- Web Dev Front Frameworks
  "vuels", -- npm install -g vls
  -- Alternative: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
  "angularls",
  "tsserver",
  --"typescript",
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
  "kotlin_language_server", --"omnisharp", "texlab"i
  --phpactor, sqlls,
  -- "pyright",

  -- ============================================================
  -- Text Processors
  -- "jsonls",
  -- "yamlls",
  -- "r_language_server"

  -- ===================================================
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
-- }

-- local configs = require "lspconfig/configs"
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
--
-- lspconfig.emmet_ls.setup {
--   -- on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = {
--     "css",
--     "eruby",
--     "html",
--     "javascript",
--     "javascriptreact",
--     "less",
--     "sass",
--     "scss",
--     "svelte",
--     "pug",
--     "typescriptreact",
--     "vue",
--   },
--   init_options = {
--     html = {
--       options = {
--         -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
--         ["bem.enabled"] = true,
--       },
--     },
--   },
-- }
