" Section: Plugins
" ----------------

if &compatible
  set nocompatible
endif

" remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command! -nargs=1 UnPlug call s:UnPlug(<args>)

let g:has_async = v:version >= 800 || has('nvim')

call plug#begin('~/.vim/bundle')

" workflows
Plug 'ctrlpvim/ctrlp.vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'benmills/vimux'
" syntax / themes
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" html / js / css / etc
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
" ruby / rails
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'
" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" helpers
Plug 'tpope/vim-eunuch'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'

if g:has_async
  Plug 'w0rp/ale'
endif

call plug#end()

" Section: Mappings
" -----------------

let mapleader = " "
nnoremap - :
inoremap jk <Esc>                         " better escape key
nnoremap <Leader>w :w!<CR>                " fast save
nnoremap <silent> vv <C-w>v               " split vertically
nnoremap <Leader>t :tabnew<CR>            " create new tab
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR> " change pwd to current file's
inoremap <C-U> <C-G>u<C-U>                " prevent accidental undo in insert mode

" remove trailing whitespaces
nnoremap <leader>ss :call StripWhitespace()<CR>

" tab completion
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" clear highlights
nnoremap <silent> <Leader><CR> :noh<CR>

" switch between the last two files
nnoremap <Leader><Leader> <C-^>

" this is a great idea!
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" quicker window movement
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l

" move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" airline tabs
nnoremap <Leader>1 <Plug>AirlineSelectTab1
nnoremap <Leader>2 <Plug>AirlineSelectTab2
nnoremap <Leader>3 <Plug>AirlineSelectTab3
nnoremap <Leader>4 <Plug>AirlineSelectTab4
nnoremap <Leader>5 <Plug>AirlineSelectTab5
nnoremap <Leader>6 <Plug>AirlineSelectTab6
nnoremap <Leader>7 <Plug>AirlineSelectTab7
nnoremap <Leader>8 <Plug>AirlineSelectTab8
nnoremap <Leader>9 <Plug>AirlineSelectTab9
nnoremap <Leader>- <Plug>AirlineSelectPrevTab
nnoremap <Leader>+ <Plug>AirlineSelectNextTab

" external commands
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" Section: Options
" ----------------

set autoindent
set autoread          " autoload file changes
set autowrite         " automatically :write before running commands
set backspace=indent,eol,start
if exists('+breakindent')
  set  breakindent showbreak=\ +
endif
" set binary
set cmdheight=2       " command bar height
setglobal commentstring=#\ %s
set complete-=i
set confirm           " prompt to save when command fails
set dictionary+=/usr/share/dict/words
set display+=lastline
set encoding=utf8 nobomb
if has("eval")
  let &fileencodings = substitute(&fileencodings,"latin1","cp1252","")
endif
set fileformats=unix,dos,mac
set foldmethod=marker
set foldopen+=jump
set formatoptions+=j " delete comment character when joining commented lines
set grepprg=rg\ --color=never
" if has("eval")
  " let &highlight = substitute(&highlight,'NonText','SpecialKey','g')
" endif
set history=50
set ignorecase        " ignore case when searching
set incsearch         " do incremental searching
set laststatus=2      " always display the status bar
set lazyredraw
set linebreak
" if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
  " let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
  " let &fillchars = "vert:\u259a,fold:\u00b7"
" else
  " set list listchars=tab:»·,extends:>,precedes:<,trail:·,eol:¬,nbsp:_,space:·
" endif
set list listchars=tab:»·,extends:>,precedes:<,trail:·,eol:¬,nbsp:_,space:·
if exists('+macmeta')
  set macmeta
endif
set mouse=nvi
set mousemodel=popup
" set noeol
set noerrorbells
set nojoinspaces      " user one space (not two) after punctuation
set pastetoggle=<F2>
set printoptions=paper:letter
set ruler             " show the cursor position at all times
set scrolloff=1       " always show at least one line above / below cursor
set shortmess=atI     " hide intro message
set showcmd           " display incomplete commands
set showmatch
set sidescrolloff=5
set smartcase
set smarttab
if exists("+spelllang")
  set spelllang=en_us
endif
set spellfile=~/.vim/spell/en.utf-8.add
" set switchbuf=useopen
setglobal tags=./tags
set timeoutlen=1200   " more time for macros
set ttimeoutlen=50    " faster Esc
if exists("+undofile")
  set undofile
endif
if v:version >= 700
  set viminfo=!,'20,<50,s10,h
endif
set visualbell
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,*.o,*~,.*.un~,*.pyc,*/tmp/*,*.swp
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set winaltkeys=no

set directory=~/.vim/swaps
set backupdir=~/.vim/backups
if exists("&undodir")
  set undodir=~/.vim/undos
endif
set backupskip=/tmp/*,/private/tmp/*

" Section: Interface
" ------------------

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" set cursorline
set nocursorline

set textwidth=100
set colorcolumn=+1

" set number relativenumber
set number
set numberwidth=5

set splitbelow
set splitright

" threat <li> <p> tags like block tags
let g:html_indent_tags = 'li|p'

" Section: Performance
" --------------------

" Sections: Visuals
" -----------------

syntax on
set t_Co=256
set background=dark
colorscheme solarized

" TODO: replace with vim-matchup
" load matchit.vim but only if the user hasn't installed a newer version
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" when the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes
let g:is_posix = 1

" Sections: Theme Tweaks
" ----------------------

" javascript
hi link jsModuleKeyword     Identifier
hi link jsVariableDef       Identifier
hi link jsFuncArgs          Identifier
hi link jsFuncCall          Function
hi link jsObjectProp        Identifier
hi link jsObjectKey         Label
hi link jsObjectValue       Normal

" special charaters
hi SpecialKey cterm=NONE ctermfg=0 ctermbg=NONE
hi NonText cterm=NONE ctermfg=0 ctermbg=NONE

" Section: AutoCommands
" ---------------------

if has("autocmd")
  filetype plugin indent on

  augroup Misc
    autocmd!
    " automatic number toggle
    " autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    " autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber

    " when editing a file, always jump to the last know cursor position
    " don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim)
    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  augroup END

  augroup Linting
    autocmd!
    " ALE events
    if g:has_async
      set updatetime=1000
      let g:ale_lint_on_text_changed = 0
      autocmd CursorHold * call ale#Lint()
      autocmd CursorHoldI * call ale#Lint()
      autocmd InsertEnter * call ale#Lint()
      autocmd InsertLeave * call ale#Lint()
    else
      echoerr "dotfiles require NeoVim or Vim 8"
    endif
  augroup END

  augroup FTCheck
    autocmd!
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.json set filetype=json syntax=javascript
    autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
    autocmd FileType html,css,scss,twig EmmetInstall
  augroup END

  augroup FTOptions
    autocmd!
    autocmd Syntax   javascript               setlocal isk+=$
    autocmd FileType xml,xsd,xslt,javascript  setlocal ts=2
    autocmd FileType text,txt,mail            setlocal ai com=fb:*,fb:-,n:>
    autocmd FileType git,gitcommit            setlocal foldmethod=syntax foldlevel=1
    autocmd FileType gitcommit                setlocal spell
    autocmd FileType html                     setlocal iskeyword+=~
    autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak nolist
  augroup END
endif

" Section: Functions
" ------------------
" will insert a tab at the beginning of a line,
" will use completion if not at beginning
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<Tab>"
  else
    return "\<C-p>"
  endif
endfunction

" strip trailing whitespace
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction


" Section: Plugin Configuration
" -----------------------------

" netrw
let g:netrw_banner=0
let g:netra_liststyle=3

" CtrlP
let g:ctrlp_user_command='rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching=0
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_witch_buffer='et'

" ALE
hi ALEError cterm=underline ctermfg=red
hi ALEErrorSign cterm=underline ctermfg=red
hi ALEWarning cterm=underline ctermfg=yellow
hi ALEWarningSign cterm=underline ctermfg=yellow

" Emmet
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<C-Z>'

" Vimux
let g:VimuxHeight="20"
let g:VimuxOrientation="h"

" Solarized
let g:solarized_contrast='high'
let g:solarized_visibility='normal'

" Airline
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" vim-vue
let g:vue_disable_pre_processors=1
