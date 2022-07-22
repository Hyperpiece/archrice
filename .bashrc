# Hyper's bash config

# GnuPG
GPG_TTY=$(tty)
export GPG_TTY

# Set prompt
PS1="[\u@\h \w]\$ "

# Tabstop
tabs -8

# Use a history file
export HISTCONTROL="ignoredups"
export HISTSIZE=10000
export HISTFILE="$HOME/.cache/bash/history"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Load aliases if existent
[[ -f "$HOME/.config/aliasrc" ]] && . "$HOME/.config/aliasrc"
