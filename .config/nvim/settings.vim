" My settings for vim

"-- important
set ttimeoutlen=0
set updatetime=300

"-- undo settings
set undolevels=2000 " allow for a large amount of undos
set undofile        " make undos persistent

"-- moving around, searching, and patterns
set ignorecase      " ignore case when searching
set smartcase       " case-sensitive if expression contains a capital letter
set incsearch       " show matches as search is being typed
set hlsearch        " highlight matches of last search pattern
set magic           " make bashslash in regex more predictable

"-- displaying text
set number          " show number lines
set relativenumber  " show number lines relative to cursor
set scrolloff=7     " number of padding lines when vertical scrolling
set cmdheight=2     " number of lines in the command bar
set cmdwinheight=12 " number of lines in the console window
set nowrap          " turn off line wrapping
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:.

"-- terminal
set t_Co=256

"-- selecting text
set clipboard=unnamed   " allows vim to interact with system clipboard

"-- editing text
set backspace=eol,start,indent    " set backspace functionality in insert mode
set showmatch                     " when inserting bracket, short jump to match
set matchtime=2                   " 1/10 of a second to show match for 'showmatch'
let g:default_textwidth=100       " global variable to make editing this easier in the future
let &textwidth=default_textwidth  " line length above with which to wrap a line

"-- syntax, highlighting, and spelling
syntax on                           " enable syntax processing
au BufNewFile,BufRead,BufReadPost *.template set syntax=off
setlocal nospell                    " disable spell checking by default
let &colorcolumn=default_textwidth  " set visual bar for character linting limit
colorscheme vim-monokai-tasty       " set default color scheme

"-- multiple windows
set hidden

"-- tabs and indenting
set expandtab                      " tabs are spaces
let g:default_tab_width=4          " global variable to make editing this easier in the future
let &tabstop=default_tab_width     " number of visual spaces per TAB
let &softtabstop=default_tab_width " number of spaces in tab when editing
let &shiftwidth=default_tab_width  " number of spaces to use for each step of (auto)indent
set shiftround                     " when shifting lines, round to nearest multiple of shiftwidth
set smartindent                    " use smart indenting (good for C-like languages)

"-- reading / writing files
set fileformats=unix,dos,mac    " file formats to consider when editing a file
set autoread                    " auto reread files changed externally
set autowrite                   " automatically :write before running commands
set nobackup                    " do not keep backup after overwriting a file
set nowritebackup               " do not write backup after overwriting a file
set noswapfile                  " do not keep a swap file

"-- multi-byte characters
set encoding=utf-8

"-- command line editing
set shortmess+=c
set signcolumn=yes

"-- language-specific

" git
let g:git_textwidth=72
au FileType gitcommit let &textwidth=git_textwidth
au FileType gitcommit let &colorcolumn=git_textwidth

" markdown
let g:md_tabwidth=2
let g:md_textwidth=999
au BufNewFile,BufReadPost *.md set filetype=markdown
au FileType markdown let &shiftwidth=md_tabwidth
au FileType markdown let &tabstop=md_tabwidth
au FileType markdown let &softtabstop=md_tabwidth
au FileType markdown let &textwidth=md_textwidth
au FileType markdown set spell

" json
let g:json_tabwidth=2
au FileType json let &shiftwidth=json_tabwidth
au FileType json let &tabstop=json_tabwidth
au FileType json let &softtabstop=json_tabwidth

" yaml
let g:yaml_tabwidth=2
au FileType yaml let &shiftwidth=yaml_tabwidth
au FileType yaml let &tabstop=yaml_tabwidth
au FileType yaml let &softtabstop=yaml_tabwidth

" html
let g:html_tabwidth=2
au FileType html let &shiftwidth=html_tabwidth
au FileType html let &softtabstop=html_tabwidth
au FileType html let &tabstop=html_tabwidth
au FileType html set spell

" javascript / ts / jsx
let g:js_tabwidth=2
au FileType javascript let &shiftwidth=js_tabwidth
au FileType javascript let &softtabstop=js_tabwidth
au FileType javascript let &tabstop=js_tabwidth
au BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
au BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" cpp
let g:cpp_tabwidth=4
au FileType cpp let &shiftwidth=cpp_tabwidth
au FileType cpp let &softtabstop=cpp_tabwidth
au FileType cpp let &tabstop=cpp_tabwidth

" java
au FileType java let &colorcolumn=0

" py
let g:py_textwidth=999
au FileType py let &textwidth=py_textwidth

" golang
au FileType go set noexpandtab

" txt
let g:txt_textwidth=999
au FileType txt setlocal &textwidth=txt_textwidth
