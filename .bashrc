PS1='\[\e[0;31m\]\u@\h\[\e[m\]\[\e[0;37m\]:\[\e[m\]\[\e[1;32m\]\w\[\e[m\]\[\e[0;37m\]\$ \[\e[m\]\[\e[0;37m\]'
export TERM=xterm-256color
export PATH=$PATH:"$HOME/.local/bin"
export PATH=$PATH:~/opt/leiningen
export PATH=$PATH:/var/lib/gems/1.8/bin/

# ALIASES
alias ls='ls -aG'
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

source ~/.local/bin/bashmarks/bashmarks.sh
source ~/.local/bin/git-completion.bash
