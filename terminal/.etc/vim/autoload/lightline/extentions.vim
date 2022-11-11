" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Custom Extentions to Lightline
"

" Helper {{{
let s:special_ft = [ 'help', 'nerdtree', 'tagbar', 'undotree', 'unite', 'vimfiler', 'vimshell', 'unite', 'startify' ]

function! s:isspecial() abort
  return count(s:special_ft, &ft)
endfunction

" Remove all trailing padding from DevIcons' Symbols
function! s:filetypeicon() abort
    return strpart(WebDevIconsGetFileTypeSymbol(), 0, 3)
endfunction

function! s:fileformaticon() abort
    return strpart(WebDevIconsGetFileFormatSymbol(), 0, 3)
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


function! lightline#extentions#mode2() abort
  let spellicon = exists('g:nerdfont') && g:nerdfont ? '' : '✓'
  let pasteicon = exists('g:nerdfont') && g:nerdfont ? '' : '⇣'

  if &paste && &spell
    return pasteicon . ' ' . spellicon
  elseif &paste
    return pasteicon
  elseif &spell
    return spellicon
  endif

  return ''
endfunction


function! lightline#extentions#filetype() abort " {{{
  if s:isspecial() && &ft != 'help'
    return ''
  endif

  if exists('g:nerdfont') && g:nerdfont
    let label = (winwidth(0) > 60 ? &filetype : '' )
    return strlen(label) > 0 ? label . ' ' . s:filetypeicon() : s:filetypeicon()
  else
    return &filetype
  endif
endfunction " }}}


function! lightline#extentions#fileinfo() abort " {{{
  if s:isspecial()
    return ''
  endif

  let label = (winwidth(0) > 110 ? ( &fenc!=#"" ? &fenc : &enc ) : '')

  if exists('g:nerdfont') && g:nerdfont
    return strlen(label) > 0 ? label . ' ' . s:fileformaticon() : s:fileformaticon()
  else
    return label
  endif
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
  let symbol = exists('g:nerdfont') && g:nerdfont ? '' : '↬'
  return FugitiveHead() !=# "" ? symbol . ( winwidth(0) > 110 ? ' ' . FugitiveHead(6) : '' ) : ''
endfunction " }}}


function! lightline#extentions#percent() abort " {{{
  return winwidth(0) > 90 ? (line('$') > winheight(0) ? '%P' : '') : ''
endfunction " }}}


function! lightline#extentions#whitespace() abort " {{{
  if s:isspecial()
    return ''
  endif

  let line = search('\s$', 'nw')
  let symbol = exists('g:nerdfont') && g:nerdfont ? ' ' : '• '

  return (line != 0) ? symbol . line  : ''
endfunction " }}}


function! lightline#extentions#wordcount() abort " {{{
  " NOTE: This is quite slow on large files
  let wordcount = wordcount()
  let words     = get(wordcount, 'words')
  let swords    = get(wordcount, 'visual_words')
  let symbol    = exists('g:nerdfont') && g:nerdfont ? " " : ' ¶'

  if winwidth(0) < 90
    return (swords > 0 ? '(' . swords . ')' : words ) . symbol
  else
    return words . (swords > 0 ? '(' . swords . ')' : '') . ' Word(s)' . symbol
  endif
endfunction " }}}
" }}}
