all:
	echo "source ~/dotfiles/.zshrc \nsource ~/dotfiles/.nvm \nsource ~/localbin/bashmarks/bashmarks.sh" > ~/.zshrc
	cd ~/ && ln -s dotfiles/.tmux.conf
	cd ~/ && ln -s dotfiles/.gitconfig
