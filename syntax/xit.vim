" XIT syntax file
"      Language: XIT
"    Author: Sadot Cortes <sadotsoy>
"    Maintainer: Sadot Cortes <https://github.com/sadotsoy>
" Last Modified: Wed Apr 20 13:51:01 2022
" Inspiration: I was inspired by https://github.com/synaptiko/xit.nvim repo
"       Version: 0.1

if exists("b:current_syntax")
  finish
endif

" GROUPS
" Common
hi! xDesc gui=bold cterm=bold
hi! xOpen guifg=#73DAFF ctermfg=117 gui=bold cterm=bold
" Title
hi! xTitle gui=underline,bold cterm=underline,bold
" Checked
hi! xCheckboxChecked guifg=#A9FF6B ctermfg=154 gui=bold cterm=bold
hi! xCheckboxCheckedDesc guifg=#869677 ctermfg=108 gui=italic,underline,strikethrough cterm=italic,strikethrough,underline
" Priority
hi! xPriority guifg=#9D1C1C ctermfg=52 gui=bold cterm=bold
" Obsolete
hi! xObsolete guifg=#636363 ctermfg=8
hi! xObsoleteDesc guifg=#636363 ctermfg=8 gui=italic,underline,strikethrough cterm=italic,underline,strikethrough
" Ongoing
hi! xCheckboxOngoing guifg=#dd77cc ctermfg=170 gui=bold cterm=bold
" Tag
hi! xTag guifg=#667F9B ctermfg=110
" Date
hi! xDueDate guifg=#DDAA66 ctermfg=180 gui=bold cterm=bold
" Invalid
hi! xInvalid guifg=#994433 gui=italic,underline

" Match the titles
syn match xitTitle "\v^[^\[| ].*$"

" Colors links
hi! link xitTitle xTitle

" Open
hi! link xitCheckboxOpen xOpen
hi! link xitCheckboxEmpty xOpen
hi! link xitCheckboxOpenDesc xDesc

" Checked
hi! link xitCheckboxChecked xCheckboxChecked
hi! link xitCheckboxCheckedDesc xCheckboxCheckedDesc

" Priority
hi! link xitCheckboxOpenPriority xPriority
hi! link xitCheckboxCheckedPriority xPriority
hi! link xitCheckboxOngoingPriority xPriority
hi! link xitCheckboxObsoletePriority xPriority

" Obsolete
hi! link xitCheckboxObsolete xObsolete
hi! link xitCheckboxObsoleteDesc xObsoleteDesc

" Ongoing
hi! link xitCheckboxOngoing xCheckboxOngoing
hi! link xitCheckboxOngoingDesc xDesc

" Tags
hi! link xitTag xTag

" Date
hi! link xitDueDate xDueDate

" Invalid
hi! link xitInvalid xInvalid

" Matches a checkbox like "[ ]" or "[]"
syn match xitCheckboxOpen "\v^\[ \]" nextgroup=xitCheckboxOpenSpace
syn match xitCheckboxOpenSpace " " nextgroup=xitCheckboxOpenPriority contained
syn match xitCheckboxOpenPriority "\v(\.*!*)" nextgroup=xitCheckboxOpenDesc contained
syn region xitCheckboxOpenDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" Matches a checkbox like "[x]"
syn match xitCheckboxChecked "\v^\[x\]" nextgroup=xitCheckboxCheckedSpace
syn match xitCheckboxCheckedSpace " " nextgroup=xitCheckboxCheckedPriority contained
syn match xitCheckboxCheckedPriority "\v( *\.*!*)" nextgroup=xitCheckboxCheckedDesc contained
syn region xitCheckboxCheckedDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" Matches a checkbox like "[@]"
syn match xitCheckboxOngoing "\v^\[\@\]" nextgroup=xitCheckboxOngoingSpace
syn match xitCheckboxOngoingSpace " " nextgroup=xitCheckboxOngoingPriority contained
syn match xitCheckboxOngoingPriority "\v(\.*!*)" nextgroup=xitCheckboxOngoingDesc contained
syn region xitCheckboxOngoingDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" This matches a checkbox like "[~]"
syn match xitCheckboxObsolete "\v^\[\~\]" nextgroup=xitCheckboxObsoleteSpace
syn match xitCheckboxObsoleteSpace " " nextgroup=xitCheckboxObsoletePriority contained
syn match xitCheckboxObsoletePriority "\v(\.*!*)" nextgroup=xitCheckboxObsoleteDesc contained
syn region xitCheckboxObsoleteDesc start="." end=/\v(\[|^[a-zA-Z0-9])/me=e-1 contained contains=xitTag,xitDueDate

" Matches a tag with letters, numbers, _, or -
syn match xitTag "\v#[^ \r\:\?\.\!\(\)\,]+" nextgroup=xitValue contained

" Matches a due date like "-> 2022-03-01". It also supports "-> 2022/03/01" as well as quarters/weeks.
syn match xitDueDate "\v-\> \d{4}([-\/]|)([WQ]\d{1,2}|\d{2}[-\/]\d{2}|\d{2})( |)" contained

" Matches a invalid case
syn match xitInvalid "\v\[([^x~@ ]\]| \][^ ]| {2,}\]|[x@~]{2,}|.{2,}\]).*"


" Invalid empty checkboxes
if exists("g:xit_invalid_empty_checkboxes")
  " Match empty checkboxes and invalid it
  syn match xitInvalidEmptyCheckboxes "\v\[\].*"
  " Hilight the invalid empty checkboxes
  hi! link xitInvalidEmptyCheckboxes xInvalid
else
  " Match empty checkboxes and valid it
  syn match xitCheckboxEmpty "\v^\[\]" nextgroup=xitCheckboxOpenSpace
endif

let b:current_syntax = "xit"
