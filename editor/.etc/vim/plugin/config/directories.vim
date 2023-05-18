" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Directories & History
"

set path+=**

set tags+=./tags,./.tags,$HOME/.tags/*
set tags+=tags,.tags

set history=1000
set nobackup
set nowritebackup

if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000

  set undodir=$XDG_CACHE_HOME/vim/undo
  set backupdir=$XDG_CACHE_HOME/vim/backup
  set directory=$XDG_CACHE_HOME/vim/swap,.
  set viminfofile=$XDG_CACHE_HOME/vim/viminfo

  if !isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif

  if !isdirectory(&backupdir)
    call mkdir(&backupdir, 'p')
  endif

  if !isdirectory(split(&directory, ',')[0])
    call mkdir(split(&directory, ',')[0], 'p')
  endif
endif

if has('mksession')
  set viewdir=$XDG_CACHE_HOME/vim/view
  set viewoptions=folds,options,cursor,unix,slash
endif
