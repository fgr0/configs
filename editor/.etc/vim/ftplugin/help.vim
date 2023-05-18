" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Easier navigation for Help Files
" Credits: https://github.com/rafi/vim-config/

setlocal nospell
setlocal nohidden


" Jump to links with enter
nmap <buffer> <CR> <C-]>

" Skip to subject link
nmap <buffer><nowait> t /\|\S\+\|<CR>l
nmap <buffer> T h?\|\S\+\|<CR>l

" Skip to tag (subject anchor)
nmap <buffer> s /\*\S\+\*<CR>l
nmap <buffer> S h?\*\S\+\*<CR>l

" Quit buffer using just q
nmap <buffer> q :q<CR>
