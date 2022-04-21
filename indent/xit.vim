" [x]it indent file
" Language: XIT
" Author: Sadot Cortes <sadotsoy>
" Maintainer: Sadot Cortes <https://github.com/sadotsoy>
" Last Modified: Wed Apr 20 2022
" Version: 0.1.1

" Only load this indent file when no other was loaded, and flag the fact that we've loaded this script.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1


setlocal indentkeys=o,O
setlocal indentexpr=GetXitIndent()

let b:undo_indent = 'setl ai< inde< indk<'

" " Only define the function once.
if exists("*GetXitIndent")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

function! GetXitIndent()
  let line = getline(v:lnum)
  let prevline = getline(v:lnum - 1)
  let colPos = match(getline(v:lnum - 1), '[^ \[\]@~x]')
  if prevline =~ '[^ ]'
    return colPos
  else
    return 0
  endif
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save
