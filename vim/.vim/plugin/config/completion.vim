" vim:fdm=marker:fmr={{{,}}}:fdl=1:ts=4:sts=2:sw=2:ft=vim
"
" Setup completion
"

" Deoplete {{{
" Autoenable on InsertEnter
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()

" call deoplete#custom#source('dictionary', 'matchers', ['matcher_head'])
" call deoplete#custom#source('dictionary', 'sorters', [])
" call deoplete#custom#source('dictionary', 'min_pattern_length', 4)
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
