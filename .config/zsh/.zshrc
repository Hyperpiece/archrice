# Hyper's zsh config

# Needed
GPG_TTY=$(tty)
export GPG_TTY

# Enable colors and change prompt:
autoload -U colors && colors
PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd
stty stop undef
setopt interactive_comments

# Tab = four spaces
tabs -4

# Use a history file
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.cache/zsh/history"

# Best tab completion ever
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d "$HOME/.cache/zsh/compdump"
_comp_options+=(globdots)

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# vi mode
bindkey -v
export KEYTIMEOUT=1

autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

zle-keymap-select() {
    if [[ $KEYMAP == vicmd ]] || [[ $1 == block ]]; then
        echo -ne "\e[1 q"
    elif [[ $KEYMAP == main ]] || [[ $KEYMAP == viins ]] || [[ -z $KEYMAP ]] || [[ $1 == beam ]]; then
        echo -ne "\e[5 q"
    fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
}
zle -N zle-line-init

# Load aliases if existent.
[[ -f "$HOME/.config/aliasrc" ]] && . "$HOME/.config/aliasrc"

# Use lf to switch directories and bind it to ctrl-o
lfcd() {
    tmp="$(mktemp -uq)"
    trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^o' '^ulfcd\n'

# Make use of zsh-fast-syntax-highlighting if available.
# This line should always be last.
. /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
