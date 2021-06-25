# apt install
sudo apt install -y tig vim tmux zsh python



# shell config

# software config
cp .tmux.conf ~/

# editor config
cp .vimrc ~/
cp -rf .vim ~/


# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf && ./install

cd ~

# oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp .zshrc ~/ && chsh -s $(which zsh)
echo "Check git repo PATH in ~/.zshrc"

# autojump
git clone git://github.com/wting/autojump.git && cd autojump && ./install.py
