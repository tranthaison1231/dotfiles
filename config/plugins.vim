call plug#begin('~/.config/nvim/plugged')
Plug 'airblade/vim-rooter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find file
Plug 'dracula/vim'
Plug 'dyng/ctrlsf.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'itchyny/lightline.vim'
Plug 'zhou13/vim-easyescape'
Plug 'SirVer/ultisnips'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'mxw/vim-jsx'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'huytd/vim-quickrun'
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
" When use coc.nvim don't use deoplete and Youcompleme
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'tomasr/molokai'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/matchit.zip'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'tpope/vim-surround'
Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree:
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish' 
Plug 'liuchengxu/vista.vim'
Plug 'dense-analysis/ale'
Plug 'pangloss/vim-javascript'
Plug 'psliwka/vim-smoothie'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"----------------Vim for airline-------------
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
"----------------Plugin Flutter
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
