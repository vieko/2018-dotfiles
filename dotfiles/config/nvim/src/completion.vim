" Section: NCM2
" -------------

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" suppress 'match x  of y', 'only match' and 'patter not found'
set shortmess+=c

" slightly fuzzier matcher
let g:ncm2#matcher = 'substrfuzzy'

" <C-c> does not trigger InsertLeave autocmd - map to <ESC>
inoremap <C-c> <ESC>

" close menu and start new line
inoremap <expr> <CR> (pumvisible() ? "<C-y>\<CR>" : "\<CR>")

" use <TAB> to select the popup menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
