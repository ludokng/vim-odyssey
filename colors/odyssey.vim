"                             __
"                 ____   ____/ /__  __ _____ _____ ___   __  __
"                / __ \ / __  // / / // ___// ___// _ \ / / / /
"               / /_/ // /_/ // /_/ /(__  )(__  )/  __// /_/ /
"               \____/ \__,_/ \__, //____//____/ \___/ \__, /
"                            /____/                   /____/
"
"     You terrible man, foxy, ingenious, never tired of twists and tricks
"
" Note: Odyssey is a dark green colorscheme for Vim. It main color, the one of
" its background, is an approximation of a darker shade of light sea green.
" This link to the sea is the reason why that colorscheme is named after the
" Odyssey.
"
" Maintainer: Ludovic Koenig <ludovic.koenig@gmail.com>
" License: MIT
" Release: 0.2.0
" Initialisation {{{

if !has('gui_running')
  if !(has('termguicolors') && &termguicolors) && &t_Co != 256
    finish
  endif
endif

if v:version > 580
  set background=dark
  highlight clear
  if exists('syntax_on')
    syntax reset
  endif
else
  finish
endif

let g:colors_name = 'odyssey'

" }}}
" Color Utilities {{{

function! s:hsv2rgb(hue, saturation, value)
  let l:s = a:saturation / 100.0
  let l:v = a:value / 100.0

  let l:c = l:v * l:s
  let l:h = a:hue / 60.0
  let l:x = l:c * (1.0 - abs(fmod(l:h, 2) - 1.0))

  if 0 <= l:h && l:h <= 1
    let l:l = [l:c, l:x, 0.0]
  elseif 1 < l:h && l:h <= 2
    let l:l = [l:x, l:c, 0.0]
  elseif 2 < l:h && l:h <= 3
    let l:l = [0.0, l:c, l:x]
  elseif 3 < l:h && l:h <= 4
    let l:l = [0.0, l:x, l:c]
  elseif 4 < l:h && l:h <= 5
    let l:l = [l:x, 0.0, l:c]
  elseif 5 < l:h && l:h <= 6
    let l:l = [l:c, 0.0, l:x]
  endif

  let l:m = l:v - l:c

  let l:l = [l:l[0] + l:m, l:l[1] + l:m, l:l[2] + l:m]
  let l:l = [l:l[0] * 255, l:l[1] * 255, l:l[2] * 255]
  let l:l = [round(l:l[0]), round(l:l[1]), round(l:l[2])]
  let l:l = [float2nr(l:l[0]), float2nr(l:l[1]), float2nr(l:l[2])]

  return l:l
endfunction

function! s:rgb2hex(rgb)
  let l:f = "%02x"
  return printf(l:f, a:rgb[0]) . printf(l:f, a:rgb[1]) . printf(l:f, a:rgb[2])
endfunction

function! s:rgb2short(rgb)
  " 216 colors + 24 greys = 240 total ( - 16 because ignoring system color )
  function! s:xterm2rgb(key, val)
    let l:incs = [0, 95, 135, 175, 215, 255]

    if a:val < 216
      return [l:incs[a:val / 36], l:incs[(a:val % 36) / 6], l:incs[a:val % 6]]
    else
      let l:coordinate = a:val * 10 - 2152
      return [l:coordinate, l:coordinate, l:coordinate]
    endif
  endfunction

  function! s:distance(lhs, rhs)
    return abs(a:lhs[0] - a:rhs[0])
          \ + abs(a:lhs[1] - a:rhs[1])
          \ + abs(a:lhs[2] - a:rhs[2])
  endfunction

  let l:xterm = range(0, 239)
  let l:xterm = map(l:xterm, function('s:xterm2rgb'))

  let l:distances = []
  for l:value in l:xterm
    let l:distances += [s:distance(l:value, a:rgb)]
  endfor

  let l:index = index(l:distances, min(l:distances)) + 16

  return printf("%s", l:index)
endfunction

function! s:colorize(hue, saturation, value)
  let l:rgb = s:hsv2rgb(a:hue, a:saturation, a:value)
  let l:gui = s:rgb2hex(l:rgb)
  let l:cterm = s:rgb2short(l:rgb)
  let l:res = {'gui': l:gui, 'cterm': l:cterm}
  return l:res
endfunction

" }}}
" Colors {{{
"
" This section deals with the initialization of the different colors used by
" the colorscheme. Odyssey is going to use a 12-colors palette. The will be 6
" colors for the different part of the editor, and 6 colors for the
" highligting.
"
" The s:colors dictionary is initialized in the Bootstrap section.

let s:colors = {}

let s:colors.beyondback = s:colorize(177, 20,  6)
let s:colors.background = s:colorize(177, 20, 11)
let s:colors.cursorline = s:colorize(177, 25, 16)
let s:colors.foldedline = s:colorize(177, 25, 21)
let s:colors.linenumber = s:colorize(177,  9, 55)
let s:colors.foreground = s:colorize(177, 11, 75)

let s:colors.error      = s:colorize(  0, 45, 70)
let s:colors.warning    = s:colorize( 30, 45, 70)
let s:colors.type       = s:colorize( 70, 45, 70)
let s:colors.procedure  = s:colorize(140, 45, 70)
let s:colors.keyword    = s:colorize(180, 45, 70)
let s:colors.constant   = s:colorize(210, 45, 70)

" }}}
" Highlight Utilities {{{

function! s:HL(group, bg, ...)
  let histring = 'highlight ' . a:group . ' '
  let cbg = get(s:colors, a:bg)
  let histring .= 'guibg=#'. cbg['gui'] . ' ' . 'ctermbg=' . cbg['cterm']

  if a:0 > 0
    let cfg = get(s:colors, a:1)
    let histring .= ' guifg=#'. cfg['gui'] . ' ' . 'ctermfg=' . cfg['cterm']
  endif

  if a:0 > 1
    let histring .= ' cterm=' . a:2
  else
    let histring .= ' cterm=none'
  endif

  execute histring
endfunction

" }}}
" Default Highlights {{{
"
" This section links the different default highlight groups with their
" associated colors. They appear in the same order than when the highlight
" command is used.

call s:HL(      'SpecialKey', 'background',    'warning')
call s:HL(     'EndOfBuffer', 'background', 'linenumber')
call s:HL(         'NonText', 'background', 'linenumber')
call s:HL(       'Directory', 'background', 'foreground')
call s:HL(        'ErrorMsg', 'background',      'error')
call s:HL(         'MoreMsg', 'background',    'warning')
call s:HL(         'ModeMsg', 'background',    'warning')
call s:HL(       'IncSearch', 'foreground', 'background')
call s:HL(          'Search', 'linenumber', 'background')
call s:HL(          'LineNr', 'background', 'linenumber')
call s:HL(    'CursorLineNr', 'cursorline', 'foreground')
call s:HL(        'Question', 'background',    'warning')
call s:HL(      'StatusLine', 'cursorline', 'foreground')
call s:HL(    'StatusLineNC', 'beyondback', 'linenumber')
call s:HL(       'VertSplit', 'beyondback', 'beyondback')
call s:HL(           'Title', 'background',  'procedure')
call s:HL(          'Visual', 'foreground', 'background')
call s:HL(       'VisualNOS', 'foreground', 'background')
call s:HL(      'WarningMsg', 'background',    'warning')
call s:HL(        'WildMenu', 'cursorline',    'warning')
call s:HL(          'Folded', 'foldedline', 'linenumber')
call s:HL(      'FoldColumn', 'foldedline', 'linenumber')
call s:HL(         'DiffAdd',  'procedure', 'background')
call s:HL(      'DiffChange',    'warning', 'background')
call s:HL(      'DiffDelete',      'error', 'background')
call s:HL(        'DiffText',      'error', 'background')
call s:HL(      'SignColumn', 'background',      'error')
call s:HL(         'Conceal', 'background',    'keyword')
call s:HL(        'SpellBad', 'background',      'error', 'underline')
call s:HL(        'SpellCap', 'background',    'warning', 'underline')
call s:HL(       'SpellRare', 'background',   'constant', 'underline')
call s:HL(      'SpellLocal', 'background',    'keyword', 'underline')
call s:HL(           'Pmenu', 'foldedline', 'linenumber')
call s:HL(        'PmenuSel', 'foreground', 'background')
call s:HL(       'PmenuSbar', 'foldedline', 'foldedline')
call s:HL(      'PmenuThumb', 'linenumber', 'linenumber')
call s:HL(         'TabLine', 'background', 'linenumber')
call s:HL(      'TabLineSel', 'background', 'foreground')
call s:HL(     'TabLineFill', 'beyondback', 'linenumber')
call s:HL(    'CursorColumn', 'cursorline')
call s:HL(      'CursorLine', 'cursorline')
call s:HL(     'ColorColumn', 'foldedline')
call s:HL(  'StatusLineTerm', 'cursorline', 'foreground')
call s:HL('StatusLineTermNC', 'beyondback', 'linenumber')
call s:HL(          'Cursor', 'foreground', 'background')
call s:HL(         'lCursor', 'foreground', 'background')
call s:HL(      'MatchParen', 'background',    'warning', 'underline')
call s:HL(     'ToolbarLine', 'linenumber', 'linenumber')
call s:HL(   'ToolbarButton', 'linenumber', 'background')
call s:HL(         'Comment', 'background', 'linenumber')
call s:HL(        'Constant', 'background',   'constant')
call s:HL(         'Special', 'background',    'warning')
call s:HL(      'Identifier', 'background',  'procedure')
call s:HL(       'Statement', 'background',    'keyword')
call s:HL(         'Preproc', 'background',    'warning')
call s:HL(            'Type', 'background',       'type')
call s:HL(      'Underlined', 'background', 'foreground', 'underline')
call s:HL(          'Ignore', 'background', 'background')
call s:HL(           'Error', 'background',      'error')
call s:HL(            'Todo', 'background',    'warning')
call s:HL(          'String', 'background',   'constant')
call s:HL(          'Number', 'background',   'constant')
call s:HL(        'Function', 'background',  'procedure')
call s:HL(     'Conditional', 'background',    'keyword')
call s:HL(             'Tag', 'background',    'warning')
call s:HL(     'SpecialChar', 'background',    'warning')
call s:HL(       'Delimiter', 'background',    'warning')
call s:HL(          'Normal', 'background', 'foreground')

" }}}
" vim: foldmethod=marker
