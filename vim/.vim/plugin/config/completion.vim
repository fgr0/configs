" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Setup completion
"

" Early Exit
if v:version < 800 || !has('python3')
  finish
endif

" Deoplete {{{
" Autoenable on InsertEnter
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable() 
      \ | call echodoc#enable()

let g:deoplete#ignore_sources = ['dictionary', 'around', 'buffer']

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = 
    \   '\\(?:'
    \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
    \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
    \  .  '|hyperref\s*\[[^]]*'
    \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
    \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
    \  .')'

call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
" }}}


" Snippets {{{
let g:neosnippet#data_directory = expand('~/.cache/vim/neosnippet')
let g:neosnippet#enable_snipmate_compatibility = 1
" }}}


" Tab Completion {{{
imap <expr><TAB> pumvisible() ?
      \ "\<C-n>" : neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

inoremap <CR> <C-r>=<SID>select_or_cr()<CR>
function! s:select_or_cr() abort
  if pumvisible()
    return deoplete#mappings#close_popup()
  else
    return "\<CR>"
  endif
endfunction
" }}}
