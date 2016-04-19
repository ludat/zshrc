# load zgen
export ZGEN_DIR="$HOME/.zsh/zgen/"
source "$HOME/.zsh/zgen.zsh"

source "$HOME/.zsh/bzr.zsh"
source "$HOME/.zsh/completion.zsh"
source "$HOME/.zsh/correction.zsh"
source "$HOME/.zsh/directories.zsh"
source "$HOME/.zsh/functions.zsh"
source "$HOME/.zsh/git.zsh"
source "$HOME/.zsh/grep.zsh"
source "$HOME/.zsh/history.zsh"
source "$HOME/.zsh/key-bindings.zsh"
source "$HOME/.zsh/misc.zsh"
source "$HOME/.zsh/nvm.zsh"
source "$HOME/.zsh/prompt_info_functions.zsh"
source "$HOME/.zsh/spectrum.zsh"
source "$HOME/.zsh/termsupport.zsh"
source "$HOME/.zsh/theme-and-appearance.zsh"


# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

autoload -U promptinit
promptinit

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"
    # plugins
    # zgen oh-my-zsh plugins/git
    zgen load robbyrussell/oh-my-zsh plugins/sudo
    zgen load robbyrussell/oh-my-zsh plugins/command-not-found
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-history-substring-search

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen load robbyrussell/oh-my-zsh themes/arrow
    zgen load sorin-ionescu/prezto modules/prompt/functions

    # save all to init script
    zgen save
fi

function rancd {
    tempfile="$(mktemp /tmp/chosendir.XXXXXXXX)"
    ranger --choosedir="$tempfile"
    cd -- "$(cat "$tempfile")"
    rm -- "$tempfile"
}


# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

prompt agnoster
