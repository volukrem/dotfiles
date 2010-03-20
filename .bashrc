PS1='\[\e[0;31m\]\u@\h\[\e[m\]\[\e[0;37m\]:\[\e[m\]\[\e[1;32m\]\w\[\e[m\]\[\e[0;37m\]\$ \[\e[m\]\[\e[0;37m\]'

# ALIASES
alias ls='ls -a --color=auto'
alias rm='rm -v -i'
alias cp='cp -v -i'
alias mv='mv -v -i'
alias today="date '+%d%h%y'"
alias mess='clear ; tail -f /var/log/messages'

# FUNCTIONS
calc(){ awk "BEGIN{ print $* }" ;}

