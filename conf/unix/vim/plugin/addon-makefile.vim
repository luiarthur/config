" My Makefile addons
function! MyMakefileAddon() abort 
  set foldmethod=marker
endfunction

au BufRead Makefile call MyMakefileAddon()
