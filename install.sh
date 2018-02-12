#!/bin/bash

# TODO: Parameterize Linux package manager -- don't assume Debian
# Determine the platform
if [ "$(uname)" == "Darwin" ]; then
  PLATFORM="Mac"
else
  PLATFORM="Linux"
fi;

if [[ $PLATFORM == "Mac" ]]; then
  HOME="/Users/$USER"
else
  HOME="/home/$USER"
fi;

DOTFILES=$HOME/dotfiles

if [[ $PLATFORM == "Mac" && -z "$(xcode-select -p)" ]]; then
  echo "Installing Xcode command line tools"
  xcode-select --install
fi;

# git
ln -f -s $DOTFILES/gitconfig $HOME/.gitconfig

# Brew
if [[ $PLATFORM == "Mac" && -z "$(command -v brew)" ]]; then
  echo "Installing brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# tmux
if [[ -z "$(command -v tmux)" ]]; then
  echo "Installing tmux"
  if [[ $PLATFORM == "Mac" ]]; then
    brew install tmux
  else
    sudo apt-get install tmux
  fi;
fi;
ln -f -s $DOTFILES/tmux.conf $HOME/.tmux.conf

# fzf
if [[ -z "$(command -v fzf)" ]]; then
  echo "Installing fzf"
  if [[ $PLATFORM == "Mac" ]]; then
    brew install fzf
    $(brew --prefix)/opt/fzf/install
  else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  fi;
fi
ln -f -s $DOTFILES/fzf.bash $HOME/.fzf.bash

# ag
if [[ -z "$(command -v ag)" ]]; then
  echo "Installing ag"
  if [[ $PLATFORM == "Mac" ]]; then
    brew install the_silver_searcher
  else
    sudo apt-get install silversearcher-ag
  fi;
fi;

# tree
if [[ -z "$(command -v tree)" ]]; then
  echo "Installing tree"
  if [[ $PLATFORM == "Mac" ]]; then
    brew install tree
  else
    sudo apt-get install tree
  fi;
fi;

# pup
if [[ -z "$(command -v pup)" ]]; then
  echo "Installing pup"
  if [[ $PLATFORM == "Mac" ]]; then
    brew install pup
  else
    sudo apt-get install pup
  fi;
fi;

# jq
if [[ -z "$(command -v jq)" ]]; then
  echo "Installing jq"
  if [[ $PLATFORM == "Mac" ]]; then
    brew install jq
  else
    sudo apt-get install jq
  fi;
fi;

# .bash_aliases
if [ $PLATFORM == "Mac" ]; then
  ln -f -s $DOTFILES/mac_bash_aliases $HOME/.bash_aliases
else
  ln -f -s $DOTFILES/linux_bash_aliases $HOME/.bash_aliases
fi;

# .bash_profile
if [ $PLATFORM == "Mac" ]; then
  ln -f -s $DOTFILES/bash_profile $HOME/.bash_profile
fi;
# TODO: audit linux version
