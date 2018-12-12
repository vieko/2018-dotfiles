" Section: Plugins Config
" -----------------------

" Emmet
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_settings={
      \  'twig': {
      \    'extends': 'html',
      \  },
      \  'javascript.jsx': {
      \    'extends': 'jsx',
      \    'quote_char': "'",
      \  },
      \  'html': {
      \    'quote_char': "'",
      \  },
      \}

" vim-sneak
let g:sneak#label=1
let g:sneak#s_next=1

" vim-matchup
let g:matchup_transmute_enabled=0
let g:matchup_matchparen_deferred=1

" rainbow-parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]

" neopairs
" let g:neopairs#enable=1

" polyglot
let g:jsx_ext_required = 0

" ncm2-match-highlight
" let g:ncm2#match_highlight = 'sans-serif-bold'
