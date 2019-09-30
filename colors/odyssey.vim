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
" Version: 0.6.0
" Since: 0.1.0
" License: MIT
"
" Prelude {{{

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
" Color Helpers {{{

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

let s:colors.error      = s:colorize( 10, 45, 70)
let s:colors.warning    = s:colorize( 40, 45, 70)
let s:colors.type       = s:colorize( 70, 45, 70)
let s:colors.procedure  = s:colorize(140, 45, 70)
let s:colors.keyword    = s:colorize(180, 45, 70)
let s:colors.constant   = s:colorize(210, 45, 70)

" }}}
" Attributes {{{

let s:attributes = {}

let s:attributes[  'reverse'] = { 'cterm': 'reverse'  , 'gui': 'reverse'   }
let s:attributes[     'bold'] = { 'cterm': 'bold'     , 'gui': 'bold'      }
let s:attributes['underline'] = { 'cterm': 'underline', 'gui': 'underline' }
let s:attributes[   'italic'] = { 'cterm': 'italic'   , 'gui': 'italic'    }

" }}}
" Highlight Helpers {{{

function! s:h(group, bg, fg, attr)
  let l:hi = 'highlight! ' . a:group . ' '

  if a:bg != 'none'
    let l:bg = get(s:colors, a:bg)
    let l:hi .= 'guibg=#'. l:bg['gui'] . ' ' . 'ctermbg=' . l:bg['cterm']
  endif

  if a:fg != 'none'
    let l:fg = get(s:colors, a:fg)
    let l:hi .= ' guifg=#' . l:fg['gui'] . ' ' . 'ctermfg=' . l:fg['cterm']
  endif

  if a:attr != 'none'
    let l:attr = get(s:attributes, a:attr)
    let l:hi .= ' gui=' . l:attr['gui'] . ' ' . 'cterm=' . l:attr['cterm']
  elseif a:attr == 'none'
    let l:hi .= ' gui=none cterm=none'
  endif

  execute l:hi
endfunction

function! s:l(origin, target)
  let l:hi = 'highlight! link ' . a:origin . ' ' . a:target
  execute l:hi
endfunction

" }}}
" Interface Highlights {{{

call s:h(      'SpecialKey', 'background',    'warning',      'none')
call s:h(     'EndOfBuffer', 'background', 'linenumber',      'none')
call s:h(         'NonText', 'background', 'linenumber',      'none')
call s:h(       'Directory', 'background', 'foreground',      'none')
call s:h(        'ErrorMsg', 'background',      'error',      'bold')
call s:h(         'MoreMsg', 'background',    'warning',      'none')
call s:h(         'ModeMsg', 'background',    'warning',      'none')
call s:h(       'IncSearch', 'background', 'foreground',   'reverse')
call s:h(          'Search', 'background', 'linenumber',   'reverse')
call s:h(          'LineNr', 'background', 'linenumber',      'none')
call s:h(    'CursorLineNr', 'cursorline', 'foreground',      'none')
call s:h(        'Question', 'background',    'warning',      'none')
call s:h(      'StatusLine', 'cursorline', 'foreground',      'none')
call s:h(    'StatusLineNC', 'beyondback', 'linenumber',      'none')
call s:h(       'VertSplit', 'beyondback', 'beyondback',      'none')
call s:h(           'Title', 'background',  'procedure',      'none')
call s:h(          'Visual', 'background', 'foreground',   'reverse')
call s:h(       'VisualNOS', 'background', 'foreground',   'reverse')
call s:h(      'WarningMsg', 'background',    'warning',      'bold')
call s:h(        'WildMenu', 'cursorline',    'warning',      'none')
call s:h(          'Folded', 'foldedline', 'linenumber',      'none')
call s:h(      'FoldColumn', 'foldedline', 'linenumber',      'none')
call s:h(         'DiffAdd',  'procedure', 'background',      'none')
call s:h(      'DiffChange',    'warning', 'background',      'none')
call s:h(      'DiffDelete',      'error', 'background',      'none')
call s:h(        'DiffText',      'error', 'background',      'none')
call s:h(      'SignColumn', 'background',      'error',      'none')
call s:h(         'Conceal', 'background',    'keyword',      'none')
call s:h(        'SpellBad', 'background',      'error', 'underline')
call s:h(        'SpellCap', 'background',    'warning', 'underline')
call s:h(       'SpellRare', 'background',   'constant', 'underline')
call s:h(      'SpellLocal', 'background',    'keyword', 'underline')
call s:h(           'Pmenu', 'foldedline', 'linenumber',      'none')
call s:h(        'PmenuSel', 'background', 'foreground',   'reverse')
call s:h(       'PmenuSbar', 'foldedline', 'foldedline',      'none')
call s:h(      'PmenuThumb', 'linenumber', 'linenumber',      'none')
call s:h(         'TabLine', 'background', 'linenumber',      'none')
call s:h(      'TabLineSel', 'background', 'foreground',      'none')
call s:h(     'TabLineFill', 'beyondback', 'linenumber',      'none')
call s:h(    'CursorColumn', 'cursorline', 'foreground',      'none')
call s:h(      'CursorLine', 'cursorline',       'none',      'none')
call s:h(     'ColorColumn', 'foldedline',       'none',      'none')
call s:h(  'StatusLineTerm', 'cursorline', 'foreground',      'none')
call s:h('StatusLineTermNC', 'beyondback', 'linenumber',      'none')
call s:h(          'Cursor', 'background', 'foreground',   'reverse')
call s:h(         'lCursor', 'background', 'foreground',   'reverse')
call s:h(      'MatchParen', 'background',    'warning', 'underline')
call s:h(     'ToolbarLine', 'linenumber', 'linenumber',      'none')
call s:h(   'ToolbarButton', 'background', 'linenumber',   'reverse')
call s:h(          'Normal', 'background', 'foreground',      'none')

" }}}
" Default Highlights {{{

call s:h(     'Comment', 'background', 'linenumber',      'none')
call s:h(    'Constant', 'background',   'constant',      'none')
call s:h(  'Identifier', 'background',  'procedure',      'none')
call s:h(   'Statement', 'background',    'keyword',      'none')
call s:h(     'Preproc', 'background',    'warning',      'none')
call s:h(        'Type', 'background',       'type',      'none')
call s:l('StorageClass',  'Statement')
call s:l(   'Structure',  'Statement')
call s:l(     'Typedef',  'Statement')
call s:h(     'Special', 'background',    'warning',      'none')
call s:h(  'Underlined', 'background', 'foreground', 'underline')
call s:h(      'Ignore', 'background', 'background',      'none')
call s:h(       'Error', 'background',      'error',      'bold')
call s:h(        'Todo', 'background',    'warning',      'bold')

" }}}
" Go Highlights {{{

call s:l(   'goOdysseyFunction',  'Function')
call s:l('goOdysseyFuncKeyword', 'Statement')

" }}}
" Java Highlights {{{

call s:h(            'javaAnnotation',      'background', 'warning', 'italic')
call s:l(              'javaExternal',       'Statement')
call s:l(               'javaTypeDef', 'javaOdysseyThis')
call s:l(          'javaOdysseyClass',            'Type')
call s:l(    'javaOdysseyDotOperator',            'Type')
call s:l(      'javaOdysseyInterface',            'Type')
call s:l(           'javaOdysseyEnum',            'Type')
call s:l(        'javaOdysseyCasting',            'Type')
call s:l(       'javaOdysseyGetClass',            'Type')
call s:l('javaOdysseyGetStaticMethod',        'Function')
call s:l( 'javaOdysseyGetStaticClass',            'Type')
call s:l(        'javaOdysseyExtends',            'Type')
call s:l(     'javaOdysseyImplements',            'Type')
call s:l(          'javaOdysseyArray',          'Normal')
call s:l(        'javaOdysseyGeneric',          'Normal')
call s:l(           'javaOdysseyType',            'Type')
call s:l(    'javaOdysseyConstructor',            'Type')
call s:l(         'javaOdysseyMethod',        'Function')
call s:l(           'javaOdysseyThis',         'Special')
call s:l(          'javaOdysseyArrow',        'Operator')
call s:l(         'javaOdysseyLombok',       'Statement')
call s:l(      'javaOdysseyEnumValue',            'Type')
call s:l(      'javaOdysseyMethodRef',        'Function')
call s:l( 'javaOdysseyClassMethodRef',            'Type')

if exists('g:odyssey_java_javadoc') && g:odyssey_java_javadoc != 0
  if exists('g:java_ignore_javadoc')
    unlet g:java_ignore_javadoc
  end
else
  let g:java_ignore_javadoc = 1
endif

" }}}
" JavaScript Highlights {{{

call s:l(       'javaScriptFunction', 'Statement')
call s:l(         'javaScriptBraces',    'Normal')
call s:l(     'javaScriptIdentifier', 'Statement')
call s:l( 'javaScriptOdysseyKeyword',   'Keyword')
call s:l('javaScriptOdysseyFunction',  'Function')
call s:l('javaScriptOdysseyFatArrow', 'Statement')

" }}}
" Python Highlights {{{

call s:h(      'pythonDecorator', 'background', 'warning', 'italic')
call s:h(  'pythonDecoratorName', 'background', 'warning', 'italic')
call s:l(    'pythonOdysseyNone',   'Constant')
call s:l( 'pythonOdysseyBoolean',   'Constant')
call s:l( 'pythonOdysseyBuiltin',       'Type')
call s:l(   'pythonOdysseyPrint',   'Function')
call s:l(   'pythonOdysseyArrow',    'Keyword')
call s:l(        'pythonInclude',  'Statement')
call s:l('pythonOdysseyFunction',   'Function')
call s:l(    'pythonOdysseySelf',    'Special')
call s:l(    'pythonOdysseyType',       'Type')
call s:l(   'pythonOdysseyClass',       'Type')

let g:python_no_builtin_highlight = 1

" }}}
" Ruby Highlights {{{

call s:l(                 'rubyClass',    'Statement')
call s:h(         'rubyClassVariable',   'background', 'warning', 'italic')
call s:l(                'rubyDefine',    'Statement')
call s:l(               'rubyInclude',    'Statement')
call s:h(      'rubyInstanceVariable',   'background', 'warning', 'italic')
call s:l('rubyInterpolationDelimiter',     'Function')
call s:l(       'rubyStringDelimiter',       'Normal')
call s:l(                'rubyAccess',    'Statement')
call s:l(             'rubyAttribute',    'Statement')
call s:l(        'rubyPseudoVariable',      'Special')
call s:l(                'rubySymbol', 'rubyConstant')
call s:h(        'rubyBlockParameter',   'background', 'procedure', 'italic')
call s:l(            'rubyOdysseyNil',       'Normal')
call s:l(               'rubyBoolean',       'Normal')
call s:l(                 'rubyFloat',       'Normal')
call s:l(               'rubyInteger',       'Normal')

" }}}
" Rust Highlights {{{

call s:l(       'rustLifetime', 'Constant')
call s:l(   'rustQuestionMark', 'Operator')
call s:l('rustOdysseyFunction', 'Function')
call s:l(    'rustOdysseyType',     'Type')

" }}}
" vim: foldmethod=marker textwidth=79 colorcolumn=+1
