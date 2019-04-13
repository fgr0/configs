" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Plugin Definitions
"


" Define Plugin Groups
if !exists("g:plug_groups")
  let g:plug_groups = ['vcs', 'completion', 'programming', 'javascript', 'writing', 'latex', 'fancy']
endif


" Core {{{
" Interface
Plug 'itchyny/lightline.vim'
Plug 'exvim/ex-showmarks'

Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'milkypostman/vim-togglelist'

Plug 'Yggdroot/indentLine', { 'on': [ 'IndentLinesDisable', 'IndentLinesEnable', 'IndentLinesToggle' ]}

Plug 'kopischke/vim-fetch'

" Edit
Plug 'junegunn/vim-slash'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'andymass/vim-matchup'

Plug 'sgur/vim-editorconfig'

" Textobjects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-function'
Plug 'glts/vim-textobj-comment'
Plug 'reedes/vim-textobj-sentence'
Plug 'reedes/vim-textobj-quote'

" Colors & Fonts
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
" }}}


" VCS {{{
if count(g:plug_groups, 'vcs')
  Plug 'airblade/vim-gitgutter'
  Plug 'gilligan/textobj-gitgutter'

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'rhysd/committia.vim'
  Plug 'junegunn/gv.vim'
endif " }}}


" Completion {{{
if count(g:plug_groups, 'completion')
  if v:version >= 800 && has('python3')
    if !has('nvim')
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif

    Plug 'Shougo/deoplete.nvim'
  endif

  Plug 'Shougo/neco-vim'
  Plug 'Shougo/echodoc.vim'
  Plug 'Shougo/context_filetype.vim'

  if executable('look')
    Plug 'ujihisa/neco-look'
  endif

  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
endif " }}}


" Programming {{{
if count(g:plug_groups, 'programming')
  Plug 'majutsushi/tagbar'

  Plug 'xuhdev/SingleCompile', { 'on': ['SCCompile', 'SCCompileRun', 'SCCompileRunAsync', 'SCViewResult'] }
  if v:version >= 800
    Plug 'ludovicchabant/vim-gutentags'
  endif
  Plug 'w0rp/ale'
endif " }}}


" JavaScript {{{
if count(g:plug_groups, 'javascript')
  Plug 'pangloss/vim-javascript'
  Plug 'posva/vim-vue'
endif " }}}


" Writing {{{
if count(g:plug_groups, 'writing')
  Plug 'reedes/vim-pencil'
  Plug 'reedes/vim-litecorrect'
  Plug 'reedes/vim-wordy'
endif " }}}


" LaTeX {{{
if count(g:plug_groups, 'latex')
  Plug 'lervag/vimtex'
  Plug 'rbonvall/vim-textobj-latex'
endif
" }}}


" Fancy {{{
" - Not really useful, but just nice to have
if count(g:plug_groups, 'fancy')
  Plug 'junegunn/goyo.vim', { 'on': ['Goyo'] }
  Plug 'junegunn/limelight.vim', { 'on': ['Limelight'] }
  " Plug 'mhinz/vim-startify'

  Plug 'fszymanski/deoplete-emoji'

  if exists('g:nerdfont') && g:nerdfont
    Plug 'ryanoasis/vim-devicons'
  endif
endif " }}}
