"                     _                         ____
"                    (_)____ _ _   __ ____ _   / __/____   _____
"                   / // __ `/| | / // __ `/  / /_ / __ \ / ___/
"                  / // /_/ / | |/ // /_/ /  / __// /_/ // /
"               __/ / \__,_/  |___/ \__,_/  /_/   \____//_/
"              /___/         __
"                 ____   ____/ /__  __ _____ _____ ___   __  __
"                / __ \ / __  // / / // ___// ___// _ \ / / / /
"               / /_/ // /_/ // /_/ /(__  )(__  )/  __// /_/ /
"               \____/ \__,_/ \__, //____//____/ \___/ \__, /
"                            /____/                   /____/
"
"                           Write once, run anywhere
"
" Maintainer: Ludovic Koenig <ludovic.koenig@gmail.com>
" License: MIT
"
" Java Syntax {{{

syntax keyword javaOdysseyThis        this
syntax keyword javaOdysseyLombok      val var
syntax match   javaOdysseyArrow       "->" containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyClass       "\%(\<class\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyInterface   "\%(\<interface\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyEnum        "\%(\<enum\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyArray       "\[\]" contained
syntax match   javaOdysseyGeneric     "[><]" contained
syntax match   javaOdysseySeparator   "," contained
syntax match   javaOdysseyType        "\%(\<\u\w*\>\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=\%(\[\]\)\=\)\%(\s*\<\l\w*\>\)\@=" containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseyArray,javaOdysseySeparator
syntax match   javaOdysseyConstructor "\%(\<\u\w*\>\)\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=\%((\|\[\)"me=e-1 containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseySeparator
syntax match   javaOdysseyMethod      "\<\l\w*\>("me=e-1 containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyCasting     "(\<\u\w*\>\%(<\%(\u\w*\|,\|\s\|<\|>\)\+>\)\=\%(\[\]\)\=)"hs=s+1,he=e-1 containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseyArray,javaOdysseySeparator
syntax match   javaOdysseyImport      "\%(\<import\>\s\+\%(\l\+.\)\+\)\@<=\%(\u\w*\)\%(\s*;\)\@="
syntax match   javaOdysseyExtends     "\%(\<extends\>\s\+\)\@<=\%(\<\u\w*\>\)\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=" contains=javaOdysseyGeneric,javaOdysseySeparator
syntax match   javaOdysseyImplements  "\%(\<implements\>\s\+\)\@<=\%(\<\u\w*\>\)\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=" contains=javaOdysseyGeneric,javaOdysseySeparator

" }}}
" vim: foldmethod=marker
