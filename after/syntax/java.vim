"                      _                         ____
"                     (_)____ _ _   __ ____ _   / __/____   _____
"                    / // __ `/| | / // __ `/  / /_ / __ \ / ___/
"                   / // /_/ / | |/ // /_/ /  / __// /_/ // /
"                __/ / \__,_/  |___/ \__,_/  /_/   \____//_/
"               /___/         __
"                 ____   ____/ /__  __ _____ _____ ___   __  __
"                / __ \ / __  // / / // ___// ___// _ \ / / / /
"               / /_/ // /_/ // /_/ /(__  )(__  )/  __// /_/ /
"               \____/ \__,_/ \__, //____//____/ \___/ \__, /
"                            /____/                   /____/
"
" Java Syntax {{{
syntax keyword javaOdysseyThis        this
syntax match   javaOdysseyClass       "\%(\<class\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyInterface   "\%(\<interface\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyArray       "\[\]" contained
syntax match   javaOdysseyGeneric     "[><]" contained
syntax match   javaOdysseySeparator   "," contained
syntax match   javaOdysseyType        "\%(\<\u\w*\>\%(<\%(\w\|,\|\s\|<\|>\)\+>\)\=\%(\[\]\)\=\)\%(\s*\<\l\w*\>\)\@=" containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseyArray,javaOdysseySeparator
syntax match   javaOdysseyConstructor "\%(\<\u\w*\>\)\%(<\%(\w\|,\|\s\|<\|>\)\+>\)\=\%((\|\[\)"me=e-1 containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseySeparator
syntax match   javaOdysseyMethod      "\<\l\w*\>("me=e-1 containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyCasting     "(\<\u\w*\>\%(<\%(\w\|,\|\s\|<\|>\)\+>\)\=\%(\[\]\)\=)"hs=s+1,he=e-1 containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseyArray,javaOdysseySeparator
" }}}
" vim: foldmethod=marker
