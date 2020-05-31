" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Diffrent `Modes`
"


" Goyo/Focus Mode {{{
let g:goyo_width = 100

augroup goyo_callbacks
  autocmd!
  autocmd! User GoyoEnter nested call mode#focus#start()
  autocmd! User GoyoLeave nested call mode#focus#end()
augroup END
" }}}

let g:editorconfig_root_chdir = 1

" Prose Mode {{{
" Pencil {{{
let g:pencil#textwidth = 80
let g:pencil#conceallevel = 0
" }}}

command! -nargs=0 Prose call mode#prose#init()
" }}}
