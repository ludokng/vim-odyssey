"
" Maintainer: Ludovic Koenig <ludovic.koenig@gmail.com>
" Version: 0.5.0
" Since: 0.5.0
" License: MIT
"
" Python Syntax {{{

syntax keyword pythonOdysseySelf     self
syntax match   pythonOdysseyFunction '\<\l\w*\>('me=e-1
syntax match   pythonOdysseyType     '\<\u\w*\>'
syntax keyword pythonStatement       class nextgroup=pythonOdysseyClass skipwhite
syntax match   pythonOdysseyClass    "\<\u\w*\>"

" }}}
" vim: foldmethod=marker
