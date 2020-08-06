# apt install
sudo apt install -y tig vim tmux zsh 



# shell config

# software config
cp .tmux.conf ~/

# editor config
cp .vimrc ~/
cp -rf .vim ~/


# fzf
read -p "Install fzf?(Y/n): " x
if [ "$x" = "n" ];then
  echo "Skip fzf install."
else
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  cd ~/.fzf
  ./install
  cd ~
fi

# oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
cp .zshrc ~/
chsh -s $(which zsh)
echo "Check git repo PATH in ~/.zshrc"

# autojump
git clone git://github.com/wting/autojump.git
cd autojump
./install.py
