" Version: 0.0.1
" Author: nnsnico <yuji.jampan.blue@gmail.com>
" License: MIT

let s:save_cpo = &cpo
set cpo&vim

" ----------------------------- separated comment ------------------------------
function! sepcomment#sepcomment(line1, ...) abort
    let margin = get(g:, "sepcomment#margin", 1)
    let length = get(g:, "sepcomment#length", 80)
    let decoration = get(g:, "sepcomment#decoration", '-')

    if empty(a:000)
        let line = s:get_selected_words(a:line1)
    else
        let line = join(a:000, "\n")
    endif

    let result = s:get_separated_comment(line, margin, decoration, length)

    call setline('.', result)
endfunction

" --------------------------- collect word on a line ---------------------------
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

" ------------------ replace word to new word with decoration ------------------
function! s:get_separated_comment(line, margin, decoration, length) abort
    let char_count = strlen(a:line)
    let separate_cnt = ((a:length - (a:margin * 2) - char_count) / len(a:decoration)) / 2
    let space = repeat(' ', a:margin)
    let separate = repeat(a:decoration, separate_cnt)
    let result = separate . space . a:line . space . separate

    return result
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ts=4 sw=4 sts=4 et :
