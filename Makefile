all:
	make config
	make install
	make zsh
	make vim
	make nvm

config:
	cd ~/ && ln -s dotfiles/.tmux.conf
	cd ~/ && ln -s dotfiles/.gitconfig

nvm:
	cd ~ && curl https://raw.github.com/creationix/nvm/master/install.sh | sh
	cd ~ && source ~/.nvm/nvm.sh

node:
	nvm install 0.10
	nvm use 0.10
	nvm alias default 0.10

gvm:
	bash < <(curl -s https://raw.github.com/moovweb/gvm/master/binscripts/gvm-installer)
	gvm install go1
	gvm use go1 --default

localbin:
	cd ~/ && git clone git@github.com:azer/localbin.git
	cd ~/localbin && make

install:
	brew install curl wget git tmux zsh

zsh:
	cd ~ && curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	echo "source ~/dotfiles/.zshrc \nsource ~/dotfiles/.nvm \nsource ~/localbin/bashmarks/bashmarks.sh\nsource ~/.nvm/nvm.sh" > ~/.zshrc

vim:
	git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
