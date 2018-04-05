" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Directories & History
"

set tags+=./tags,./.tags,$HOME/.tags/*
set tags+=tags,.tags

set history=1000
set nobackup
set nowritebackup

if has('persistent_undo')
  set undofile
  set undolevels=1000
  set undoreload=10000

  set undodir=~/.cache/vim/undo
  set backupdir=~/.cache/vim/backup
  set directory=~/.cache/vim/swap,.
endif

if has('mksession')
  set viewdir=$HOME/.vim/cache/view
  set viewoptions=folds,options,cursor,unix,slash
endif
