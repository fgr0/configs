" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Custom Extentions to Lightline
"

" Helper {{{
let s:special_ft = [ 'help', 'nerdtree', 'tagbar', 'undotree', 'unite', 'vimfiler', 'vimshell', 'unite', 'startify' ]

function! s:isspecial() abort
  return count(s:special_ft, &ft)
endfunction
" }}}


" Components {{{
function! lightline#extentions#readonly() abort " {{{
  return s:isspecial() ? '' : ( &readonly || !&modifiable ? '' : '' )
endfunction " }}}


function! lightline#extentions#modified() abort " {{{
  return &modified ? '+' : ''
endfunction " }}}


function! lightline#extentions#mode() abort " {{{
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ &filetype ==# 'nerdtree' ? 'NERD' :
        \ &filetype ==# 'undotree' ? 'Undotree' :
        \ &filetype ==# 'startify' ? 'Startify' :
        \ lightline#mode()
endfunction " }}}


function! lightline#extentions#filetype() abort " {{{
  if s:isspecial() && &ft != 'help'
    return ''
  endif
  return (winwidth(0) > 70 && strlen(&filetype) ? &filetype . ' ' : '' ) . WebDevIconsGetFileTypeSymbol()
endfunction " }}}


function! lightline#extentions#fileinfo() abort " {{{
  if s:isspecial()
    return ''
  endif
  return (winwidth(0) > 110 ? ( &fenc!=#"" ? &fenc : &enc ) . ' ' : '') . WebDevIconsGetFileFormatSymbol()
endfunction " }}}


function! lightline#extentions#filename() abort " {{{
  if &filetype == "help"
    return expand('%:t:r')
  elseif &filetype == "startify"
    return getcwd()
  elseif s:isspecial()
    return ''
  endif

  let rfname = expand('%')
  let sfname = expand('%:t')
  return ( 90 + strlen(rfname) < winwidth(0) ? rfname : sfname ) . ' ' . lightline#extentions#modified()
endfunction " }}}


function! lightline#extentions#gitbranch() abort " {{{
  if s:isspecial()
    return ''
  endif
  return fugitive#head() !=# "" ? '' . ( winwidth(0) > 110 ? ' ' .fugitive#head(6) : '' ) : ''
endfunction " }}}


function! lightline#extentions#percent() abort " {{{
  return winwidth(0) > 70 ? (line('$') > winheight(0) ? '%P' : '') : ''
endfunction " }}}


function! lightline#extentions#whitespace() abort " {{{
  let line = search('\s$', 'nw')
  return (line != 0) ? ' ' . line  : ''
endfunction " }}}


function! lightline#extentions#wordcount() abort " {{{
  let wordcount = wordcount()
  let words     = get(wordcount, 'words')
  let swords    = get(wordcount, 'visual_words')

  if winwidth(0) < 90
    return " " . (swords > 0 ? '(' . swords . ')' : words )
  else
    return " " . words . (swords > 0 ? '(' . swords . ')' : '') . ' Word(s)'
  endif
endfunction " }}}
" }}}
