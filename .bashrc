#!/usr/bin/env bash
# BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] &&
  source ~/.bash_profile &&
  # [ -s $BASE16_SHELL/profile_helper.sh ] &&
  # eval "$($BASE16_SHELL/profile_helper.sh)" &&
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
  eval "$(_TMUXP_COMPLETE=source tmuxp)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
