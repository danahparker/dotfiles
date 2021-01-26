call plug#begin('~/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'rizzatti/dash.vim'
Plug 'alvan/vim-closetag'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'lilydjwg/colorizer'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'codeindulgence/vim-tig'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
" Plug 'chiel92/vim-autoformat'
" Plug 'wellle/targets.vim'
" Plug 'stefandtw/quickfix-reflector.vim'
call plug#end()

source ~/.config/nvim/settings.vim
source ~/.config/nvim/lightline.vim
source ~/.config/nvim/fzf.vim
source ~/.config/nvim/functions.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/coc.vim
