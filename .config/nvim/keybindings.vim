let mapleader=" "

" some coc-nvim stuff
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" vim fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" dash
nmap <leader>d :Dash<CR>

" removes highlights
nmap <leader>h :noh<CR>

" saves files
nmap <leader>w :w!<CR>

" removes trailing whitespace
nmap <leader>sp :call TrimWhitespace()<CR>

" search files
nmap <C-p> :Files<CR>

" search ctags (i.e. search function name)
nnoremap <leader>. :Tags<cr>

map <leader>bg :call ChangeColorscheme()<CR>

" search for word under cursor in help docs
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>

" search for word under cursor with CocSearch
nnoremap <leader>csw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" search for word under cursor with Rg
nnoremap <leader>rgw :Rg <C-R>=expand("<cword>")<CR><CR>

" https://github.com/preservim/tagbar
nmap <leader>t :TagbarToggle
