



" ========================== Plugins ==========================




call plug#begin('~/nvim/plugged')

" makes programming easier
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rizzatti/dash.vim'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'

" git
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdTree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" language
Plug 'uiiaoo/java-syntax.vim'
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'ekalinin/dockerfile.vim'
Plug 'tpope/vim-markdown'

" colorscheme / style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'sheerun/vim-polyglot'
Plug 'frazrepo/vim-rainbow'
Plug 'junegunn/goyo.vim'
Plug 'altercation/vim-colors-solarized'
"Plug 'ryanoasis/vim-devicons'

call plug#end()



" ========================== Plugin Configurations ==========================



" Autopairs ---------------------------------------
let g:AutoPairs = { '(':')', '[':']', '{':'}', '```':'```', '"""':'"""', "'''":"'''" }

" NERDTree ---------------------------------------

let NERDTreeShowHidden = 1
let NERDTreeMinimalUI  = 1
let NERDTreeDirArrows  = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" Rainbow Parentheses ---------------------------------------

let g:rainbow_activate = 1
let g:rainbow_guifgs   = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
autocmd BufRead,BufNewFile * RainbowLoad

" Vim Airline ---------------------------------------

let g:airline_theme = 'bubblegum'

" Vim Closetag ---------------------------------------

" file extensions where this plugin is enabled

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.md'

" shortcut for closing HTML-like tags

let g:closetag_shortcut = '>'

" ============================= General Settings =============================



"-- important
set ttimeoutlen=0
set updatetime=300

"-- moving around, searching, and patterns
set ignorecase      " ignore case when searching
set smartcase       " override ignorecase when pattern has uppercase letters
set incsearch       " show matches as search is being typed
set hlsearch        " highlight matches of last search pattern
set magic           " make bashslash in regex more predictable

"-- displaying text
set number          " show number lines
set relativenumber  " show number lines relative to cursor
set scrolloff=7     " number of padding lines when vertical scrolling
set cmdheight=2     " number of lines in the command bar
set wrap            " wrap long lines
set linebreak       " wrap long lines at 'breakat' characters
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

if &background == 'light' " set theme based on background setting
    colorscheme morning
else
    colorscheme vim-monokai-tasty
endif

augroup vimrc_todo " highlight todo-like keywords
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo

"-- multiple windows
set hidden

"-- tabs and indenting
set expandtab                      " tabs are spaces
let g:default_tab_width=4          " global variable to make editing this easier in the future
let &tabstop=default_tab_width     " number of visual spaces per TAB
let &softtabstop=default_tab_width " number of spaces in tab when editing
let &shiftwidth=default_tab_width  " number of spaces to use for each step of (auto)indent
set smarttab                       " on indent, tab inserts 'shiftwidth' number of spaces
set autoindent                     " automatically set indent of a new line
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
autocmd FileType markdown let textwidth=999
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

" golang
autocmd FileType go set noexpandtab






" ================================= Functions ================================






" removes trailing whitespace on every line of the file
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" changes colorscheme after <leader>bg between light and dark
function! ChangeColorscheme()
    let &background = ( &background == "dark" ? "light" : "dark" )
    if &background == 'light'
        colorscheme morning
    else
        colorscheme vim-monokai-tasty
    endif
endfunction



" ================================ Keybindings ================================



let mapleader=" "

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

nmap <leader>n :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>

vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"nmap <leader>m <Plug>MarkdownPreview<CR>
"nmap <C-m> <Plug>MarkdownPreview<CR>

" vim fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

nmap <leader>d :Dash<CR>

nmap <leader>g :Goyo<CR>

nmap <leader>h :noh<CR>

nmap <leader>ss :setlocal spell!<CR>

nmap <leader>t :tabnew<CR>

nmap <leader>w :w!<CR>
nmap <leader>q :q<CR>

nmap <leader>sp :call TrimWhitespace()<CR>

nmap <C-p> :Files<CR>
nnoremap <leader>. :Tags<cr>

map <leader>bg :call ChangeColorscheme()<CR>








" ========================== coc.nvim Configuration & Keybindings ==========================







let g:coc_global_extensions =[
    \ 'coc-clangd',
    \ 'coc-go',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-tsserver',
    \ 'coc-yaml',
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

