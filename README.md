# SepComment.vim

Beautiful comment create plugin

## Installation

Add using the plugin manager

### dein.vim

```
[[plugins]]
repo = 'nnsnico/sepcomment.vim'
```

## Usage

Specifying words on command argument:

```
:SepComment No Name

          ↓

----------------------------------- No Name -----------------------------------
```

or select by visual mode

```
:'<,'>No Name Style

          ↓

-------------------------------- No Name Style --------------------------------
```

Use `g:sepcomment#decoration` to make more beautiful separator

```
" default is '-'
let g:sepcomment#decoration = '-#'

-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-# Decoration -#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
```

And Use `g:sepcomment#margin` and `g:sepcomment#length` to adjustment separator

```
" default is 1
let g:sepcomment#margin = 4

            ↓

--------------------------------     MARGIN     --------------------------------

" default is 80
let g:sepcomment#length = 50 

          ↓

--------------------- LENGTH ---------------------
```
