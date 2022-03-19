" removes trailing whitespace on every line of the file
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

function! ChangeColorscheme()
    if &background ==? 'dark'
        set background=light
        colorscheme morning
    else
        set background=dark
        colorscheme vim-monokai-tasty
    endif
endfunction

map <leader>bg :call ChangeColorscheme()<CR>
