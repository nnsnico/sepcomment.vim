" Version: 0.0.1
" Author: nnsnico <yuji.jampan.blue@gmail.com>
" License: MIT

let s:save_cpo = &cpo
set cpo&vim

let g:sepcomment#margin = 1
let g:sepcomment#length = 80
let g:sepcomment#decoration = '-'

" separated comment
function! sepcomment#sepcomment(line1, ...) abort
    if empty(a:000)
        let line = s:get_selected_words(a:line1)
    else
        let line = join(a:000, "\n")
    endif

    let result = s:get_separated_comment(line, g:sepcomment#margin, g:sepcomment#decoration, g:sepcomment#length)

    call setline('.', result)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

function! s:get_selected_words(line) abort
    let regname = '"'
    let reg = getreg(regname)
    let regtype = getregtype(regname)
    let ve = &virtualedit

    set virtualedit=

    silent execute 'normal! gv"' . regname . 'y'
    let lines = getreg(regname, 1, 1)

    call setreg(regname, reg, regtype)
    let &virtualedit = ve

    return join(lines, a:line)
endfunction

function! s:get_separated_comment(line, margin, decoration, length) abort
    let separate_cnt = ((a:length - (a:margin * 2) - len(a:line)) / len(a:decoration)) / 2
    let space = repeat(' ', a:margin)
    let separate = repeat(a:decoration, separate_cnt)
    let result = separate . space . a:line . space . separate

    return result
endfunction

" vim:set ts=4 sw=4 sts=4 et :
