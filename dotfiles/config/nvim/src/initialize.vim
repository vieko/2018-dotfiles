let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Section: Options
" ----------------

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set breakindent showbreak=\ +
" set cmdheight=2
set noshowmode
setglobal commentstring=#\ %s
set completeopt=noinsert,menuone,noselect
set complete=.,w,b,u,t,i
set clipboard=unnamedplus
set pumheight=15
set confirm
set dictionary+=/usr/share/dict/words
set display+=lastline
set encoding=utf8 nobomb
let &fileencodings = substitute(&fileencodings,"latin1","cp1252","")
set fileformats=unix,dos,mac
set fillchars+=vert:│
set foldmethod=syntax
set foldopen+=jump
" set nofoldenable
set formatoptions+=j
set grepprg=rg\ --color=never
set guicursor=
set nohidden
set history=50
set hlsearch
set ignorecase
set incsearch
set inccommand=nosplit
set laststatus=2
set lazyredraw
set linebreak
set list listchars=tab:»·,extends:>,precedes:<,trail:·,eol:¬,nbsp:_,space:·
set mouse=nvi
set mousemodel=popup
" set noeol
set noerrorbells
set nojoinspaces
set novisualbell
set nostartofline
" set pastetoggle=<F2>
set printoptions=paper:letter
set ruler
set scrolloff=3
set shortmess=atI
set showcmd
set showmatch
set sidescrolloff=5
set signcolumn=yes
set smartcase
set smarttab
set spelllang=en_us
set spellfile=~/nvim/spell/en.utf-8.add
" set switchbuf=useopen
setglobal tags=./tags
set timeoutlen=1200
set ttimeoutlen=50
set undofile
set viminfo=!,'20,<50,s10,h
set visualbell t_vb=
set virtualedit=block
set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,*.o,*~,.*.un~,*.pyc,*/tmp/*,*.swp
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set winaltkeys=no
set directory=~/.config/nvim/swap
set backupdir=~/.config/nvim/backup
set undodir=~/.config/nvim/undo
set backupskip=/tmp/*,/private/tmp/*

" Section: Interface
" ------------------

set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set expandtab
set cursorline
set textwidth=80
set colorcolumn=+1
set number relativenumber
set numberwidth=5
set splitbelow
set splitright
let g:html_indent_tags = 'li|p'

" Section: Visuals
" ----------------

syntax on
set termguicolors
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0
let g:gruvbox_termcolors=256
colorscheme gruvbox
highlight MatchParen guibg=#3c3836

" Section: Commands
" ---------------------

" hardmode on startup
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" toggle relative / no relative numbers
autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
autocmd BufReadPost *
      \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
" emmet on this filetypes
autocmd FileType html,css,scss,less,twig,javascript.jsx EmmetInstall

augroup Linting
  autocmd!
  set updatetime=1000
  let g:ale_lint_on_text_changed = 0
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertEnter * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
augroup END

augroup NetrwBufferHiddenFix
  autocmd!
  autocmd BufWinEnter *
        \  if &ft != 'netrw'
        \|     set bufhidden=hide
        \| endif
augroup END

augroup Terminal
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Section: Functions
" ------------------

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

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ -S
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
