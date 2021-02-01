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
set clipboard=unnamed       " allows vim to interact with system clipboard

"-- editing text
set backspace=eol,start,indent    " set backspace functionality in insert mode
set showmatch                     " when inserting bracket, short jump to match
set matchtime=2                   " 1/10 of a second to show match for 'showmatch'
let g:default_text_width=80       " global variable to make editing this easier in the future
let &textwidth=default_text_width " line length above with which to wrap a line

"-- syntax, highlighting, and spelling
syntax on                           " enable syntax processing
setlocal nospell                    " disable spell checking by default
let &colorcolumn=default_text_width "
colorscheme vim-monokai-tasty

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
let g:git_text_width=72
autocmd FileType gitcommit let &textwidth=git_text_width
autocmd FileType gitcommit let &colorcolumn=git_text_width

" markdown
let g:markdown_tabwidth=2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd FileType markdown let &shiftwidth=markdown_tabwidth
autocmd FileType markdown let &tabstop=markdown_tabwidth
autocmd FileType markdown let &softtabstop=markdown_tabwidth
autocmd FileType markdown let &textwidth=999
autocmd FileType markdown set spell

" json
let g:json_tabwidth=2
autocmd FileType json let &shiftwidth=json_tabwidth
autocmd FileType json let &tabstop=json_tabwidth
autocmd FileType json let &softtabstop=json_tabwidth

" yaml
let g:yaml_tabwidth=2
autocmd FileType yaml let &shiftwidth=yaml_tabwidth
autocmd FileType yaml let &tabstop=yaml_tabwidth
autocmd FileType yaml let &softtabstop=yaml_tabwidth

" html
let g:html_tabwidth=2
autocmd FileType html let &shiftwidth=html_tabwidth
autocmd FileType html let &softtabstop=html_tabwidth
autocmd FileType html let &tabstop=html_tabwidth
autocmd FileType html set spell

" javascript
let g:javascript_tabwidth=2
autocmd FileType javascript let &shiftwidth=javascript_tabwidth
autocmd FileType javascript let &softtabstop=javascript_tabwidth
autocmd FileType javascript let &tabstop=javascript_tabwidth

" cpp
let g:cpp_tabwidth=4
autocmd FileType cpp let &shiftwidth=cpp_tabwidth
autocmd FileType cpp let &softtabstop=cpp_tabwidth
autocmd FileType cpp let &tabstop=cpp_tabwidth

" py
autocmd FileType py let &textwidth=999

" golang
autocmd FileType go set noexpandtab
