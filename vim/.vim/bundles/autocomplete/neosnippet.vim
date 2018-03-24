" Bundle file for furry-vim
"
" NAME: Neosnippet
" DESC: neo-snippet plugin contains neocomplcache snippets source
" URL:  https://github.com/Shougo/neosnippet.vim

call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

let g:neosnippet#data_directory=expand('~/.vim/cache/neosnippet')
let g:neosnippet#enable_snipmate_compatibility = 1
