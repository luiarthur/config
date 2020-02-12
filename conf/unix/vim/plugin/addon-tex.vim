" My tex addons
function! MyTexAddOn() abort 
  set foldmethod=marker
  set spell
endfunction
au BufRead *.tex call MyTexAddOn()
au BufRead *.tex setlocal spellfile=~/.vim/spell/tex.utf-8.add " use a special latex dictionary for latex
let g:tex_comment_nospell=1  " ignores spelling errors in comments

