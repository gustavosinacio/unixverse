scriptencoding utf-8

" My vim rc
" adds defaults to my vim

if filereadable(expand('$VIMRUNTIME/defaults.vim'))
    unlet! g:skip_defaults_vim
    source $VIMRUNTIME/defaults.vim
endif


set number

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
