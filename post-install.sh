# copy my script collection to ~/localbin
cd ~/ && git clone https://github.com/azer/localbin.git
cd ~/localbin && make

echo "installing common tools"
# install tools that I use
sudo pacman -S --noconfirm emacs \
                           vim \
                           moc \
                           newsbeuter \
                           irssi \
                           adobe-source-code-pro-fonts \
                           surf
                           
echo "installing spacemacs"                           
# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
rm -rf ~/.emacs.d/private
git clone http://github.com/azer/spacemacs-files ~/.emacs.d/private

echo "installing vimrc"                           
# install vimrc
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo -e "try\n    colorscheme solarized\ncatch\nendtry" > ../.vim_runtime/my_configs.vim

echo "installing irssi"                           
# install irssi config
git clone https://github.com/azer/irssi-config.git ~/.irssi

echo "copying oh-my-zsh config"                           
cp -r /usr/share/oh-my-zsh/ ~/.oh-my-zsh

# nvm
echo "installing nvm"                           
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash

# install tmux plugin manager
echo "installing tmux plugin manager"                           
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source /home/azer/.tmux.conf
