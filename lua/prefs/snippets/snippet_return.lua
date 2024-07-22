require "luasnip.session.snippet_collection"

local luasnip = require "luasnip"

local s = luasnip.snippet
local t = luasnip.text_node -- Static Text
local i = luasnip.insert_node -- Text Can Be Edited

luasnip.add_snippets("lua", {
  s("luaConfig", {
    t { "config = function()", "" },
    t "\t",
    i(0),
    t { "", "end," },
  }),
  s("lsnippet", {
    t 's("',
    t " ",
    t '", {',
    t { "", "" },
    t " ", --i(0),
    t { "", "})" },
  }),
})

-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#functionnode
