#                         Start
# ───────────────────────────────────────────────────────────
# Install NPM
if [[ -n $(command -v pacman) ]]; then
    sudo pacman -S npm
elif [[ -n $(command -v apt)]]; then
    sudo apt install npm
fi

#                     Remove Artifacts
# ───────────────────────────────────────────────────────────
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Symbolic Link
root_path=$(pwd)


rm -rf ~/.config/nvim
# ln -s $root_path ~/.config/nvim
ln -s $or_DF_Root/_Cross/Vim/nvim/NvimChad_starter ~/.config/nvim

#           Install some pluggins for LSP
# ───────────────────────────────────────────────────────────
# Bash
sudo npm i -g bash-language-server
# Lua Vim
sudo npm install -g vim-language-server
if [[ -n $(command -v pacman) ]]; then
    sudo pacman -S lua-language-server
elif [[ -n $(command -v brew) ]]; then
    brew install lua-language-server
fi
# VS Code Html
sudo npm install -g emmet-ls
sudo npm i -g prettier
# Python
sudo npm install -g pyright
# pip install python-lsp-server
# SQL LS
npm i -g sql-language-server
#                           End
# ───────────────────────────────────────────────────────────
