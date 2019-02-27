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
" Author: Ludovic Koenig <ludovic.koenig@gmail.com>
" License: MIT
"
" Bootstrap {{{
" }}}
" Utilities {{{
function! s:hsv2hex(hue, saturation, value)
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

  let l:f = "%02x"
  return printf(l:f, l:l[0]) . printf(l:f, l:l[0]) . printf(l:f, l:l[0])
endfunction

function! s:HL(group, bg, ...)
  let cbg = get(s:colors, a:bg)
  let histring = 'highlight ' . a:group . ' ' . 'guibg=#'. cbg

  if a:0 > 0
    let cfg = get(s:colors, a:1)
    let histring .= ' guifg=#'. cfg
  endif

  let histring .= ' cterm=none'
  execute histring
endfunction
" }}}
" Colors {{{
" }}}
" Highlight Groups {{{
" }}}
" vim: foldmethod=marker
