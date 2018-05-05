" Vundle is used for installing vim plugins. I used this for go's syntax
" highligh installation.
" For Installation Deatils, see https://github.com/gmarik/Vundle.vim
" To launch add the Plugin to the Plugin section.

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" After adding a Plugin, go to vim and run
"   :PluginInstall
Plugin 'gmarik/Vundle.vim'       " Vim
Plugin 'derekwyatt/vim-scala'    " Scala
Plugin 'tmux-plugins/vim-tmux'   " tmux
Plugin 'JuliaEditorSupport/julia-vim' "julia
Plugin 'godlygeek/tabular'       " Auto Indent
Plugin 'octol/vim-cpp-enhanced-highlight' " C++
Plugin 'fatih/vim-go'            " Go-lang
Plugin 'luiarthur/stan.vim'      " STAN modeling
Plugin 'luiarthur/kotlin-vim'    " Kotlin
"Plugin 'vim-pandoc/vim-pandoc-syntax' " pandoc
"Plugin 'vim-pandoc/vim-pandoc'        "pandoc

" For Markdown
"set nofoldenable    " disable folding
Plugin 'plasticboy/vim-markdown' " Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" Add this to the syntax file in ~/.vim/bundle/vim-cpp-enhanced-highlight
"" Arthur RcppArmadillo.
"syntax keyword cppSTLtype vec
"syntax keyword cppSTLtype uvec
"syntax keyword cppSTLtype mat
"syntax keyword cppSTLtype NumericVector
"syntax keyword cppSTLtype List
"syntax keyword cppSTLfunction ones
"syntax keyword cppSTLfunction zeros
"syntax keyword cppSTLnamespace arma
"syntax keyword cppSTLnamespace Rcpp


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"########End of Vundle STUFF###############################

" Basic stuff
syntax enable               " Syntax highlighting
set hlsearch                " Highlight search items
set incsearch               " Highlight search items as you type
set showmatch               " Show matches for parenthesis, etc.
set expandtab               " Use softtabs
set tabstop=2 shiftwidth=2  " Set tab width
set background=light        " Assume a light background (dark is the other option)
set autoindent
set clipboard=unnamed

" Return to last position
set viminfo='100,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 

" Keep text in visual mode when indenting or unindenting.
" Every time I hit < automatically do <gv
vmap < <gv  
vmap > >gv
vmap <s-tab> <gv
vmap <tab> >gv

" Intelligent tab completion
function! InsertTabWrapper(direction)
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  elseif "backward" == a:direction
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" Line Feeder functionality
try
  source $MYVIMRC.line-feeder-3
catch
endtry

" Execute a command from a shell
function ExecuteShellCommand(...)
  let cmd = ''
  let i = 1
  while i <= a:0
    let cmd = cmd . a:{i} . ' '
    let i = i + 1
  endwhile
  silent execute '!' . cmd
  redraw!
endfunction
command -nargs=+ E :call ExecuteShellCommand(<f-args>)

" Keybinding for word wrap
nnoremap <C-x> gqap

" Move between tabs --- Does not work within tmux.
nnoremap <silent> <A-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :tabprevious<CR>

" Switch to hex-editor
noremap <F8> :%!xxd<CR>
" Switch back
noremap <F7> :%!xxd -r<CR>

" Copy and paste between sessions
" Dahl copy the current visual selection to ~/.vbuf
" vmap <C-S-y> :w! ~/.vbuf<CR>

vmap <C-S-u> :w! xsel<CR> " copy the current visual selection to X11 clipboard using "xsel"
vmap <C-S-y> "+y<CR>      " copy the current visual selection to ~/.vbuf
nmap <C-S-p> "+p<CR>      " paste the contents of the buffer file
noremap <F9> zR
set number

" disable F1 for help
nmap <F1> <nop>

" Change the color of PreProc's like 'include' in C
highlight Preproc ctermfg=magenta
highlight Special ctermfg=magenta
highlight Normal ctermfg=grey

" Copy and paste between sessions or X11 sessions (alternative)
"vmap <C-S-u> :w ! xsel<CR>
"vmap <C-S-y> :w! ~/.vbuf<CR>     " copy the current visual selection to ~/.vbuf
"nmap <C-S-p> :r ~/.vbuf<CR>      " paste the contents of the buffer file

" Code Completer -- sends line and tab down to REPL
function! CompleteCode()
  " Figure out number of tabs for language
  let ext = expand("%:e")
  let numTabs = 2
  if ext == "scala"
    let numTabs = 1
  endif
  let tabs = repeat("\<tab>", numTabs)

  " Send line and tabs down to REPL
  call system("tmux select-pane -D")
  let bs = repeat('',100) "create bs string 100 times
  call system("tmux send-keys " . shellescape(getline('.') . tabs) . bs) "The . is concat
  call system("tmux select-pane -U")
  return ""
endfunction
inoremap <S-tab> <c-r>=CompleteCode()<cr>

" MusicNB highlight as markdown
autocmd BufNewFile,BufRead *.mnb   set syntax=markdown
" enable spell check for md files
au BufRead *.md setlocal spell
" use a special latex dictionary for markdown
au BufRead *.md setlocal spellfile=~/.vim/spell/tex.utf-8.add



" Set colorsheme to ~/.vim/colors/redmagick. Comment out to disable.
colorscheme redmagick


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


" Markdown Highlighting. Requires vim-markdown (plasticboy)
function! MyMkdAddOn() abort 
  if get(g:, 'vim_markdown_math', 0)
    "syn region mkdMath start="\\begin{\w\+}" end="\\end{\w\+}" contains=@tex keepend
    "syn region mkdMath start="\\begin{\w\+\*}" end="\\end{\w\+\*}" contains=@tex keepend
    syn region mkdMath start="\\begin{align}" end="\\end{align}" contains=@tex keepend
    syn region mkdMath start="\\begin{align*}" end="\\end{align*}" contains=@tex keepend
    syn region mkdMath start="\\begin{equation}" end="\\end{equation}" contains=@tex keepend
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
au BufRead *.md call MyMkdAddOn()

" For Nyquist (Audacity)
au BufRead *.ny set syntax=lisp

" My tex addons
function! MyTexAddOn() abort 
  set foldmethod=marker
  set spell
endfunction
au BufRead *.tex call MyTexAddOn()
au BufRead *.tex setlocal spellfile=~/.vim/spell/tex.utf-8.add " use a special latex dictionary for latex

" My R addons
function! MyRAddon() abort 
  " see /usr/share/vim/vim74/syntax/r.vim
  syn match rOKeyword contained "@\(description\)"
endfunction
au BufRead *.R call MyRAddon()


