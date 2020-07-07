" Markdown Highlighting. Requires vim-markdown (plasticboy)
function! MyMkdAddOn() abort 
  if get(g:, 'vim_markdown_math', 0)
    syn region mkdMath start="\\begin{align\*}" end="\\end{align\*}" contains=@tex keepend
    syn region mkdMath start="\\begin{minipage}" end="\\end{minipage}" contains=@tex keepend
    syn region mkdMath start="\\begin{table}" end="\\end{table}" contains=@tex keepend
  endif
  let g:tex_comment_nospell= 1
  syn match mkdRef '@\w\+'
  set foldmethod=marker
  syn cluster texCommentGroup	contains=texTodo,@NoSpell
  " Markdown comments 
  syn region mkdComment start="\[comment\]:\s<> (%" end="%)"
  hi def link mkdComment Comment
  syn cluster mkdNonListItem add=mkdRef,mkdComment
endfunction
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
"let g:vim_markdown_folding_disabled = 1

function MathToggle()
  if get(g:, 'vim_markdown_math', 0)
    let g:vim_markdown_math = 0
    echo "Hi"
  else
    let g:vim_markdown_math = 1
    echo "bye"
  endif
  syntax enable
endfunction

" Load my Markdown addons
au BufRead *.md call MyMkdAddOn()

" MusicNB highlight as markdown
autocmd BufNewFile,BufRead *.mnb   set syntax=markdown

" Set spell check for markdown files
au BufRead *.md setlocal spell

" use a special latex dictionary for markdown
au BufRead *.md setlocal spellfile=~/.vim/spell/tex.utf-8.add
