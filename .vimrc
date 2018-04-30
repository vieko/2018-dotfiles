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
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-scriptease', { 'on': [] }
Plug 'tpope/vim-projectionist', { 'on': [] }
Plug 'AndrewRadev/splitjoin.vim'
" Plug 'unblevable/quick-scope'
" Plug 'justinmk/vim-sneak'
Plug 'rhysd/clever-f.vim'
" themes
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
" interface
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kshenoy/vim-signature'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-vinegar'
Plug 'wikitopian/hardmode'
Plug 'takac/vim-hardtime'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'andymass/vim-matchup'
Plug 'mtth/scratch.vim'
" syntax
Plug 'sheerun/vim-polyglot'
" editing
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
" ruby / rails
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails', { 'on': [] }
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" linting
Plug 'w0rp/ale'
" helpers
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-eunuch'

call plug#end()

" Section: Mappings
" -----------------

let mapleader = " "
let maplocalleader = " "

" search for the word under the cursor, considering the current keyword setup for docset  lookup
nmap <silent><Leader>d <Plug>DashSearch

" save
nnoremap <Leader>w :w!<CR>

" better escape
inoremap jk <Esc>

" insert mode movement
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>a
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" Move across wrapped lines like regular lines
" noremap 0 ^
" noremap ^ 0

" copy text to the end of the line (Y consistend with C and D)
nnoremap Y y$

" qq to record, q to stop recording, Q to replay
nnoremap Q @q

" close current buffer and move to previous one
nnoremap <Leader>bq :bd<BAR>bd#<CR>
" change pwd to current working directory
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>
" switch between the last two files
nnoremap <Leader><Leader> <C-^>

" trigger fuzzy search
nnoremap <C-p> :<C-u>FZF<CR>
" show list of current buffers
nnoremap <C-b> :Buffers<CR>
" search content of all files under cwd
nnoremap <C-g> :Rg<CR>
" search all open buffers
nnoremap <C-f> :Lines<CR>

" prevent accidental undos under insert mode
inoremap <C-U> <C-G>u<C-U>

" remove trailing whitespaces
nnoremap <Leader>sw :call StripWhitespace()<CR>

" tab completion
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" clear highlights
nnoremap <silent> <Leader><CR> :noh<CR>

" toggle hardmode
" nnoremap <leader>h :HardTimeToggle<Esc>:call ToggleHardMode()<CR>

" move between linting errors
nmap <silent>[W <Plug>(ale_first)
nmap <silent>[w <Plug>(ale_previous)
nmap <silent>]w <Plug>(ale_next)
nmap <silent>]W <Plug>(ale_last)

" gruvbox overrides for tpope/unimpaired
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>
nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" airline tabline quick selection
nmap <Leader>1 <Plug>AirlineSelectTab1
nmap <Leader>2 <Plug>AirlineSelectTab2
nmap <Leader>3 <Plug>AirlineSelectTab3
nmap <Leader>4 <Plug>AirlineSelectTab4
nmap <Leader>5 <Plug>AirlineSelectTab5
nmap <Leader>6 <Plug>AirlineSelectTab6
nmap <Leader>7 <Plug>AirlineSelectTab7
nmap <Leader>8 <Plug>AirlineSelectTab8
nmap <Leader>9 <Plug>AirlineSelectTab9

" reset clever-f selection
nmap <Leader>f <Plug>(clever-f-reset)

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
set clipboard=unnamed
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
set fillchars+=vert:│
set foldmethod=indent
set foldopen+=jump
set formatoptions+=j " delete comment character when joining commented lines
set grepprg=rg\ --color=never
set nohidden
set history=50
set hlsearch
set ignorecase        " ignore case when searching
set incsearch         " do incremental searching
set laststatus=2      " always display the status bar
set lazyredraw
set linebreak
set list listchars=tab:»·,extends:>,precedes:<,trail:·,eol:¬,nbsp:_,space:·
if exists('+macmeta')
  set macmeta
endif
set mouse=nvi
set mousemodel=popup
" set noeol
set noerrorbells
set nojoinspaces      " user one space (not two) after punctuation
set novisualbell
set nostartofline     " keep the cursor on the same column
set pastetoggle=<F2>
set printoptions=paper:letter
set ruler             " show the cursor position at all times
set scrolloff=3       " always show at least one line above / below cursor
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
set visualbell t_vb=
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
set softtabstop=2
set expandtab

" set cursorline
set cursorline

set textwidth=100
set colorcolumn=+1

set number relativenumber
" set number
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

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
colorscheme gruvbox

" load matchit.vim but only if the user hasn't installed a newer version
" if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
"   runtime! macros/matchit.vim
" endif

" when the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes
let g:is_posix= 1

" Sections: Theme Tweaks
" ----------------------
highlight MatchParen guibg=#3c3836
" highlight Visual ctermbg=235

" special charaters
" hi SpecialKey cterm=NONE ctermfg=0 ctermbg=NONE
" hi NonText cterm=NONE ctermfg=0 ctermbg=NONE

" Section: AutoCommands
" ---------------------

if has("autocmd")
  filetype plugin indent on

  augroup Misc
    autocmd!
    " enable hardmode by default
    autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
    " close quickfix / location list on selection
    autocmd FileType qf nmap <buffer> <CR> <CR>:lcl<CR>
    " automatic number toggle
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber

    " when editing a file, always jump to the last know cursor position
    " don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim)
    autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
  augroup END

  " augroup Linting
  "   autocmd!
  "   " ALE events
  "   if g:has_async
  "     set updatetime=1000
  "     let g:ale_lint_on_text_changed = 0
  "     autocmd CursorHold * call ale#Lint()
  "     autocmd CursorHoldI * call ale#Lint()
  "     autocmd InsertEnter * call ale#Lint()
  "     autocmd InsertLeave * call ale#Lint()
  "   else
  "     echoerr "dotfiles require NeoVim or Vim 8"
  "   endif
  " augroup END

  augroup FTCheck
    autocmd!
    autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd BufRead,BufNewFile *.js set filetype=javascript
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

  augroup NetrwBufferHiddenFix
    autocmd!
    autocmd BufWinEnter *
    \  if &ft != 'netrw'
    \|     set bufhidden=hide
    \| endif
    augroup end

  endif

" Section: Commands
" ----------------
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

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

" matchup convenience
function! s:matchup_convenience_maps()
  xnoremap <sid>(std-I) I
  xnoremap <sid>(std-A) A
  xmap <expr> I mode()=='<c-v>'?'<sid>(std-I)':(v:count?'':'1').'i'
  xmap <expr> A mode()=='<c-v>'?'<sid>(std-A)':(v:count?'':'1').'a'
  for l:v in ['', 'v', 'V', '<c-v>']
    execute 'omap <expr>' l:v.'I%' "(v:count?'':'1').'".l:v."i%'"
    execute 'omap <expr>' l:v.'A%' "(v:count?'':'1').'".l:v."a%'"
  endfor
endfunction
call s:matchup_convenience_maps()

" Section: Plugin Configuration
" -----------------------------

" netrw
" let g:netra_liststyle=3
" let g:netrw_banner=0
" let g:netrw_winsize = 25

" Emmet
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings={
\   'twig': {
\     'extends': 'html',
\   },
\ }

" Solarized
" let g:solarized_contrast='high'
" let g:solarized_visibility='normal'
" let g:airline_solarized_bg='dark'

" ALE
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1
let g:ale_sign_error = '⨯⨯'
let g:ale_sign_warning ='▸▸'
let airline#extensions#ale#error_symbol = '⨯⨯:'
let airline#extensions#ale#warning_symbol = '▸▸:'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {
\  'javascript': ['prettier-eslint','eslint'],
\  'vue': ['prettier'],
\  'typescript': []
\}
let g:ale_fixers = {
\  'javascript': ['eslint'],
\  'vue': ['eslint'],
\}
let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}
" let g:ale_linter_aliases = {'vue': [ 'html' ]}
" Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_splits=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#alt_sep=0
let g:airline#extensions#tabline#show_tabs=0
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#show_close_button=0
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_nr=1
let g:airline#extensions#tabline#show_tab_type=1
let g:airline#extensions#tabline#tabs_label='Tabs'
let g:airline#extensions#tabline#buffers_label='buffers'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" tmuxline
let g:tmuxline_preset='powerline'
" let g:tmuxline_theme = 'powerline'
let g:airline#extensions#tmuxline#enabled=0

let g:tmuxline_theme = {
  \ 'a'    : [ '#282828', '#a89984', 'bold' ],
  \ 'b'    : [ '#ffffff', '#ffffff' ],
  \ 'c'    : [ '#ffffff', '#ffffff' ],
  \ 'x'    : [ '#ffffff', '#ffffff' ],
  \ 'y'    : [ '#a89984', '#504945' ],
  \ 'z'    : [ '#282828', '#a89984', 'bold' ],
  \ 'win'  : [ '#a89984', '#3c3836' ],
  \ 'cwin' : [ '#a89984', '#504945' ],
  \ 'bg'   : [ '#fbf1c' , '#3c3836' ]}

" quick-scope
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1

" vim-sneak
" let g:sneak#label=1
" let g:sneak#streak=1

" vim-clever-f
let g:clever_f_across_no_line=1
let g:clever_f_smart_case=0
let g:clever_f_fix_key_direction=1
let g:clever_f_show_prompt=0
let g:clever_f_chars_match_any_signs=';'
" let g:clever_f_mark_char_color='Search'

" vim-hardmode
let g:HardMode_hardmodeMsg='here be dragons'
let g:HardMode_easymodeMsg='you are weak...'
let g:HardMode_level='wannabe'

" vim-hardtime
let g:hardtime_default_on=1
let g:hardtime_allow_different_key=1
let g:hardtime_showmsg=1
let g:hardtime_ignore_buffer_patterns=[".git/index"]
let g:list_of_normal_keys = ["h", "j", "k", "l", "+"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_disabled_keys = []

" rainbow_parentheses
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]

" vim-matchup
let g:matchup_transmute_enabled=0
let g:matchup_matchparen_deferred=1

" vim-scratch
let g:scratch_autohide=1
let g:scratch_insert_autohide=0
let g:scratch_height=20
let g:scratch_top=0
let g:scratch_persistence_file='/tmp/scratch.vim'
