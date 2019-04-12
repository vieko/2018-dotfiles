" Section: Deoplete
" -----------------

" options
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1
let g:deoplete#auto_complete_start_length=1
let g:deoplete#auto_complete_delay=50

" sources
let g:deoplete#sources = {}
let g:deoplete#sources.vim = ['vim']
let g:deoplete#sources.javascript = ['LanguageClient']

" disabled
call deoplete#custom#source('_', 'disable_syntaxes', ['Comment', 'String'])

" ignored
let g:deoplete#ignore_sources={}
let g:deoplete#ignore_sources.vim=['around', 'buffer', 'file', 'member']
let g:deoplete#ignore_sources.sh=['around', 'buffer', 'file', 'member']
let g:deoplete#ignore_sources._=['around', 'buffer', 'file', 'member']

" configuration
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
set isfname-==
