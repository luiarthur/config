" Enable code snippets in other code
" see: http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file 
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
  let ft=toupper(a:filetype)
  let group='textGroup'.ft
  if exists('b:current_syntax')
    let s:current_syntax=b:current_syntax
    " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
    " do nothing if b:current_syntax is defined.
    unlet b:current_syntax
  endif
  execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
  try
    execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
  catch
  endtry
  if exists('s:current_syntax')
    let b:current_syntax=s:current_syntax
  else
    unlet b:current_syntax
  endif
  execute 'syntax region textSnip'.ft.'
  \ matchgroup='.a:textSnipHl.'
  \ start="'.a:start.'" end="'.a:end.'"
  \ contains=@'.group
endfunction

" Search for R code snippets in scala
au BufRead *.scala call TextEnableCodeSnip('r', 'R eval \"\"\"', '\"\"\"', 'SpecialComment')
" Search for R code snippets in julia
au BufRead *.jl call TextEnableCodeSnip('r', 'R\"\"\"', '\"\"\"', 'SpecialComment')
" Search for scala code snippets in R
au BufRead *.R call TextEnableCodeSnip('scala', "'/\\*scala\\*/", "/\\*scala\\*/'", 'SpecialComment')
au BufRead *.R call TextEnableCodeSnip('sql', "sqldf('", "')", 'SpecialComment')


