set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Section: Plugins
" ----------------
if dein#load_state(expand('~/.cache/dein'))
  call dein#begin(expand('~/.cache/dein'))
  " plugin managers
  call dein#add('Shougo/dein.vim')
  call dein#add('wsdjeg/dein-ui.vim')
  " autocomplete
  call dein#add('Shougo/neco-vim')
  call dein#add('neoclide/coc.nvim', {'rev': 'v0.0.45', 'build': 'npm install'})
  " dark power
  " call dein#add('Shougo/context_filetype.vim')
  " call dein#add('Shougo/neopairs.vim')
  " call dein#add('Shougo/echodoc.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('neoclide/denite-extra')
  call dein#add('Shougo/defx.nvim')
  call dein#add('kristijanhusak/defx-git')
  " syntax
  call dein#add('sheerun/vim-polyglot')
  " interface
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('christoomey/vim-tmux-navigator')
  call dein#add('Valloric/MatchTagAlways')
  call dein#add('andymass/vim-matchup')
  call dein#add('machakann/vim-highlightedyank')
  call dein#add('justinmk/vim-sneak')
  " editor
  call dein#add('tpope/vim-repeat')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-commentary')
  " call dein#add('mattn/emmet-vim', { 'on_ft': [ 'javascript.jsx', 'html', 'css', 'scss' ]})
  call dein#add('tpope/vim-unimpaired')
  call dein#add('AndrewRadev/splitjoin.vim')
  call dein#add('godlygeek/tabular')
  " version control
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-rhubarb')
  " themes
  call dein#add('morhetz/gruvbox')
  " testing
  " call dein#add('janko-m/vim-test')
  call dein#end()
  call dein#save_state()
endif

syntax enable
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
