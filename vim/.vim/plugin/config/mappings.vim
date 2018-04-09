" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Key Mappings
"

let mapleader=","

" Core {{{
" Escape!
inoremap jk <Esc>
cnoremap jk <C-C>

" Save
inoremap <C-S>     <C-O>:update<cr>
nnoremap <C-S>     :update<cr>

" Fix Y
nnoremap Y y$

" Reselect visual selection after shifting
vnoremap < <gv
vnoremap > >gv

" paste last yank
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

" Spell checking
nmap <leader>sd :set spelllang=de_20<cr>
nmap <leader>se :set spelllang=en_us<cr>
nmap <leader>z 1z=
" }}}

" Movement {{{
noremap j gj
noremap k gk
noremap 0 g0
noremap $ g$

noremap <C-F> <C-D>
noremap <C-B> <C-U>

" Windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-L> <C-W>l
noremap <C-H> <C-W>h

nnoremap <TAB>   <C-W>w
nnoremap <S-TAB> <C-W>W
" }}}

" Function Keys {{{
" F1-F4: Options
map <F2> :Goyo<CR>
set pastetoggle=<F4>

" F5-F8: Windows
map <F5> :NERDTreeTabsToggle<CR>
map <F7> :UndotreeToggle<CR>
map <F8> :TagbarToggle<CR>

nmap <leader>nt :NERDTreeTabsToggle<CR>
nmap <leader>ut :UndotreeToggle<cr>

" F9-F12: Programming/Compiling
map <F9> :SCCompile<CR><CR>
map <F10> :SCCompileRun<CR><CR>
map <S-F10> :SCCompileRunAsync<CR>
map <silent> <F11> :call ToggleLocationList()<CR>
map <silent> <F12> :call ToggleQuickfixList()<CR>
" }}}

" Code Folding {{{
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>
" }}}

" Plugins {{{
" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" Sneak - f/t on steroids
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" }}}
