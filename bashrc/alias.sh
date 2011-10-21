# 
# bash aliases
#

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=always'
fi

# some more ls aliases
alias l='ls -lhBp'
alias ll='ls -lAhBp'
alias lll='ls -lAhp'

# always use colored and case insensitive grep
alias grep='grep --color=always -i'
