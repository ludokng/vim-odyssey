"               _                                         _         __
"              (_)____ _ _   __ ____ _ _____ _____ _____ (_)____   / /_
"             / // __ `/| | / // __ `// ___// ___// ___// // __ \ / __/
"            / // /_/ / | |/ // /_/ /(__  )/ /__ / /   / // /_/ // /_
"         __/ / \__,_/  |___/ \__,_//____/ \___//_/   /_// .___/ \__/
"        /___/                        ____              /_/
"                                    / __/____   _____
"                                   / /_ / __ \ / ___/
"                                  / __// /_/ // /
"                             __  /_/   \____//_/
"                 ____   ____/ /__  __ _____ _____ ___   __  __
"                / __ \ / __  // / / // ___// ___// _ \ / / / /
"               / /_/ // /_/ // /_/ /(__  )(__  )/  __// /_/ /
"               \____/ \__,_/ \__, //____//____/ \___/ \__, /
"                            /____/                   /____/
"
" Note: This script defines syntax groups that deal with function calls and
" lambda definitions.
"
" Maintainer: Ludovic Koenig <ludovic.koenig@gmail.com>
" Version: 0.7.0
" Since: 0.7.0
" License: MIT
"
" JavaScript Syntax {{{

syntax keyword javaScriptOdysseyKeyword  of yield async await
syntax match   javaScriptOdysseyFatArrow "=>"
syntax match   javaScriptOdysseyFunction "\<\l\w*\>("me=e-1

" }}}
" vim: foldmethod=marker textwidth=79 colorcolumn=+1
