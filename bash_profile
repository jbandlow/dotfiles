export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

source /Users/jbandlow/.bash_aliases

# Source git stuff
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh


# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# function to get just the last two dirs in the path to avoid long prompts
function last_two_dirs {
  # use * as the sed delimiter, since it should NEVER
  # show up as a char in my path
  pwd | sed "s*${PWD%/*/*}/**"
}

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]$(last_two_dirs)\[\033[00m\]\
\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\h:$(last_two_dirs)$(__git_ps1)\$ '
fi
unset color_prompt force_color_prompt

# Use vi bindings on the command line.
set -o vi

# Don't use /usr/bin: http://stackoverflow.com/questions/7211820
export PATH="/opt/local/bin:$PATH"
export GOROOT="/usr/local/go"

# pretty tabs
tabs 2
