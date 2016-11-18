all:
	make config
	make install
	make localbin
	make zsh
	make vim
	make nvm
	make node
	make xmonad
	make fonts
	make emacs

config:
	cd ~/ && ln -s dotfiles/.tmux.conf .
	cd ~/ && ln -s dotfiles/.gitconfig .
	cd ~/ && ln -s dotfiles/.Xresources .
	cd ~/ && ln -s dotfiles/.Xresources .Xdefaults
	cd ~/ && ln -s dotfiles/.siegerc .
	cd ~/ && ln -s dotfiles/.screenrc .
	cd ~/ && ln -s dotfiles/.Xmodmap .
	cd ~/ && ln -s dotfiles/.xinitrc .

nvm:
	cd ~ && curl https://raw.github.com/creationix/nvm/master/install.sh | bash
	cd ~ && source ~/.nvm/nvm.sh

node:
	nvm install 7.1.0
	nvm use 7.1.0
	nvm alias default 0.10

localbin:
	cd ~/ && git clone git@github.com:azer/localbin.git
	cd ~/localbin && make

install:
	sudo apt-get update
	sudo apt-get install -y build-essential curl wget git tmux zsh checkinstall libxpm-dev libtiff-dev libgif-dev libjpeg-dev libwebkit-dev firefox xmonad xmobar feh scrot moc newsbeuter dmenu rxvt-unicode

zsh:
	cd ~ && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	echo "source ~/dotfiles/.zshrc \nsource ~/dotfiles/.nvm \nsource ~/localbin/bashmarks/bashmarks.sh\nsource ~/.nvm/nvm.sh" > ~/.zshrc
	chsh -s $(which zsh)

vim:
	cd ~ && git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	cd ~ && sh ~/.vim_runtime/install_awesome_vimrc.sh

emacs:
	cd /tmp && wget http://ftp.eq.uc.pt/software/unix/gnu/emacs/emacs-25.1.tar.xz
	cd /tmp && tar -xvvf emacs-25.1.tar.gz
	cd /tmp/emacs* && ./configure
	cd /tmp/emacs* && make 
	cd /tmp/emacs* && sudo checkinstall
	cd /tmp/emacs* && sudo dpkg -i ./emacs*

xmonad:
	mkdir ~/.xmonad
	cd ~/.xmonad && ln -s ~/dotfiles/xmonad.hs xmonad.hs

fonts:
	sudo apt-get install -y fonts-inconsolata fonts-symbola ttf-ancient-fonts ttf-bitstream-vera fonts-inconsolata
	../localbin/install-font http://jorrel.googlepages.com/Monaco_Linux.ttf	
	wget https://github.com/eosrei/emojione-color-font/releases/download/v1.3/EmojiOneColor-SVGinOT-Linux-1.3.tar.gz -O /tmp/emojione-font.tar.gz
	tar zxf EmojiOneColor-SVGinOT-Linux-1.3.tar.gz
	cd EmojiOneColor-SVGinOT-Linux-1.3 && ./install.sh


