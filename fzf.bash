# Setup fzf
# ---------

if [[ -d /usr/local/src/fzf ]]; then
  FZF_DIR='/usr/local/src/fzf';
elif [[ -d /usr/local/opt/fzf ]]; then
  FZF_DIR='/usr/local/opt/fzf';
fi;

if [[ -n FZF_DIR ]]; then
  if [[ ! "$PATH" == *$FZF_DIR/bin* ]]; then
    export PATH="$PATH:$FZF_DIR/bin"
  fi

  # Auto-completion
  # ---------------
  [[ $- == *i* ]] && source "$FZF_DIR/shell/completion.bash" 2> /dev/null

  # Key bindings
  # ------------
  source "$FZF_DIR/shell/key-bindings.bash"
fi;

