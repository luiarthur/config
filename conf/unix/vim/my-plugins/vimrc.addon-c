function! MyAddonC() abort 
  " Arthur: addons for C:
  syn keyword	cTypedef	gsl_matrix gsl_permutation string gsl_rng gsl_matrix_view gsl_vector_view gsl_vector
  hi def link cTypedef Typedef

  " Arthur: addons for RcppArmadillo
  syntax keyword cppSTLtype vec
  syntax keyword cppSTLtype uvec
  syntax keyword cppSTLtype mat
  syntax keyword cppSTLtype NumericVector
  syntax keyword cppSTLtype NumericMatrix
  syntax keyword cppSTLtype List
  syntax keyword cppSTLfunction ones
  syntax keyword cppSTLfunction zeros
  syntax keyword cppSTLnamespace arma
  syntax keyword cppSTLnamespace Rcpp

  " Arthur: Change the color of PreProc's like 'include' in C
  "highlight Preproc ctermfg=magenta
  "highlight Special ctermfg=magenta
  "highlight Normal ctermfg=grey
endfunction

au BufRead *.cpp call MyAddonC()
au BufRead *.h call MyAddonC()

