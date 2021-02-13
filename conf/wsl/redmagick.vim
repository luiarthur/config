" RED MAGICK
" original blaque magick by xero harrison (http://blaquemagick.xero.nu)
" https://github.com/xero/blaquemagick.vim
" red magick version by Arthur Lui

" in vim, see more options by:
" :h hl-SpellBad

" For colors, see: https://jonasjacek.github.io/colors/

" Note: A black (high contrast) or #141414 (lower contrast) terminal
"       background is most compatible.

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="redmagick"


" execute hilight
" TODO: Refactor like mcmc.vim
function! ExecHi(...) " att, ctermfg, ctermbg, term, cterm
  let numArgs = a:0
  let att = a:1
  let fg = "NONE"
  let bg = "NONE"
  let mterm = "NONE"
  let mcterm = "NONE"

  if numArgs >=3 | let fg = a:2 | endif

  if numArgs >= 3
    let bg = a:3
  endif

  if numArgs >= 4
    let mterm = a:4
  endif

  if numArgs >= 5
    let mcterm = a:5
  endif

  execute 'hi ' . att 'ctermfg=' . fg 'ctermbg=' . bg 'term=' . mterm 'cterm=' . mcterm
endfunction


" Color key
let DeepPink4     = 125
let HotPink1      = 168
let HotPink3      = 132 
let LightGrey     = 252
let Grey          = 245
let LiteGrey      = 103  " Light Slate Grey
let DarkGrey      = 236
let DarkOrange    = 166
let IndianRed1    = 203
let Red           = 196  " 160, 196
let DarkRed       = 88  "52
let Comment       = 8
let Green         = 2  "46
let Black         = 0
let White         = 253
let Peach         = 137  " 137, 215
let LightBlue     = 75
let NONE          = "NONE"
let bold          = "bold"


call ExecHi("ColorColumn", NONE, LiteGrey)
call ExecHi("Comment", Comment, NONE)
call ExecHi("Conditional", LiteGrey, NONE)
call ExecHi("Constant", IndianRed1, NONE)
call ExecHi("Cursor", LiteGrey, NONE)
call ExecHi("CursorLine", NONE, NONE)
call ExecHi("DiffAdd", LiteGrey, NONE)
call ExecHi("DiffChange", NONE, DeepPink4)
call ExecHi("DiffDelete", LightGrey, Green)
call ExecHi("DiffText", LightGrey, Grey)
call ExecHi("Directory", Grey, Black)
call ExecHi("Error", White, IndianRed1, NONE, bold)
call ExecHi("ErrorMsg", Green, NONE)
call ExecHi("FoldColumn", LiteGrey, NONE)
call ExecHi("Folded", LiteGrey, NONE)
call ExecHi("Function", DarkOrange, NONE)
call ExecHi("Identifier", HotPink3, NONE)
call ExecHi("IncSearch", DarkRed, DarkOrange, NONE, bold)
call ExecHi("NonText", LiteGrey, NONE)
call ExecHi("Normal", LightGrey, NONE)
call ExecHi("Number", IndianRed1, NONE)
call ExecHi("Operator", LiteGrey, NONE)
call ExecHi("PreProc", Red,NONE,NONE, NONE)
call ExecHi("Repeat", LiteGrey, NONE)
call ExecHi("Search", DarkRed, LightGrey, NONE, bold)
call ExecHi("Special", HotPink3, NONE, NONE, bold)
call ExecHi("SpecialKey", LiteGrey, NONE)
call ExecHi("Statement", LiteGrey, NONE, NONE, bold)
call ExecHi("StatusLine", LiteGrey, NONE)
call ExecHi("TabLineSel", LightGrey, NONE)
call ExecHi("Title", DarkOrange, NONE)
call ExecHi("Todo", 15, 8)
call ExecHi("Type", Peach, NONE, NONE, NONE)
call ExecHi("VertSplit", LiteGrey, NONE)
call ExecHi("Visual", Black, LightGrey)
call ExecHi("WarningMsg", LiteGrey, NONE)
call ExecHi("CursorLineNr",Black, DarkGrey)
call ExecHi("SpellCap", DarkRed, LightBlue, NONE, bold)
call ExecHi("Pmenu", LightGrey, DarkGrey)
hi! link PmenuSel        Todo
hi! link PmenuSbar       Todo
hi! link PmenuThumb      Todo

hi Underlined term=underline cterm=underline ctermfg=NONE ctermbg=NONE

hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link StatusLineNC    StatusLine
" hi! link Title           Normal
hi! link MoreMsg         Normal
hi! link Question        DiffChange
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup
hi! link String          Number
hi! link SpellBad        Todo
hi! link LineNr          Comment

hi Normal ctermbg=232
