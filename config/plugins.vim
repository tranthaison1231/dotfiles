call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim'
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
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tomasr/molokai'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree:
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish' 
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
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
