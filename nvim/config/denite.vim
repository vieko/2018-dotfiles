" Section: Denite
" ---------------

augroup DeniteResize
  autocmd!
  autocmd VimResized,VimEnter * call denite#custom#option('default'
        \'winheight', winheight(0) / 2)
augroup end

call denite#custom#option('default', {'prompt': '⚡'})

" file search
nnoremap <C-p> :<C-u>Denite file_rec<CR>
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--glob', '!.git'])
" source search
nnoremap <C-g> :<C-u>Denite grep:. -mode=normal<CR>
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
      \ ['--vimgrep', '--no-heading', '-i'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" ignores
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


" next and previous results
call denite#custom#map('insert','<C-p>','<denite:move_to_previous_line>','noremap')
call denite#custom#map('insert','<C-k>','<denite:move_to_previous_line>','noremap')
call denite#custom#map('insert','<C-j>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<C-n>','<denite:move_to_next_line>','noremap')

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>','noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>','noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>','noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>','noremap')

" denite
" nnoremap <leader>s :<C-u>Denite buffer<CR>
" nnoremap <leader>d :<C-u>DeniteBufferDir buffer<CR>
" nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
" nnoremap <leader>/ :<C-u>Denite grep:. -mode=normal<CR>

