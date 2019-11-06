source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/keys.vim


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
set guifont=DroidSansMono_Nerd_Font:h11
"---------------------------------------------------------

"----------------Config for Plugin Vim easyescape------------
let g:easyescape_chars = { "j": 2 }
let g:easyescape_timeout = 100
cnoremap jj <ESC>
"

"----------------Config for Plugin UtilSnippet and vim Snippet-
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"
"-----------------------------------------------------------


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

"------------------SETTING FOR NVIM------------------------
set noswapfile
set foldlevelstart=1
set nojoinspaces
set nowrap
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
set cursorline
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set tabstop=2
set ruler
set showcmd
set softtabstop=2
set shiftwidth=2
set shiftround
set textwidth=80
set visualbell 
set expandtab
set autoindent
set smartindent
"------------------------------------------------------------


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
