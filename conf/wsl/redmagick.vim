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
function! ExecHi(...) " att, ctermfg, ctermbg, term, cterm
  let numArgs = a:0
  let att = a:1
  let fg = "NONE"
  let bg = "NONE"
  let mterm = "NONE"
  let mcterm = "NONE"

  if numArgs >=3
    let fg = a:2
  endif

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
let DarkGrey      = 103 " Light Slate Grey
let DarkDarkGrey  = 236
let DarkOrange3   = 166
let IndianRed1    = 203
let Red1          = 196 "bright
let Red3          = 160 "brown
let DarkRed       = 88 "52
let LineNr        = 8
let Green         = 2 "46
let Black         = 0
let White         = 253
let Peach         = 215
let LightBlue     = 75
let NONE          = "NONE"
let bold          = "bold"


call ExecHi("ColorColumn",NONE,DarkGrey)
call ExecHi("Comment",HotPink1,NONE)
call ExecHi("Conditional",DarkGrey,NONE)
call ExecHi("Constant",Red1,NONE)
call ExecHi("Cursor",DarkGrey,NONE)
call ExecHi("CursorLine",NONE,NONE)
call ExecHi("DiffAdd",DarkGrey,NONE)
call ExecHi("DiffChange",NONE,DeepPink4)
call ExecHi("DiffDelete",LightGrey,Green)
call ExecHi("DiffText",LightGrey,Grey)
call ExecHi("Directory",Grey,Black)
call ExecHi("Error",White,Red1,NONE,bold)
call ExecHi("ErrorMsg",Green,NONE)
call ExecHi("FoldColumn",DarkGrey,NONE)
call ExecHi("Folded",DarkGrey,NONE)
"call ExecHi("Function",Red3,NONE)
call ExecHi("Function",DarkOrange3,NONE)
call ExecHi("Identifier",Red3,NONE)
call ExecHi("IncSearch",DarkRed,DarkOrange3,NONE,bold)
call ExecHi("NonText",DarkGrey,NONE)
call ExecHi("Normal",LightGrey,NONE)
call ExecHi("Number",Red1,NONE)
call ExecHi("Operator",DarkGrey,NONE)
call ExecHi("PreProc",IndianRed1,NONE,NONE,NONE)
call ExecHi("Repeat",DarkGrey,NONE)
call ExecHi("Search",DarkRed,LightGrey,NONE,bold)
call ExecHi("Special",HotPink3,NONE,NONE,bold)
call ExecHi("SpecialKey",DarkGrey,NONE)
call ExecHi("Statement",DarkGrey,NONE,NONE,bold)
call ExecHi("StatusLine",DarkGrey,NONE)
call ExecHi("String",Red3,NONE)
call ExecHi("TabLineSel",LightGrey,NONE)
call ExecHi("Title",DarkOrange3,NONE)
call ExecHi("Todo",Black,Green)
call ExecHi("Type",Peach,NONE,NONE,NONE)
call ExecHi("VertSplit",DarkGrey,NONE)
call ExecHi("Visual",Black,LightGrey)
call ExecHi("WarningMsg",DarkGrey,NONE)
call ExecHi("LineNr",LineNr,NONE,NONE,NONE)
call ExecHi("CursorLineNr",Black,DarkDarkGrey)

call ExecHi("Pmenu",LightGrey,DarkDarkGrey)
call ExecHi("PmenuSel",Black,Green)
call ExecHi("PmenuSbar",Black,Green)
call ExecHi("PmenuThumb",Black,Green)

"call ExecHi("SpellBad",DarkRed,Green,NONE,bold)
call ExecHi("SpellBad",White,Red3,NONE,bold)
call ExecHi("SpellCap",DarkRed,LightBlue,NONE,bold)

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

hi Normal ctermbg=232
