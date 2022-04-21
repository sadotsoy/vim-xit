" [x]it syntax file
"      Language: XIT
"    Author: Sadot Cortes <sadotsoy>
"    Maintainer: Sadot Cortes <https://github.com/sadotsoy>
" Last Modified: Mon Apr 18 13:19:52 2022
"       Version: 0.1

au BufNewFile,BufRead *.xit set filetype=xit
au BufEnter *.xit :syntax sync fromstart
