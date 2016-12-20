# copy my script collection to ~/localbin
cd ~/ && git clone https://github.com/azer/localbin.git
cd ~/localbin && make

# install tools that I use
sudo pacman -S --noconfirm emacs \
                           vim \
                           moc \
                           newsbeuter \
                           irssi \
                           nodejs



# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
rm -rf ~/.emacs.d/private
git clone http://github.com/azer/spacemacs-files ~/.emacs.d/private

# install vimrc
git clone https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo -e "try\n    colorscheme solarized\ncatch\nendtry" > ../.vim_runtime/my_configs.vim

# install irssi config
git clone https://github.com/azer/irssi-config.git ~/.irssi

# download wallpaper
wget https://images.unsplash.com/photo-1479999564813-e9791bdfebf4 -O ~/wallpaper.jpg

cp -r /usr/share/oh-my-zsh/ ~/.oh-my-zsh

# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
