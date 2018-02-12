#### Set up the prompt
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

# function to get just the last two dirs in the path to avoid long prompts
function last_two_dirs {
  # use * as the sed delimiter, since it should NEVER
  # show up as a char in my path
  pwd | sed "s*${PWD%/*/*}/**"
}

# Source git stuff for __git_ps1
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
    . /usr/local/etc/bash_completion.d/git-completion.bash
    . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]Mac\[\033[00m\]:\[\033[01;34m\]$(last_two_dirs)\[\033[00m\]\
\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\h:$(last_two_dirs)$(__git_ps1)\$ '
fi
unset color_prompt

source /Users/$USER/.bash_aliases

# Use vi bindings on the command line.
set -o vi

# Don't use /usr/bin: http://stackoverflow.com/questions/7211820
export PATH="/opt/local/bin:$PATH:/usr/local/mysql/bin:/Users/$USER/bin"
export GOROOT="/usr/local/go"

# pretty tabs
tabs 2

# History across everything:
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Docker
#eval $(docker-machine env default)

# added by Anaconda2 4.0.0 installer
export PATH="$HOME/anaconda2/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '$HOME/Downloads/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '$HOME/Downloads/google-cloud-sdk/completion.bash.inc'

# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/mongodb@3.0/bin:/usr/local/opt/ipython@5/bin:$PATH"
# export PYTHONPATH="/usr/local/lib/python2.7/site-packages/"
