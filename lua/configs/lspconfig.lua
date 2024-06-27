-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {

  -- Web Dev
  "html",
  "cssls",
  "vuels", -- npm install -g vls
  -- Alternative: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#biome
  --"angularls"
  --"typescript",
  --"typescriptreact", "typescript.tsx",
  "kotlin_language_server", --"omnisharp", "texlab"i
  --phpactor, sqlls,
  "tsserver",
  -- Arduino
  --"arduino-language-server" or "arduino"
  "lua_ls",
  "vimls",
  "bashls", -- npm i -g bash-language-server
  "csharp_ls", -- dotnet tool install --global csharp-ls
  --"asp-grep", --npm install [-g] @ast-grep/cli
  -- TODO: MORE INFO IN: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ast_grep
  -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls
  -- cpp,c, cua: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd
  -- "pyright", "jsonls", "yamlls", "r_language_server"
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
