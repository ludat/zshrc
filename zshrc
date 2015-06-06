# load zgen
source "$HOME/.zsh/zgen.zsh"

source ".zsh/bzr.zsh"
source ".zsh/completion.zsh"
source ".zsh/correction.zsh"
source ".zsh/directories.zsh"
source ".zsh/functions.zsh"
source ".zsh/git.zsh"
source ".zsh/grep.zsh"
source ".zsh/history.zsh"
source ".zsh/key-bindings.zsh"
source ".zsh/misc.zsh"
source ".zsh/nvm.zsh"
source ".zsh/prompt_info_functions.zsh"
source ".zsh/spectrum.zsh"
source ".zsh/termsupport.zsh"
source ".zsh/theme-and-appearance.zsh"


# Load and run compinit
autoload -U compinit
compinit -i -d "${ZSH_COMPDUMP}"

autoload -U promptinit
promptinit

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

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

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
