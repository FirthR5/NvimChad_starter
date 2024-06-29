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

