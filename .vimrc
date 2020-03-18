" ========================= General Settings =========================

syntax enable		" enable syntax processing
set number          " show number lines
set relativenumber  " show number lines relative to cursor
set autowrite       " automatically :write before running commands
set nobackup
set nowritebackup
set noswapfile
set textwidth=79    " make it obvious where 79 characters is

" ========================= Indentation =========================

set expandtab		" tabs are spaces
set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for each step of (auto)indent

" ========================= Filetype-specific Indentation =========================

autocmd FileType markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2

" ========================= Keybindings =========================

inoremap jk <ESC>

