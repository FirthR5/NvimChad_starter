local cmp = require "cmp"
local luasnip = require "luasnip"

local kind_icons = {
  Text = "󰊄",
  Method = "m",
  Function = "󰊕",
  Constructor = "",
  Field = "",
  Variable = "󰫧",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "󰌆",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "󰉺",
}

local options = {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = require("prefs.keymap.plug.LSP_cmp").cmp,
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lua = "[Lua]",
        nvim_lsp = "[Lsp]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lua" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    -- { name = "coc" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
  },
}

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    {
      name = "cmdline",
      option = {
        ignore_cmds = { "Man", "!" },
      },
    },
  }),
})

-- cmp.register_source("coc", {
--   complete = function(self, params, callback)
--     vim.fn.CocActionAsync("doCompletion", params.context.cursor.row, params.context.cursor.col, function(err, res)
--       if err then
--         callback { items = {}, isIncomplete = false }
--       else
--         local items = {}
--         for _, item in ipairs(res) do
--           table.insert(items, {
--             label = item.word,
--             insertText = item.insertText or item.word,
--             kind = cmp.lsp.CompletionItemKind[item.kind],
--           })
--         end
--         callback { items = items, isIncomplete = false }
--       end
--     end)
--   end,
-- })

local M = {
  "hrsh7th/nvim-cmp",
  dependencies = require "opts.deps.nvim_cmp",

  config = function()
    cmp.setup(options)
  end,
}

return M
