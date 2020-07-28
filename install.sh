# shell config
cp .zshrc ~/

# software config
cp .tmux.conf ~/
cp .gitconfig ~/

# editor config
cp .vimrc ~/
cp -r .vim ~/


# fzf
clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf
./install
cd ~

# zsh
# oh my zsh

# tig 
