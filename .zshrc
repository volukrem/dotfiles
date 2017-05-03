ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh


#zstyle ':completion:*:*:git:*' script ~/dotfiles/git-completion.zsh
PS1="  %{$fg[white]%}λ%{$reset_color%}  "

unsetopt correct_all

export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:$PATH
export GOPATH=$HOME/code/golang
export PATH=$PATH:$GOPATH/bin

export PATH=~/localbin:$PATH
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES="C"
export EDITOR=vi
export TERM=rxvt-unicode

# ALIASES
alias ls='ls -aG'
alias today="date '+%d%h%y'"
alias mess='clear ; tail -f /var/log/messages'
alias vi='vim'
alias c='clear; pwd'

# FUNCTIONS
calc(){ awk "BEGIN{ print $* }" ;}


TZ='US/Pacific'; export TZ

source ~/localbin/bashmarks/bashmarks.sh

export NVM_DIR="/home/azer/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
