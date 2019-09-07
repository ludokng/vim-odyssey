"                                       __     ____
"                   _____ __  __ _____ / /_   / __/____   _____
"                  / ___// / / // ___// __/  / /_ / __ \ / ___/
"                 / /   / /_/ /(__  )/ /_   / __// /_/ // /
"                /_/    \__,_//____/ \__/  /_/   \____//_/
"                             __
"                 ____   ____/ /__  __ _____ _____ ___   __  __
"                / __ \ / __  // / / // ___// ___// _ \ / / / /
"               / /_/ // /_/ // /_/ /(__  )(__  )/  __// /_/ /
"               \____/ \__,_/ \__, //____//____/ \___/ \__, /
"                            /____/                   /____/
"
" Note: This script aims at providing additional syntax for Rust. It only
" declares them or clears them. To be more precise, it clears some syntax
" because Odyssey is only a 12-colors scheme which implies that only some
" particular language items must be highlighted. Plus it provides more support
" for types and functions.
"
" Maintainer: Ludovic Koenig <ludovic.koenig@gmail.com>
" Version: 0.5.0
" Since: 0.5.0
" Licence: MIT
"
" Rust Syntax {{{

syntax clear rustModPath
syntax clear rustModPathSep
syntax clear rustTrait
syntax clear rustIdentifier
syntax clear rustFuncName
syntax clear rustFuncCall
syntax clear rustEnum
syntax clear rustEnumVariant
syntax clear rustOperator

syntax match rustOdysseyFunction "\<\l\w*\>\%(\%(<\%(\w\|,\|'\|\s\)*>\)\=(\)\@="
syntax match rustOdysseyType     "\<\u\w*\>"

" }}}
" vim: foldmethod=marker
