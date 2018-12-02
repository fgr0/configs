" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Diffrent `Modes`
"


" Goyo/Focus Mode {{{
let g:goyo_width = 100

augroup goyo_callbacks
  autocmd!
  autocmd! User GoyoEnter nested call mode#focus#start()
  autocmd! User GoyoLeave nested call mode#focus#end()
augroup END
" }}}

let g:editorconfig_root_chdir = 1

" Prose Mode {{{
" Lexical {{{
let g:lexical#spelllang  = [ 'en_us', 'de_de' ]
let g:lexical#thesaurus  = [ '~/.vim/thesaurus/mobythesaurus.txt', '~/.vim/thesaurus/openthesaurus.txt' ]
let g:lexical#dictionary = [ '/usr/share/dict/words', ]
let g:lexical#spellfile  = [ '~/.vim/spell/custom.utf-8.add' ]

let g:lexical#spell_key      = '<leader>s'
let g:lexical#thesaurus_key  = '<leader>t'
let g:lexical#dictionary_key = '<leader>d'
" }}}

" Pencil {{{
let g:pencil#textwidth = 80
let g:pencil#conceallevel = 0
" }}}

command! -nargs=0 Prose call mode#prose#init()
" }}}
