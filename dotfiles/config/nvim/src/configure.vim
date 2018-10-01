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

" ALE
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=1
let g:ale_completion_enabled=1
let g:airline#extensions#ale#enabled=1
let g:ale_sign_error = '⨯⨯'
let g:ale_sign_warning ='▸▸'
let airline#extensions#ale#error_symbol = '⨯⨯:'
let airline#extensions#ale#warning_symbol = '▸▸:'
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_linters = {
      \  'javascript': ['standard'],
      \  'vue': ['eslint'],
      \  'typescript': []
      \}
let g:ale_fixers = {
      \  'javascript': ['prettier_standard'],
      \  'vue': ['prettier'],
      \  'html': ['tidy']
      \}
let g:ale_pattern_options = {
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \}

" vim-sneak
let g:sneak#label=1
let g:sneak#s_next=1

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
"
" vim-matchup
let g:matchup_transmute_enabled=0
let g:matchup_matchparen_deferred=1

" neopairs
let g:neopairs#enable=1

" echodoc
let g:echodoc_enable_at_startup=1

" polyglot
let g:jsx_ext_required = 0

" ncm2-match-highlight
" let g:ncm2#match_highlight = 'sans-serif-bold'

" vim-test
let test#neovim#term_position = 'vertical botright'
let test#strategy = 'neovim'
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
if has('nvim')
  tmap <C-o> <C-\><C-n>
end
