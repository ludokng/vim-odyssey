"                          __   __                     ____
"           ____   __  __ / /_ / /_   ____   ____     / __/____   _____
"          / __ \ / / / // __// __ \ / __ \ / __ \   / /_ / __ \ / ___/
"         / /_/ // /_/ // /_ / / / // /_/ // / / /  / __// /_/ // /
"        / .___/ \__, / \__//_/ /_/ \____//_/ /_/  /_/   \____//_/
"       /_/     /____/        __
"                 ____   ____/ /__  __ _____ _____ ___   __  __
"                / __ \ / __  // / / // ___// ___// _ \ / / / /
"               / /_/ // /_/ // /_/ /(__  )(__  )/  __// /_/ /
"               \____/ \__,_/ \__, //____//____/ \___/ \__, /
"                            /____/                   /____/
"
" Note: This script aims at providing some additional syntax groups for Python.
" It may also reuse standard group to create them. It mostly introduces
" supports for:
"   - Type and Classes,
"   - Functions.
"
" Maintainer: Ludovic Koenig <ludovic.koenig@gmail.com>
" Version: 0.6.0
" Since: 0.5.0
" License: MIT
"
" Python Syntax {{{

syntax keyword pythonOdysseyNone     None
syntax keyword pythonOdysseyBoolean  True False
syntax keyword pythonOdysseyBuiltin  int float bool str bytes
syntax keyword pythonOdysseySelf     self
syntax keyword pythonOdysseyPrint    print
syntax match   pythonOdysseyArrow    '->'
syntax match   pythonOdysseyFunction '\<\l\w*\>('me=e-1
syntax match   pythonOdysseyType     '\<\u\w*\>'
syntax keyword pythonStatement       class nextgroup=pythonOdysseyClass skipwhite
syntax match   pythonOdysseyClass    "\<\u\w*\>"

" }}}
" vim: foldmethod=marker textwidth=79 colorcolumn=+1
