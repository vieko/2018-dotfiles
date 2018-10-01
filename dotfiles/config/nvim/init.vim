scriptencoding utf-8

let g:python_host_prog = '/home/vieko/.pyenv/versions/py27/bin/python'
let g:python3_host_prog = '/home/vieko/.pyenv/versions/py36/bin/python'

let $CONFIG = '$HOME/.config/nvim/src'

source $CONFIG/plugins.vim
source $CONFIG/initialize.vim
source $CONFIG/configure.vim
source $CONFIG/powerline.vim
source $CONFIG/denite.vim
source $CONFIG/completion.vim
source $CONFIG/keybindings.vim
