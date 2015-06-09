## Command history configuration
if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

# Append history to the histfile instead of making a new one useless when INC_APPEND_HISTORY is set
# setopt APPEND_HISTORY
# Add the timestamp and the duration of each command to HISTFILE
# setopt EXTENDED_HISTORY
# When HISTSIZE is reached remove repeated commands before
setopt HIST_EXPIRE_DUPS_FIRST
# Never save duplicated lines to the history
setopt HIST_IGNORE_ALL_DUPS
# Don't save to HISTFILE commands starting with a space
setopt HIST_IGNORE_SPACE
# Reduce spaces that mean nothing to the shell
setopt HIST_REDUCE_BLANKS
# Never save duplicated commands to the HISTFILE
setopt HIST_SAVE_NO_DUPS
# Expand hist instead of executing command
setopt HIST_VERIFY
# Add command to HISTFILE as soon as they are executed
#   This also makes adding the timestamp imposible since the addition takes place before the command is executed
setopt INC_APPEND_HISTORY
# Autoload history from HISTFILE and set INC_APPEND_HISTORY and EXTENDED_HISTORY
# to force syncing execute `fc -Rl`
# setopt SHARE_HISTORY
