" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Side Panels
"


" NERDTree {{{
let NERDTreeBookmarksFile     = '~/.cache/vim/NERDTreeBookmarks'
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowLineNumbers   = 0
let NERDTreeMinimalUI         = 1
let NERDTreeMouseMode         = 2

let g:nerdtree_tabs_open_on_console_startup = 2
let g:nerdtree_tabs_smart_startup_focus = 2

augroup nerdtree_settings
  autocmd!
  autocmd FileType nerdtree setlocal nolist
augroup END
" }}}


" Undotree {{{
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_CustomUndotreeCmd = 'botright vertical 32 new'
let g:undotree_CustomDiffpanelCmd= 'belowright 12 new'
" }}}
