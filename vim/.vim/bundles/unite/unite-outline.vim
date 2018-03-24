" Bundle file for furry-vim
"
" NAME: Unite-Outline
" DESC: outline source for unite.vim
" URL:  http://d.hatena.ne.jp/h1mesuke/20101107/p1k

call dein#add('Shougo/unite-outline')

nnoremap <silent> [unite]o :<C-u>Unite -vertical -buffer-name=outline outline<cr>
