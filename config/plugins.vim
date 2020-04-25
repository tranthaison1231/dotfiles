call plug#begin('~/.config/nvim/plugged')
" Plug 'airblade/vim-rooter'
Plug 'dracula/vim'
" Plug 'dyng/ctrlsf.vim'
" Plug 'itchyny/lightline.vim'
Plug 'zhou13/vim-easyescape'
" Plug 'SirVer/ultisnips'
" Plug 'mattn/emmet-vim'
" Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
" Plug 'huytd/vim-quickrun'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
" Plug 'othree/html5.vim'
" Plug 'cakebaker/scss-syntax.vim'
" When use coc.nvim don't use deoplete and Youcompleme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion
Plug 'neoclide/coc-denite'
"-----------------Setup for nerd tree------------------------
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree:
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'   " Display icon in Nerdtree tree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'vwxyutarooo/nerdtree-devicons-syntax'
"-----------------For Javscript------------------------
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"----------------For Search---------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " For search, if use it, don't use ctrlpvim
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find file, if use it, don't use fzf
" Plug 'wincent/scalpel'
"-----------------------------------------------------
Plug 'Shougo/denite.nvim'
" Plug 'tomasr/molokai'
Plug 'easymotion/vim-easymotion'
" Plug 'vim-scripts/matchit.zip'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'jiangmiao/auto-pairs'
" Plug 'haya14busa/incsearch.vim'
" Plug 'liuchengxu/vista.vim'
" Plug 'psliwka/vim-smoothie'
"----------------For tmux-------------------
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'benmills/vimux' "Vi + Tmux
"----------------Vim for airline-------------
"Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
"----------------Plugin Flutter-------------
Plug 'thosakwe/vim-flutter'
Plug 'dart-lang/dart-vim-plugin'
"

call plug#end()


if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
