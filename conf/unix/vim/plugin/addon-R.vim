" My R addons
function! MyRAddon() abort 
  " see /usr/share/vim/vim74/syntax/r.vim
  "syn match rOKeyword contained "@\(description\)"
endfunction
au BufRead *.R call MyRAddon()
au BufRead *.Rmd set syntax=markdown
