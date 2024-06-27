require "ls.session.snippet_collection"

local ls = require "luasnip"

local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("lua", {
  s("luaConfig", {
    t { "config = function()", "" }, -- Aquí se agrega un salto de línea después de "function()"
    t "\t", -- Esto añade una tabulación
    i(0), -- Inserta el cursor aquí
    t { "", "end," }, -- Añade un salto de línea antes de "end,"
  }),
  s("lsnippet", {
    t 's("', -- Comienza la definición del snippet
    i(1), -- Inserta el cursor aquí
    t '", {', -- Continúa la definición del snippet
    t { "", "" },
    i(0), -- Inserta el cursor aquí
    t { "", "})" }, -- Finaliza la definición del snippet
  }),
})

local ls = require "luasnip"
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
--[[ local function fn(
  args,     -- text from i(2) in this example i.e. { { "456" } }
  parent,   -- parent snippet or parent node
  user_args -- user_args from opts.user_args 
)
   return '[' .. args[1][1] .. user_args .. ']'
end 

s("trig", {
  i(1), t '<-i(1) ',
  f(fn,  -- callback (args, parent, user_args) -> string
    {2}, -- node indice(s) whose text is passed to fn, i.e. i(2)
    { user_args = { "user_args_value" }} -- opts
  ),
  t ' i(2)->', i(2), t '<-i(2) i(0)->', i(0)
}) ]]
