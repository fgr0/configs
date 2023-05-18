" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
let s:plugs_on_insert = []


function! plug#extentions#setup() abort " {{{
  " Register custom commands
  command! -nargs=1 -bar PlugOnInsert call plug#extentions#on_insert(<args>)

  " Lazy-Load Plugins upon entering Insert Mode
  augroup load_on_insert
    autocmd!
    autocmd InsertEnter * call plug#load(s:plugs_on_insert)
          \ | echo s:plugs_on_insert
          \ | autocmd! load_on_insert
  augroup END
endfunction " }}}


" Disable buildin Plugins {{{
function! plug#extentions#disable_buildin() abort
  let g:loaded_getscript = 1
  let g:loaded_getscriptPlugin = 1
  let g:loaded_gzip = 1
  let g:loaded_logiPat = 1
  let g:loaded_rrhelper = 1
  let g:loaded_ruby_provider = 1
  let g:loaded_shada_plugin = 1
  let g:loaded_tar = 1
  let g:loaded_tarPlugin = 1
  let g:loaded_tutor_mode_plugin = 1
  let g:loaded_2html_plugin = 1
  let g:loaded_vimball = 1
  let g:loaded_vimballPlugin = 1
  let g:loaded_zip = 1
  let g:loaded_zipPlugin = 1
  " let g:loaded_matchit = 1
  " let g:loaded_matchparen = 1
  " let g:loaded_netrwPlugin = 1
endfunction
" }}}

" Add a plugin to plug but load it on insert
function! plug#extentions#on_insert(repo) abort " {{{
  call plug#(a:repo, { 'on': [] })

  call add(s:plugs_on_insert, fnamemodify(a:repo, ':t:s?\.git$??'))
endfunction " }}}
