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


