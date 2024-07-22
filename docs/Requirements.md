# My LSP

## Working NPM Packages

```sh title:"Instalacion de LSP"
# Python
npm install -g pyright
pip install python-lsp-server

# NET
dotnet tool install --global csharp-ls
npm install [-g] @ast-grep/cli

# Vue
npm install -g vls

# VS Code Html
npm install -g emmet-ls

# Browser Tools
npm install -g browser-sync
npm i -g vscode-langservers-extracted
# HURL https://hurl.dev/docs/installation.html
# Windows
scoop install hurl
# Or
winget install hurl
# Linux
pacman -Sy hurl
# NPM
npm install --save-dev @orangeopensource/hurl

# npm i -g vscode-langservers-extracted
# npm i -g bash-language-server

npm i -g vscode-langservers-extracted
npm i -g sql-language-server

# Lua Vim
npm install -g vim-language-server
scoop install lua-language-server
brew install lua-language-server
```

## Angular COC [^1]

```sh
# 1. Terminal de Nvim
:CocInstall coc-json coc-tsserver
# 2. Add the json from the angular link
# 3. Go to this link: https://github.com/iamcco/coc-angular/issues/70#issuecomment-1616340751
# I.
:CocUninstall coc-angular
# II.
npm -g install @angular/language-server
npm install -g typescript@>=5.0.0
npm -g install @angular/language-service

```

Prueba

```sh
npm install @angular/language-service@next typescript  @angular/language-server
npm -g install @angular/language-service
npm install -g diagnostic-languageserver

npm --save-dev install typescript

```

---

# References

[^1]: [Angular - Angular Language Service](https://v17.angular.io/guide/language-service#neovim)
