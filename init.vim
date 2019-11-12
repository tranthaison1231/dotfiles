source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/keys.vim

: "------------------------Config for mapkey -----------------
let mapleader=";"
nmap <c-p> <Plug>MarkdownPreview
map caa <esc>ggVG<CR>
map css <esc>:w<CR>
inoremap ;; <Esc>
"-----------------Config for Nerdtree---------------------
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nmap <leader>nf :NERDTreeFind<CR>
" toggle tagbar
nnoremap <silent> <leader>tb :TagbarToggle<CR>
"------------------Config for ctrlsf.vim-------------------
nmap     <C-F>f <Plug>CtrlSFPrompt                  
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
"-----------------Config for coc-prettier-------------------
command!  -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)----------------
"-------------------Config for show coc---------------------
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"------------------------------------------------------------
"---------------------Some custom style----------------------
highlight Normal guibg=NONE
highlight EasyMotionTargetDefault guifg=#ffb400
highlight NonText guifg=#354751
highlight VertSplit guifg=#212C32
highlight link deniteSource_SymbolsName Symbol
highlight link deniteSource_SymbolsHeader String
highlight link deniteSource_grepLineNR deniteSource_grepFile
highlight WildMenu guibg=NONE guifg=#87bb7c
highlight CursorLineNr guibg=NONE
"------------------------------------------------------------
"----------------------------------------------------------
"------------------Config for Plugin deoplete--------------
let g:deoplete#enable_at_startup = 1
"----------------------------------------------------------


"------------------Config for Plugin Vim devicons----------
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
"----------------------------------------------------------

"------------------Config for Plugin Nerdtree--------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeIndicatorMapCustom = { 
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
    \ }
"---------------------------------------------------------
"----------------Config for coc---------------------------
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
"-----------------------------------------------------------
"----------------Config for Plugin UtilSnippet and vim Snippet-
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"-----------------------------------------------------------

"---------------Config for ctrlpvim/ctrlp.vim ---------------
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] "Hide files in .gitignore
let g:ctrlp_show_hidden = 1                                                         "Show dotfiles
"-------------------Config for nerdcommenter----------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
"-----------------------------------------------------------

"-----------------Config for Plugin Lightline--------------
let g:lightline = {
      \ 'colorscheme': 'quantum',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
"----------------------------------------------------------


":/---------------Config Color cheme vim-Quantumn ------------------------
let g:quantum_italics=1
let g:quantum_black=1
colorscheme quantum
set background=dark
set termguicolors         "Enable true color"
"----------------------------------------------------------

"----------------------------------------------------------

"------------------SETTING FOR NVIM------------------------
set noswapfile
set foldlevelstart=1
set nojoinspaces
set nowrap
set nowritebackup
set nobackup
set number
set relativenumber
set laststatus=2
set ttimeout
set ttimeoutlen=10
set ignorecase
set incsearch
set encoding=UTF-8
set hidden
set history=200
set magic
set mouse=a
set nobackup
set nowritebackup
set wildoptions=pum
set winheight=10
set winwidth=80
set winminheight=1
set winminwidth=5
set pumblend=20
set noswapfile
set nojoinspaces
set ttyfast
" Better display for messages
set cmdheight=2
set cursorline
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set tabstop=2
set ruler
set showcmd
set softtabstop=2
set shiftwidth=2
set shiftround
" " don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
set textwidth=80
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
set visualbell 
set expandtab
set autoindent
set smartindent
"------------------------------------------------------------

"" Turn-on dracula color scheme
syntax on
color dracula

"----------------
"------------------------------------------------------------
"---------------------Some custom style----------------------
highlight Normal guibg=NONE
highlight EasyMotionTargetDefault guifg=#ffb400
highlight NonText guifg=#354751
highlight VertSplit guifg=#212C32
highlight link deniteSource_SymbolsName Symbol
highlight link deniteSource_SymbolsHeader String
highlight link deniteSource_grepLineNR deniteSource_grepFile
highlight WildMenu guibg=NONE guifg=#87bb7c
highlight CursorLineNr guibg=NONE
"------------------------------------------------------------
