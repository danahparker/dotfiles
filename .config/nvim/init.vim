call plug#begin('~/nvim/plugged')
" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" web development
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" visuals
Plug 'patstockwell/vim-monokai-tasty'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'sheerun/vim-polyglot'
Plug 'uiiaoo/java-syntax.vim'
Plug 'lilydjwg/colorizer'

" make typing easier
Plug 'alvan/vim-closetag'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'

" etc
Plug 'rizzatti/dash.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'preservim/tagbar'
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
source ~/.config/nvim/ale.vim

" plugin setting

let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:closetag_filetypes= 'jsx,js'
let g:closetag_shortcut='>'
