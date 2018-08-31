#!/usr/bin/env bash
# BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] &&
  source ~/.bash_profile &&
  # [ -s $BASE16_SHELL/profile_helper.sh ] &&
  # eval "$($BASE16_SHELL/profile_helper.sh)" &&
  source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
  # eval "$(_TMUXP_COMPLETE=source tmuxp)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
