" Version: 0.0.1
" Author: nnsnico <yuji.jampan.blue@gmail.com>
" License: MIT

let s:save_cpo = &cpo
set cpo&vim

scriptencoding utf-8 

if exists('g:loaded_sepcomment') || has('nvim')
    finish
endif

let g:loaded_sepcomment = 1

command! -range -nargs=* SepComment call sepcomment#sepcomment(<line1>, <f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ts=4 sw=4 sts=4 et :
