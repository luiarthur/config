"" Line Feeder 3
"" by David B. Dahl
"" December 2010

"" Note: This is just a copy from configs repository.  Make changes there.

function! LineFeederNextLine()
  call system("tmux select-pane -D")
  call system("tmux send-keys " . shellescape(getline('.') . ""))
  call system("tmux select-pane -U")
  normal j
endfunction

function! LineFeederSideLine()
  call system("tmux select-pane -R")
  call system("tmux send-keys " . shellescape(getline('.') . ""))
  call system("tmux select-pane -L")
  normal j
endfunction

function! LineFeederSetUp()
  let ext = expand("%:e")
  if ext == "R"
    let cmd = "R"
  elseif ext == "rb"
    let cmd = "irb"
  elseif ext == "jl"
    let cmd = "julia"
  elseif ext == "scala"
    let cmd = "scala -Dscala.color -J-Xmx2g"
  elseif ext == "py"
    let cmd = "python3"
  else
    let cmd = "bash"
  endif
  let cmd = input("Command to execute: ",cmd)
  if cmd != ""
    "call system("tmux set-option default-path " . shellescape(expand("%:p:h")))
    call system("tmux split-window -d -p 34 " . shellescape("exec " . cmd))
  endif
endfunction

" Sources a file into Console Below
function! SourceFile()
  let ext = expand("%:e")
  let fn = expand("%:p")
  let cmd = ""

  if ext == "R"
    let cmd = "source('" . fn . "')"
  elseif ext == "jl"
    " NOTE: `includet` depends on Revise.jl. Uncomment this and comment the
    " next line to use this feature.
    " let cmd = "includet(\"" . fn . "\")"
    let cmd = "include(\"" . fn . "\")"
  elseif ext == "scala"
    let cmd = ":load " . fn
  elseif ext == "py"
    " python2
    "let cmd = "execfile('" . fn . "')"
    " python3
    let cmd = "exec(open('" . fn . "').read())"
  elseif ext == "sh"
    let cmd = "source " . fn
  elseif ext == "kt"
    let cmd = ":load  " . fn
  endif

  if cmd != ""
    call system("tmux select-pane -D")
    call system("tmux send-keys " . shellescape(cmd . ""))
    call system("tmux select-pane -U")
  else
    %call LineFeederNextLine()
  endif
endfunction


nnoremap <silent> <C-k> :call LineFeederSetUp()<cr>
nnoremap <silent> <C-j> :call LineFeederNextLine()<cr>
nnoremap <silent> <C-l> :call LineFeederSideLine()<cr>
"nnoremap <silent> <C-h> :%call LineFeederNextLine()<cr>
nnoremap <silent> <C-H> :call SourceFile()<cr>

" Arthur Lui
function! LineFeederChunk()
  call LineFeederNextLine()
endfunction
vmap <silent> <C-S-j> :call LineFeederChunk()<CR>

function! LineFeederSideChunk()
  call LineFeederSideLine()
endfunction
vmap <silent> <C-S-l> :call LineFeederSideChunk()<CR>
