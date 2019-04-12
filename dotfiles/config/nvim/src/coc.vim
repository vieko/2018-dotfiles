set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

highlight link CocErrorSign GruvboxRed
highlight link CocWarningSign GruvboxYellow
highlight link CocInfoSign GruvboxBlue
highlight link CocHintSign GruvboxBlue

" use tab to trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use `[w` and `]w` to navigate diagnostics
nmap <silent> [w <Plug>(coc-diagnostic-prev)
nmap <silent> ]w <Plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentaion in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" show signature help while editing
autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')

" highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" remap rename current word
nmap <leader>rn <Plug>(coc-rename)

" remap format selected region
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup COC
  autocmd!
  " setup formatexpr speficied filetypes
  autocmd FileType javascript,json setl formatexpr=CocAction('formatSelected')
  " update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" remap do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)
" fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:Fold` for fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

let airline#extensions#coc#error_symbol = 'E:'
let airline#extensions#coc#warning_symbol = 'W:'

" let g:airline#extensions#disable_rtp_load = 1
" let g:airline_extensions = ['branch', 'coc', 'denite', 'fugitiveline', 'hunks', 'keymap', 'netrw', 'po', 'quickfix', 'tabline', 'term', 'whitespace', 'wordcount']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" show diagnostics
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" show available commands
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" search symbols in current buffer
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" show workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" do default action for next item
nnoremap <silent> <space>j :<C-u>CocNext<cr>
" do default action for previous item
nnoremap <silent> <space>k :<C-u>CocPrev<cr>
" resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<cr>
