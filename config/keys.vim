"------------------------KEY MAP-----------------------------
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
"------------------------------------------------------------
"------------------------LEADER MAPPING----------------------
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>o :only<CR>
nnoremap <Leader>p :echo expand('%')<CR>
nnoremap <Leader>pp :let @0=expand('%') <Bar> :Clip<CR> :echo expand('%')<CR>
nnoremap <Leader>q :quit<CR>
nnoremap <silent> <Leader>r :call mappings#cycle_numbering()<CR>
nnoremap <Leader>w :write<CR>
nnoremap <Leader>x :xit<CR>
nnoremap <silent> <Leader>zz :call mappings#zap()<CR>
nnoremap <silent> <LocalLeader>c :syntax sync fromstart<CR>
nnoremap <LocalLeader>e :edit <C-R>=expand('%:p:h') . '/'<CR>
"------------------------------------------------------------

"------------------------COMMAND MAPPING---------------------
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'