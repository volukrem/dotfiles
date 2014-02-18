all:
	echo "source ~/dotfiles/.zshrc \nsource ~/dotfiles/.nvm \nsource ~/localbin/bashmarks/bashmarks.sh" > ~/.zshrc
	cd ~/ && ln -s dotfiles/.tmux.conf
	cd ~/ && ln -s dotfiles/.gitconfig
	make vim

vim:
	git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
