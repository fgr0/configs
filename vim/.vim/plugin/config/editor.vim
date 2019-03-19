" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Editor Settiings
"

" Language and Formats {{{
set encoding=utf-8
set fileformats+=mac
set nrformats-=octal,hex
set nrformats+=alpha

silent! language en_US

set nospell
set spellfile=$HOME/.vim/spell/custom.utf-8.add
set spelllang=en_us,de_de
" }}}


" Spacing {{{
set textwidth=80

set linespace=2
set backspace=indent,eol,start
set autoindent copyindent
set expandtab smarttab
set tabstop=4 softtabstop=2 shiftwidth=2
set shiftround
set linebreak
set breakindent breakindentopt=sbr
set showbreak="↪ \ "
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
" }}}


" Search {{{
set hlsearch incsearch
set ignorecase smartcase
set wrapscan

set showmatch
set matchtime=1
set matchpairs+=<:>

set gdefault
" }}}


" Folds {{{
set foldenable
set foldcolumn=2 foldlevelstart=99
set foldmethod=syntax
" }}}


" Misc {{{
set diffopt+=vertical

set commentstring=#\ %s

set printoptions+=syntax:y
set printoptions+=number:y
" }}}


" IndentLines {{{
let g:indentLine_char = '⎸'
let g:indentLine_enabled = 0
" }}}


" Editorconfig {{{
let g:editorconfig_root_chdir = 1
" }}}


" Auto Pairs {{{
let g:AutoPairsMoveCharacter = ''
" }}}
