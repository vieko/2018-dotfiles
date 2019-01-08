" Section: Plugins
" ----------------
call plug#begin('~/.local/share/nvim/plugged')
" autocomplete
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" dark power
Plug 'Shougo/denite.nvim'
Plug 'neoclide/denite-extra'
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-git'
" syntax
Plug 'sheerun/vim-polyglot'
" interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Valloric/MatchTagAlways'
Plug 'andymass/vim-matchup'
Plug 'machakann/vim-highlightedyank'
Plug 'justinmk/vim-sneak'
" editor
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" themes
Plug 'morhetz/gruvbox'
call plug#end()
