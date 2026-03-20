local options = {
  filetypes = {
    "html",
    "css",
    "javascript",
    "typescript",
    "typescriptreact",
    "javascriptreact",
    "lua",
  },
  user_default_options = {
    mode = "background",
  },
  css = {
    RRGGBBAA = true,
    rgb_fn = true,
    hsl_fn = true,
    css = true,
    css_fn = true,
  },
}

local function setup()
  require("colorizer").setup(options)
end

return {
  setup = setup,
}
