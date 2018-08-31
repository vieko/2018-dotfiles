" Section: Deoplete
" -----------------

" options
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1

" sources
let g:deoplete#sources = {}
let g:deoplete#sources.vim = ['vim']
let g:deoplete#sources.javascript = ['LanguageClient', 'around', 'file']

" disabled
call deoplete#custom#source('_', 'disable_syntaxes', ['Comment', 'String'])

" ignored
let g:deoplete#ignore_sources={}
let g:deoplete#ignore_sources.vim=['around', 'buffer', 'file', 'member']
let g:deoplete#ignore_sources.sh=['around', 'buffer', 'file', 'member']
let g:deoplete#ignore_sources._=['around', 'buffer', 'file', 'member']

" configuration
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"
set isfname-==
