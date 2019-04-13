" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" General
"

set hidden
set timeoutlen=500      " mapping timeout
set ttimeoutlen=150     " keycode timeout
set updatetime=400

set modeline
set modelines=1

set wildignorecase

" Do not show these files in the Tabcompletion (in CMD)
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc,*.fls,*.log
set wildignore+=*.jpg,*.jpeg,*.bmp,*.gif,*.png
set wildignore+=*.o,*.obj,*.exe,*.dll
set wildignore+=*.pyc,*.class
set wildignore+=*.~,*.aux,*.fdb_latexmk,*.pdf
set wildignore+=*.DS_Store

" Movement
set scrolloff=3
set scrolljump=5
set sidescroll=1
set startofline
set selection=old
set virtualedit+=onemore,block
set formatoptions+=1j

if has('mouse')
  set mouse=a
  set mousemodel=popup_setpos
  set mousehide
endif

if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamedplus
  else
    set clipboard=unnamed
  endif
endif
