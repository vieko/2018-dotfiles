" Section: Powerline
" ------------------

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
let g:airline#extensions#tabline#tabs_label='tabs'
let g:airline#extensions#tabline#buffers_label='buffers'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.notexists=' ⁇'

" tmuxline
let g:tmuxline_preset='powerline'
let g:airline#extensions#tmuxline#enabled=0
