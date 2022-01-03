# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jbandlow/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jbandlow/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jbandlow/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/jbandlow/.fzf/shell/key-bindings.bash"
