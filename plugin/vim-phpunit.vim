" ------------------------------------------------------------------------------
" Vim PHPUnit                                                                {{{
"
" Author: Walter Dal Mut <walter.dalmut@gmail.com>
"
" Description:
" Run PHPUnit from within Vim. This plugin is based on the joonty's
" vim-phpunitqf but i have removed the quickfix because i don't want to use it.
"
" Requires: Vim 6.0 or newer
"
" Install:
" Put this file and the python file in the vim plugins directory (~/.vim/plugin)
" to load it automatically, or load it manually with :so sauce.vim.
"
" License: MIT
"
" }}}
" ------------------------------------------------------------------------------

" PHPUnit command
if !exists("g:phpunit_cmd")
    if filereadable('./bin/phpunit')
        let g:phpunit_cmd='./bin/phpunit'
    elseif filereadable('./vendor/bin/phpunit')
        let g:phpunit_cmd='./vendor/bin/phpunit'
    else
        let g:phpunit_cmd='phpunit'
    endif
endif

" Static arguments passed to the PHPUnit command
if !exists("g:phpunit_args")
    let g:phpunit_args=''
endif

" Static arguments passed to the PHPUnit command after the dynamic argument
if !exists("g:phpunit_args_append")
    let g:phpunit_args_append=''
endif

" Location of temporary error log
if !exists("g:phpunit_tmpfile")
    let g:phpunit_tmpfile="/tmp/vim_phpunit.out"
endif

" Debug enabled
if !exists("g:phpunit_debug")
    let g:phpunit_debug=0
endif

" Handle the quickfix feature
if !exists("g:phpunit_quickfix")
    let g:phpunit_quickfix=1
endif

if !exists("g:phpunit_callback")
    let g:phpunit_callback = ""
endif

command! -nargs=* Test call s:RunPHPUnitTests(<q-args>)
command! TestOutput call s:OpenPHPUnitOutput()

" Run PHPUnit command and python parser
function! s:RunPHPUnitTests(arg)
    let s:args = a:arg
    if len(g:phpunit_callback) > 0
        exe "let s:args = ".g:phpunit_callback."('".s:args."')"
    endif
    " Truncate current log file
    call system("> ".g:phpunit_tmpfile)
    exe "!".g:phpunit_cmd." ".g:phpunit_args." ".s:args." ".g:phpunit_args_append." 2>&1 | tee ".g:phpunit_tmpfile
endfunction

" Open the test output
function! s:OpenPHPUnitOutput()
    exe "sp ".g:phpunit_tmpfile
endfunction
