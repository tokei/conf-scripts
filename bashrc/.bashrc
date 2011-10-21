#
# ~/.bashrc: executed by bash(1) for non-login shells.
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

###
### PATHS + IMPORTS
### ... might need to change the paths to point to the conf-scripts repository
###
CONFSCRIPTS="~/git/conf-scripts"

PATH="$PATH:~/Scripts"
PATH="$PATH:$CONFSCRIPTS/bashrc"

. parse_git_branch.sh
. alias.sh


###
### HISTORY CONTROL
### ... stuff written to .bash_history
###

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# commands that don't need to be included into the history
# note the ' .*' that keeps everything out of the history that starts with a space
export HISTIGNORE="&:l:ll:exit: .*:svn stat:git status:git commit:git pull:"

# max number of lines in .bash_history
export HISTFILESIZE=3000


###
### PROMPT
###

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm)
    PS1="[${debian_chroot:+($debian_chroot)}\[\033[01;30m\]\u@\h\[\033[00m\]:\[\033[01m\]\w\[\033[00m\]] \[\033[1;31m\$(parse_git_branch)\n\[\033[01;32m\]>\[\033[00m\] "
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}[\u@\h:\w]\n> '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac


###
### Misc
###

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

