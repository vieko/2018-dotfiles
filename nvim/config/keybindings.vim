" Section: Keybindings
" --------------------

" better leader
let mapleader = " "
let maplocalleader = " "

" action with ;
nnoremap ; :

" save
nnoremap <Leader>w :w!<CR>

" better escape
inoremap jk <Esc>

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

" prevent accidental undos under insert mode
inoremap <C-U> <C-G>u<C-U>

" Delete trailing whitespace with F5
:nnoremap <silent> <F2> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" clear highlights
nnoremap <silent> <Leader><CR> :noh<CR>

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

" open-browser.vim
let g:netrw_nogx = 1
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" ALE
nmap <F3> <Plug>(ale_fix)

" fix mixed indentation
nmap <F4> mzgg=G`z
