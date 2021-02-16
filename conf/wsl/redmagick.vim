" RED MAGICK
"
" Author: Arthur Lui
" Repo: https://github.com/luiarthur/config/blob/master/conf/wsl/redmagick.vim
"
" Original: Based on original blaque magick by xero harrison (http://blaquemagick.xero.nu)
" Origin: https://github.com/xero/blaquemagick.vim
"
" In vim, see more options by (for example):
" :h hl-SpellBad
"
" For colors, see: https://github.com/luiarthur/config/blob/master/bin/unix/color.sh
"
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
let LiteGrey      = 252
let Grey          = 245
let BlueGrey      = 103
let DarkGrey      = 236
let Orange        = 166
let LiteRed       = 203
let Red           = 9  " 160, 196
let DarkRed       = 88  "52
let Comment       = 8
let Green         = 2  "46
let Black         = 0
let PitchBlack    = 16
let White         = 253
let BrightWhite   = 15
let Peach         = 137  " 137, 215
let LiteBlue      = 75
let Lavender      = 139
let LiteGreen     = 79
let NONE          = "NONE"
let bold          = "bold"


call ExecHi("ColorColumn", NONE, BlueGrey)
call ExecHi("Comment", Comment, NONE)
call ExecHi("Conditional", BlueGrey, NONE)
call ExecHi("Constant", LiteRed, NONE)
call ExecHi("Cursor", BlueGrey, NONE)
call ExecHi("CursorLine", NONE, NONE)
call ExecHi("DiffAdd", BlueGrey, NONE)
call ExecHi("DiffChange", NONE, DeepPink4)
call ExecHi("DiffDelete", LiteGrey, Green)
call ExecHi("DiffText", LiteGrey, Grey)
call ExecHi("Directory", Grey, Black)
call ExecHi("Error", PitchBlack, Lavender)
call ExecHi("ErrorMsg", Green, NONE)
call ExecHi("FoldColumn", BlueGrey, NONE)
call ExecHi("Folded", BlueGrey, NONE)
call ExecHi("Function", Orange, NONE)
call ExecHi("Identifier", HotPink3, NONE)
call ExecHi("IncSearch", PitchBlack, Orange)
call ExecHi("NonText", BlueGrey, NONE)
call ExecHi("Normal", LiteGrey, NONE)
call ExecHi("Number", LiteRed, NONE)
call ExecHi("Operator", BlueGrey, NONE)
call ExecHi("PreProc", Red, NONE, NONE, NONE)
call ExecHi("Repeat", BlueGrey, NONE)
call ExecHi("Search", PitchBlack, LiteGrey)
call ExecHi("Special", HotPink3, NONE, NONE, bold)
call ExecHi("SpecialKey", BlueGrey, NONE)
call ExecHi("Statement", BlueGrey, NONE, NONE, bold)
call ExecHi("StatusLine", BlueGrey, NONE)
call ExecHi("TabLineSel", LiteGrey, NONE)
call ExecHi("Title", Orange, NONE)
call ExecHi("Type", Peach, NONE)
call ExecHi("VertSplit", BlueGrey, NONE)
call ExecHi("Visual", Black, LiteGreen)
call ExecHi("WarningMsg", BlueGrey, NONE)
call ExecHi("CursorLineNr",Black, DarkGrey)
call ExecHi("SpellCap", DarkRed, LiteBlue, NONE, bold)

call ExecHi("Pmenu", LiteGrey, Black)
call ExecHi("PmenuSel", DarkRed, LiteGrey)
"
"TODO: This is a test.

hi Underlined term=underline cterm=underline ctermfg=NONE ctermbg=NONE
hi Normal ctermbg=232

hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link StatusLineNC    StatusLine
hi! link MoreMsg         Normal
hi! link Question        DiffChange
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup
hi! link String          Number
hi! link Todo            Error
hi! link SpellBad        Error
hi! link LineNr          Comment
hi! link PmenuSbar       PmenuSel
hi! link PmenuThumb      PmenuSel
