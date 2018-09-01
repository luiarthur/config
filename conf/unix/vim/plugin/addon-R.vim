" My R addons
function! MyRAddon() abort 
  " see /usr/share/vim/vim74/syntax/r.vim
  "syn match rOKeyword contained "@\(description\)"
endfunction
au BufRead *.R call MyRAddon()
au BufRead *.Rmd set syntax=markdown

" Linter (syntastic plugin). Requires installing 'lintr' in R.
let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']

