" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" GUI
"


if has('gui_running')
  set guioptions=mcgM

  set guifont=SauceCodePro\ Nerd\ Font\ Mono:h12,Source\ Code\ Pro:h12

else
  " Truecolor support
  set termguicolors

  " Truecolor under tmux
  set t_8b=[48;2;%lu;%lu;%lum
  set t_8f=[38;2;%lu;%lu;%lum
endif

" Sign Column {{{
" Signify {{{
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = '~'
let g:signify_difftool = 'vimdiff'
" }}}

" Showmarks {{{
let showmarks_enable = 1
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

let showmarks_ignore_type = "hqm"
let showmarks_textlower = " "
let showmarks_textupper = " "
let showmarks_hlline_lower = 0
let showmarks_hlline_upper = 0
" }}}
" }}}
