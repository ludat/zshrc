export ADOTDIR=$HOME/.zsh/

source $HOME/.zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen-use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen-bundle git
antigen-bundle command-not-found
antigen-bundle history-substring-search

# Syntax highlighting bundle.
antigen-bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen-theme agnoster

# Tell antigen that you're done.
antigen-apply

alias la="ls -a"

function rangercd {
    tempfile=$(mktemp)
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

export EDITOR='vim'

export DEFAULT_USER='lucas'

export wlan='wlp3s0'

# [[ $TERM = "rxvt-unicode-256color" ]] && exec tmux

stty -ixon

# eval "$(fasd --init auto)"

# Add personal scripts to path
export PATH=$PATH:~/bin

# Check if there is a display and tty is number 1 and there is a TMUX variable
# if [ -z "$DISPLAY" ] && [ $XDG_VTNR -eq 1 ] && [ -z "$TMUX" ]; then
#     exec startx
# else
#     true
# fi
