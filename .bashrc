#!/usr/bin/env bash
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && source ~/.bash_profile && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)" && eval "$(_TMUXP_COMPLETE=source tmuxp)"
