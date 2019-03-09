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


call deoplete#custom#option({
      \ 'auto_complete_delay': 0,
      \ 'auto_refresh_delay': 10,
      \ 'refresh_always': v:true,
      \ 'smart_case': v:true,
      \ 'camel_case': v:true,
      \ })
call deoplete#custom#option('keyword_patterns', {
      \ '_': '[a-zA-Z_]\k*\(?',
      \ 'tex': '[^\w|\s][a-zA-Z_]\w*',
      \ })


call deoplete#custom#option('ignore_sources', {'_': ['dictionary', 'around', 'buffer']})

call deoplete#custom#source('_', {
      \ 'matchers': ['matcher_full_fuzzy', 'matcher_length'],
      \ 'sorters': ['sorter_rank'],
      \ 'converters': [
      \   'converter_remove_paren', 'converter_remove_overlap',
      \   'matcher_length', 'converter_truncate_abbr',
      \   'converter_truncate_menu', 'converter_auto_delimiter',
      \ ],
      \ })
call deoplete#custom#source('omni', 'input_pattern', {
      \ 'tex': '\\(?:'
      \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
      \ .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
      \ .  '|hyperref\s*\[[^]]*'
      \ .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
      \ .  '|(?:include(?:only)?|input)\s*\{[^}]*'
      \ .  ')',
      \ })

call deoplete#custom#source('buffer', 'mark', 'ℬ')
call deoplete#custom#source('look', {
      \ 'min_pattern_length': 5,
      \ 'filetypes': ['help', 'text', 'markdown', 'gitcommit'],
      \ 'mark': ''
      \ })
call deoplete#custom#source('jedi', 'mark', '')
call deoplete#custom#source('neosnippet', 'mark', '')
call deoplete#custom#source('omni', 'mark', '⌾')
call deoplete#custom#source('tern', 'mark', '')
call deoplete#custom#source('vim', 'mark', '')
" }}}


" Snippets {{{
let g:neosnippet#data_directory = expand('~/.vim/cache/neosnippet')

autocmd InsertLeave * NeoSnippetClearMarkers

let g:neosnippet#enable_completed_snippet = 1
autocmd CompleteDone * call neosnippet#complete_done()
" }}}


" Candidate Marks {{{
" call deoplete#custom#option('candidate_marks',
"       \ ['A', 'S', 'D', 'F', 'G'])
" inoremap <expr>A       deoplete#insert_candidate(0)
" inoremap <expr>S       deoplete#insert_candidate(1)
" inoremap <expr>D       deoplete#insert_candidate(2)
" inoremap <expr>F       deoplete#insert_candidate(3)
" inoremap <expr>G       deoplete#insert_candidate(4)
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
