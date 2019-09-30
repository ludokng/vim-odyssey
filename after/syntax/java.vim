"                     _                         ____
"                    (_)____ _ _   __ ____ _   / __/____   _____
"                   / // __ `/| | / // __ `/  / /_ / __ \ / ___/
"                  / // /_/ / | |/ // /_/ /  / __// /_/ // /
"               __/ / \__,_/  |___/ \__,_/  /_/   \____//_/
"              /___/          __
"                 ____   ____/ /__  __ _____ _____ ___   __  __
"                / __ \ / __  // / / // ___// ___// _ \ / / / /
"               / /_/ // /_/ // /_/ /(__  )(__  )/  __// /_/ /
"               \____/ \__,_/ \__, //____//____/ \___/ \__, /
"                            /____/                   /____/
"
" Note: This script aims at providing some new syntax element for Java. It
" therefore declares syntax elements for:
"   - Type and class names,
"   - Enum values,
"   - Import statements ('import' and 'import static').
"
" Maintainer: Ludovic Koenig <ludovic.koenig@gmail.com>
" Version: 0.6.0
" Since: 0.4.0
" License: MIT
"
" Java Syntax {{{

syntax keyword javaOdysseyThis            this
syntax keyword javaOdysseyLombok          val var
syntax match   javaOdysseyArrow           "->" containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyClass           "\%(\<class\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyInterface       "\%(\<interface\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyEnum            "\%(\<enum\>\s\+\)\@<=\<\u\w*\>"
syntax match   javaOdysseyArray           "\[\]" contained
syntax match   javaOdysseyGeneric         "[><]" contained
syntax match   javaOdysseySeparator       "," contained
syntax match   javaOdysseyType            "\%(\<\u\w*\>\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=\%(\[\]\)\=\)\%(\s*\<\l\w*\>\)\@=" containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseyArray,javaOdysseySeparator
syntax match   javaOdysseyConstructor     "\%(\<\u\w*\>\)\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=\%((\|\[\)"me=e-1 containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseySeparator
syntax match   javaOdysseyMethod          "\<\l\w*\>("me=e-1 containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyDotOperator     "\<\u\w*\>\."me=e-1 containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyCasting         "(\<\u\w*\>\%(<\%(\u\w*\|,\|\s\|<\|>\)\+>\)\=\%(\[\]\)\=)"hs=s+1,he=e-1 containedin=javaParenT,javaParenT1,javaParenT2 contains=javaOdysseyGeneric,javaOdysseyArray,javaOdysseySeparator
syntax match   javaOdysseyGetClass        "\%(\<import\>\s\+\%(\w\+\.\)\+\)\@<=\%(\u\w*\)\%(\s*;\)\@="
syntax match   javaOdysseyGetStaticMethod "\%(\<import\>\s\+\<static\>\s\+\%(\w\+\.\)\+\)\@<=\%(\l\w*\)\%(\s*;\)\@="
syntax match   javaOdysseyGetStaticClass  "\%(\<import\>\s\+\<static\>\s\+\%(\w\+\.\)\+\)\@<=\%(\u\w*\)\%(\s*;\)\@="
syntax match   javaOdysseyExtends         "\%(\<extends\>\s\+\)\@<=\%(\<\u\w*\>\)\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=" contains=javaOdysseyGeneric,javaOdysseySeparator
syntax match   javaOdysseyImplements      "\%(\<implements\>\s\+\)\@<=\%(\<\u\w*\>\)\%(<\%(\u\w*\|,\|\s\|<\|>\)*>\)\=" contains=javaOdysseyGeneric,javaOdysseySeparator
syntax match   javaOdysseyMethodRef       "::\<\l\w*\>"ms=s+2 containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyClassMethodRef  "\<\u\w*\>::"me=e-2 containedin=javaParenT,javaParenT1,javaParenT2
syntax match   javaOdysseyEnumValue       "\<\u\u*\>" containedin=javaParenT,javaParenT1,javaParenT2
syntax region  javaOdysseyComment         start=+/\*+ end=+\*/+ transparent fold keepend
syntax region  javaOdysseyImport          start=/\%(^import\)\@<=\s.\+;/ end=+^\s*$+ transparent fold keepend
syntax region  javaOdysseyImportStatic    start=/\%(^import static\)\@<=\s.\+;/ end=+^\s*$+ transparent fold keepend
syntax cluster javaTop                    add=javaOdysseyLombok

" }}}
" vim: foldmethod=marker textwidth=79 colorcolumn=+1
