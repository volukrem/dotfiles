
#plugins=(archlinux npm lein)

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

PS1="  %{$fg[white]%}λ%{$reset_color%}  "

unsetopt correct_all

export GOPATH=$HOME/dev/golang
export PATH=$PATH:$GOPATH/bin

export TERM="xterm-256color"
export PATH=~/localbin:$PATH
export PATH=$PATH:~/.node_modules/.bin
export PATH=$PATH:~/opt/leiningen
export PATH=$PATH:~/opt/neo4j/bin
export PATH=$PATH:/var/lib/gems/1.8/bin/
export PATH=$PATH:~/.gem/ruby/2.0.0/bin/
export BROWSER="delicious-surf"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_MESSAGES="C"
#export NODE_NO_READLINE=1

# ALIASES
alias ls='ls -aG'
alias today="date '+%d%h%y'"
alias mess='clear ; tail -f /var/log/messages'
alias vi='vim'
alias c='clear; pwd'

# FUNCTIONS
calc(){ awk "BEGIN{ print $* }" ;}

# JAVA
export JAVA_HOME="/opt/java"
export NEO4J_HOME="$HOME/opt/neo4j"

# CLOJURE
export CLOJURE_EXT=~/.clojure
export PATH=$PATH:~/opt/clojure-contrib/launchers/bash
export PATH=$PATH:~/opt/leiningen
alias clj=clj-env-dir

# ANDROID
export PATH=$PATH:~/opt/android/tools
export PATH=$PATH:~/opt/android/platform-tools

TZ='US/Pacific'; export TZ
