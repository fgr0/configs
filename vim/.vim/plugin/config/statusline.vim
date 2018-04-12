" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Statusline
"

set showcmd
set noshowmode
set cmdheight=2
set laststatus=2


" Lightline Config {{{
" For function definitions look under autoload/lightline/extentions.vim
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly' ],
      \              [ 'filename' ] ],
      \   'right': [ [ 'whitespace', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype', 'fileinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left':  [ [  ],
      \              [  ],
      \              [ 'filename' ] ],
      \   'right': [ [  ],
      \              [  ],
      \              [ 'filetype', 'percent', 'lineinfo' ] ],
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v/%L',
      \ },
      \ 'component_function': {
      \   'mode':       'lightline#extentions#mode',
      \   'filename':   'lightline#extentions#filename',
      \   'gitbranch':  'lightline#extentions#gitbranch',
      \   'filetype':   'lightline#extentions#filetype',
      \   'fileinfo':   'lightline#extentions#fileinfo',
      \   'wordcount':  'lightline#extentions#wordcount',
      \ },
      \ 'component_expand': {
      \   'readonly':   'lightline#extentions#readonly',
      \   'percent':    'lightline#extentions#percent',
      \   'whitespace': 'lightline#extentions#whitespace',
      \ },
      \ 'component_type': {
      \   'readonly':   'error',
      \   'whitespace': 'warning',
      \ },
      \ }
" }}}

" Update Lightline on Write {{{
augroup lightline#update_on_write
  autocmd!
  autocmd BufWritePost * call lightline#update()
augroup END " }}}
