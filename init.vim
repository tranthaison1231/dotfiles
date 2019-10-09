call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'huytd/vim-quickrun'
Plug 'sheerun/vim-polyglot'
Plug 'rust-lang/rust.vim'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Shougo/denite.nvim'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish' 
Plug 'scrooloose/nerdcommenter'
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
call plug#end()

"------------------Config for Plugin Nerdtree--------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"---------------------------------------------------------


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


"---------------Config Color cheme vim-Quantumn ------------------------
let g:quantum_italics=1
let g:quantum_black=1
colorscheme quantum
set background=dark
set termguicolors
"----------------------------------------------------------

"------------------SETTING FOR NVIM------------------------
set noswapfile
set nojoinspaces
set nowrap
set number
set laststatus=2
set ttimeout
set ttimeoutlen=10
set ignorecase
set encoding=UTF-8
set hidden
set nobackup
set nowritebackup
set mouse=a " enable mouse for all mode
set wildoptions=pum
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
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set smartindent
"------------------------------------------------------------
"------------------------KEY MAP-----------------------------
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
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
