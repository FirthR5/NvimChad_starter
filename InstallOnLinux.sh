# Start
# Install NPM
sudo pacman -S npm

# Remove Artifacts
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim

# Symbolic Link
ln -s /mnt/Dev_Sys/_Config/_Cross/NvimChad_starter/ /home/dart7/.config/nvim
       
# Install some pluggins for LSP
#
# Bash
sudo npm i -g bash-language-server
# Lua Vim
sudo npm install -g vim-language-server
sudo pacman -S lua-language-server
# VS Code Html
sudo npm install -g emmet-ls
sudo npm i -g prettier
# Python
sudo npm install -g pyright
# pip install python-lsp-server
# SQL LS    
npm i -g sql-language-server
# End
