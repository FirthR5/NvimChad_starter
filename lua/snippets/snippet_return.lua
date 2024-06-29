require "luasnip.session.snippet_collection"

local luasnip = require "luasnip"

local s = luasnip.snippet
-- local sn = ls.snippet_node
--local isn = ls.indent_snippet_node

local t = luasnip.text_node -- Static Text
local i = luasnip.insert_node -- Text Can Be Edited

luasnip.add_snippets("lua", {
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

-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#functionnode

-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")
-- local extras = require("luasnip.extras")
-- local l = extras.lambda
-- local rep = extras.rep
-- local p = extras.partial
-- local m = extras.match
-- local n = extras.nonempty
-- local dl = extras.dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local conds = require("luasnip.extras.expand_conditions")
-- local postfix = require("luasnip.extras.postfix").postfix
-- local types = require("luasnip.util.types")
-- local parse = require("luasnip.util.parser").parse_snippet
-- local ms = ls.multi_snippet
-- local k = require("luasnip.nodes.key_indexer").new_key
