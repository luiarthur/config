" mcmc colorscheme. (WIP)
"
" Maintainer: Arthur Lui <luiarthur@gmail.com>
" Last Change: 21 Feb, 2021.
"
" This color scheme uses a darkgrey background .


" Remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name="mcmc"


" Function for executing hilight
function! ExecHi(att, dict)
  if has_key(a:dict, 'fg') | let fg = a:dict['fg'] | else | let fg = 'None' | end
  if has_key(a:dict, 'bg') | let bg = a:dict['bg'] | else | let bg = 'None' | end
  if has_key(a:dict, 'mterm') | let mterm = a:dict['mterm'] | else | let mterm = 'None' | end
  if has_key(a:dict, 'cterm') | let cterm = a:dict['cterm'] | else | let cterm = 'None' | end
  execute 'hi ' . a:att 'ctermfg=' . fg 'ctermbg=' . bg 'term=' . mterm 'cterm=' . cterm
endfunction

" Color key
" TODO: Refine and remove unused colors. Use as few colors as possible.
let Olive         = 94
let DeepPink4     = 125
let HotPink3      = 132
let LightGrey     = 252
let Grey          = 245
let DarkGrey      = 236
let DarkOrange3   = 166
let IndianRed1    = 203
let Red1          = 196 "bright
let Red2          = 124 "background
let Red3          = 160 "brown
let DarkRed       = 88 "52
let LineNr        = 8
let Green         = 2 "46
let Black         = 0
let White         = 253
let Peach         = 179 "215
let Blue          = 27
let LiteBlue      = 75
let SlateGrey     = 103
let Pale          = 180
let NONE          = "NONE"
let bold          = "bold"


" Syntax highlighting colors.
call ExecHi("ColorColumn", {'bg': SlateGrey})
call ExecHi('Comment', {'fg': Olive})
call ExecHi("Conditional", {'fg': SlateGrey})
call ExecHi("Constant", {'fg': Peach})
call ExecHi("Cursor", {'fg': 232, 'bg': 15, 'mterm': bold, 'cterm': bold})
call ExecHi("CursorLine", {'fg': Black, 'bg': White, 'mterm': bold, 'cterm': bold})
call ExecHi("DiffAdd", {'fg': SlateGrey})
call ExecHi("DiffChange", {'bg': DeepPink4})
call ExecHi("DiffDelete", {'fg': LightGrey, 'bg': Green})
call ExecHi("DiffText", {'fg': LightGrey, 'bg': Grey})
call ExecHi("Directory", {'fg': Grey, 'bg': Black})
call ExecHi("Error", {'fg': White, 'bg': Peach, 'mterm': bold})
call ExecHi("ErrorMsg", {'fg': Green})
call ExecHi("FoldColumn", {'fg': SlateGrey})
call ExecHi("Folded", {'fg': SlateGrey})
call ExecHi("Function", {'fg': DarkOrange3})
call ExecHi("Identifier", {'fg': LiteBlue})
call ExecHi("IncSearch", {'fg': DarkRed, 'bg': DarkOrange3, 'cterm': bold})
call ExecHi("NonText", {'fg': SlateGrey})
call ExecHi("Normal", {'fg': LightGrey})
call ExecHi("Number", {'fg': Peach})
call ExecHi("Operator", {'fg': SlateGrey})
call ExecHi("PreProc", {'fg': IndianRed1})
call ExecHi("Repeat", {'fg': SlateGrey})
call ExecHi("Search", {'fg': DarkRed, 'bg': LightGrey, 'cterm': bold})
call ExecHi("Special", {'fg': HotPink3, 'cterm': bold})
call ExecHi("SpecialKey", {'fg': SlateGrey})
call ExecHi("Statement", {'fg': SlateGrey})
call ExecHi("StatusLine", {'fg': SlateGrey})
call ExecHi("TabLineSel", {'fg': LightGrey})
call ExecHi("Title", {'fg': DarkOrange3})
call ExecHi("Todo", {'fg': 15, 'bg': 8, 'cterm': NONE})
call ExecHi("Type", {'fg': Peach})
call ExecHi("VertSplit", {'fg': SlateGrey})
call ExecHi("Visual", {'fg': 0, 'bg': 7})
call ExecHi("WarningMsg", {'fg': SlateGrey})
call ExecHi("LineNr", {'fg': 243})
call ExecHi("CursorLineNr", {'fg': Black, 'bg': DarkGrey})
  
call ExecHi("Pmenu", {'fg': LightGrey, 'bg': DarkGrey})
call ExecHi("PmenuSel", {'fg': Black, 'bg': Green})
call ExecHi("PmenuSbar", {'fg': Black, 'bg': Green})
call ExecHi("PmenuThumb", {'fg': Black, 'bg': Green})
  
call ExecHi("SpellBad", {'fg': White, 'bg': Red3, 'cterm': bold})
call ExecHi("SpellCap", {'fg': DarkRed, 'bg': LiteBlue, 'cterm': bold})

hi Underlined term=underline cterm=underline ctermfg=NONE ctermbg=NONE

hi! link diffAdded       DiffAdd
hi! link diffRemoved     DiffDelete
hi! link diffChanged     DiffChange
hi! link StatusLineNC    StatusLine
hi! link MoreMsg         Normal
hi! link Question        DiffChange
hi! link TabLine         StatusLineNC
hi! link TabLineFill     StatusLineNC
hi! link VimHiGroup      VimGroup
hi! link SpellBad        Todo
hi! link String          Number

" Background color for vim.
hi Normal ctermbg=232
