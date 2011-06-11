PS1='\[\e[0;31m\]\u@\h\[\e[m\]\[\e[0;37m\]:\[\e[m\]\[\e[1;32m\]\w\[\e[m\]\[\e[0;37m\]\$ \[\e[m\]\[\e[0;37m\]'
export TERM=xterm-256color
export PATH=$PATH:/home/azer/bin
export PATH=$PATH:~/opt/leiningen
export PATH=$PATH:/var/lib/gems/1.8/bin/
export BOOKMARKS_DIR="$HOME/bookmarks"

# ALIASES
alias ls='ls -a --color=auto'
alias rm='rm -v -i'
alias cp='cp -v -i'
alias mv='mv -v -i'
alias today="date '+%d%h%y'"
alias mess='clear ; tail -f /var/log/messages'

alias vi='vim'

# FUNCTIONS
calc(){ awk "BEGIN{ print $* }" ;}

# JAVA
JAVA_HOME="/opt/java"
export JAVA_HOME

# CLOJURE
export CLOJURE_EXT=~/.clojure
export PATH=$PATH:~/opt/clojure-contrib/launchers/bash
export PATH=$PATH:~/opt/leiningen
alias clj=clj-env-dir

# ANDROID
export PATH=$PATH:~/opt/android/tools
export PATH=$PATH:~/opt/android/platform-tools

# Bash Directory Bookmarks
alias m1='alias g1="cd `pwd`"'
alias m2='alias g2="cd `pwd`"'
alias m3='alias g3="cd `pwd`"'
alias m4='alias g4="cd `pwd`"'
alias m5='alias g5="cd `pwd`"'
alias m6='alias g6="cd `pwd`"'
alias m7='alias g7="cd `pwd`"'
alias m8='alias g8="cd `pwd`"'
alias m9='alias g9="cd `pwd`"'
alias mdump='alias|grep -e "alias g[0-9]"|grep -v "alias m" > ~/.bookmarks'
alias lma='alias | grep -e "alias g[0-9]"|grep -v "alias m"|sed "s/alias //"'
touch ~/.bookmarks
source ~/.bookmarks

source ~/.local/bin/bashmarks.sh

TZ='Europe/Istanbul'; export TZ
