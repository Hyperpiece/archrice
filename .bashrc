# Hyper's bash config

# GnuPG
GPG_TTY=$(tty)
export GPG_TTY

# Set prompt
PS1="\e[1;31m[\e[33m\u\e[32m@\e[34m\h \e[35m\w\e[31m]\e[0;0m\$ "

# Tabstop
tabs -8

# Use a history file
export HISTCONTROL="ignoredups"
export HISTSIZE=10000
export HISTFILE="$HOME/.cache/bash/history"
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Use lf to switch directories and bind it to Ctrl-o
lfcd() {
	tmp="$(mktemp -uq)"
	trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
	lf -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
bind '"\C-o":"lfcd\n"'

# Load aliases if existent
[[ -f "$HOME/.config/aliasrc" ]] && . "$HOME/.config/aliasrc"
