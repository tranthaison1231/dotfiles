call plug#begin('~/.config/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'zhou13/vim-easyescape'
Plug 'SirVer/ultisnips'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'huytd/vim-quickrun'
Plug 'honza/vim-snippets'
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
Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree:
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish' 
Plug 'scrooloose/nerdcommenter'
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'mxw/vim-jsx'
call plug#end()

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
