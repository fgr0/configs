" Bundle file for furry-vim
"
" NAME: marked.vim
" DESC: Open the current Markdown buffer in Marked.app
" URL:  https://github.com/itspriddle/vim-marked

if !has('macunix')
    finish
endif

call dein#add('itspriddle/vim-marked', {'autoload':{'filetypes':['markdown','pandoc']}})
