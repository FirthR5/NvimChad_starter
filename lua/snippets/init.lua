require "ls.session.snippet_collection"

local ls = require "luasnip"

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  s("luaConfig", {
    t { "config = function()", "" },
    t "\t",
    i(0),
    t { "", "end," },
  }),
  s("lsnippet", {
    t 's("',
    i(1),
    t '", {',
    t { "", "" },
    i(0),
    t { "", "})" },
  }),
})

-- Ref: https://salferrarello.com/getting-started-with-luasnip/
-- for "all" filetypes create snippet for "func"
ls.add_snippets("vue", {
  ls.parser.parse_snippet(
    "vueInitSetUpScope",
    '<template>\n\t<div>\n\t\t${1}\n\t</div>\n</template>\n\n<script lang="ts" setup>\n\t${2}\n</script>\n<style scoped>\n\t${3}\n</style>\n'
  ),
})

-- Map "Ctrl + p" (in insert mode)
-- to expand snippet and jump through fields.
vim.keymap.set("i", "<c-p>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end)

-- https://github.com/L3MON4D3/ls/blob/master/DOC.md#functionnode
