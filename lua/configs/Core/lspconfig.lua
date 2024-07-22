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

-- https://github.com/aca/emmet-ls
local configs = require "lspconfig.configs"
local capabilities2 = vim.lsp.protocol.make_client_capabilities()
capabilities2.textDocument.completion.completionItem.snippetSupport = true

lspconfig.emmet_ls.setup {
  -- on_attach = on_attach,
  capabilities = capabilities2,
  filetypes = {
    "css",
    "eruby",
    "html",
    "javascript",
    "javascriptreact",
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
