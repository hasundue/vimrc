"
" lightline.vim {
"
set laststatus=2
set showtabline=2

let g:lightline = #{
\   colorscheme: 'gruvbox_material',
\
\   separator: { 'left': "\ue0b0", 'right': "\ue0b2" },
\   subseparator: { 'left': "\ue0b1", 'right': "\ue0b3" },
\
\   active: {
\     'left': [ 
\       [ 'mode', 'paste' ],
\       [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\     ],
\     'right': [
\       [ 'lineinfo' ],
\       [ 'filetype', 'percent' ]
\     ],
\   },
\   component_function: {
\     'gitbranch': 'FugitiveHead'
\   },
\
\   tabline: {
\     'left': [ ['buffers'] ],
\     'right': [],
\   },
\   component_expand: {
\     'buffers': 'lightline#bufferline#buffers'
\   },
\   component_type: {
\     'buffers': 'tabsel'
\   },
\ }

" }

"
" lightline-bufferline {
"
let g:lightline#bufferline#min_buffer_count = 2
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#margin_left = 1
let g:lightline#bufferline#margin_right = 1

nnoremap <Leader>1 <Plug>lightline#bufferline#go(1)
nnoremap <Leader>2 <Plug>lightline#bufferline#go(2)
nnoremap <Leader>3 <Plug>lightline#bufferline#go(3)
nnoremap <Leader>4 <Plug>lightline#bufferline#go(4)
nnoremap <Leader>5 <Plug>lightline#bufferline#go(5)
nnoremap <Leader>6 <Plug>lightline#bufferline#go(6)
nnoremap <Leader>7 <Plug>lightline#bufferline#go(7)
nnoremap <Leader>8 <Plug>lightline#bufferline#go(8)
nnoremap <Leader>9 <Plug>lightline#bufferline#go(9)
nnoremap <Leader>0 <Plug>lightline#bufferline#go(10)

function! s:close_buf() abort
  let l:bufnr = bufnr()
  let l:ordnr = lightline#bufferline#get_ordinal_number_for_buffer(l:bufnr)
  call lightline#bufferline#delete(l:ordnr)
endfunction

nnoremap <Leader>- <cmd>call <SID>close_buf()<CR>

" }

"
" vim-tpipeline {
"
let g:tpipeline_restore = 1

" }
