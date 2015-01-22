#
# Description: This file holds all my BASH configurations and aliases
#
# ------------------------------
# 1. ENVIRONMENT CONFIGURATION
# ------------------------------

# Change prompt
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] > "

# Set paths
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Set default editor
export EDITOR=emacs

# Add color to terminal
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# My aliases
alias ls='ls -GFh'
