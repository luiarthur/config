" My tex addons
function! MyJuliaAddOn() abort 
  " syntax keyword juliaTodo		contained TODO FIXME XXX
  syntax keyword juliaTodo		contained NOTE
endfunction
au BufRead *.jl call MyJuliaAddOn()
