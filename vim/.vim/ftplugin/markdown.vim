" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'vim', 'javascript']

call mode#prose#init()


if has('gui_running')
  hi! markdownItalic gui=italic
else
  hi! markdownItalic cterm=NONE
endif
