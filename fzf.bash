# Setup fzf
# ---------

# TODO: Split on /usr/local/opt/fzf vs /usr/local/src/fzf
if [[ ! "$PATH" == */usr/local/src/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/src/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/src/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/src/fzf/shell/key-bindings.bash"

