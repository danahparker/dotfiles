" -------------------
" Settings for the lightline plugin.
" See:
" - my init.vim
" - github.com/itchyny/lightline.vim
" - github.com/josa42/vim-lightline-coc

let g:lightline = {
      \   'colorscheme': 'seoul256',
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'coc_errors', 'coc_warnings', 'coc_ok' ],
      \       [ 'coc_status' ],
      \       [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ]
      \     ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'FugitiveHead'
      \   }
      \ }
