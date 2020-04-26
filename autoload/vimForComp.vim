let s:dir_name = $VIM_P_PATH . '/autoload/'
function! vimForComp#CreateTemplate_for_cpp ()
    %delete
    for line in readfile(s:dir_name . 'source/template.cpp')
        call append(line("$"), line)
    endfor
endfunction

function! vimForComp#CreateTemplate_for_c ()
    %delete
    for line in readfile(s:dir_name . 'source/template.c')
        call append(line("$"), line)
    endfor
endfunction

function! vimForComp#CreateTemplate_for_rs ()
    %delete
    for line in readfile(s:dir_name . 'source/template.rs')
        call append(line("$"), line)
    endfor
endfunction

function! vimForComp#CreateTemplate_for_prime ()
    %delete
    for line in readfile(s:dir_name . 'source/prime.cpp')
        call append(line("$"), line)
    endfor
endfunction

function! vimForComp#InsertTemplate_for_mod ()
    for line in readfile(s:dir_name . 'source/mod.rs')
        call append(line("$"), line)
    endfor
endfunction



command! Cpp call vimForComp#CreateTemplate_for_cpp()
command! C call vimForComp#CreateTemplate_for_c()
command! Rs call vimForComp#CreateTemplate_for_rs()
command! Prime call vimForComp#CreateTemplate_for_prime()
command! Mod call vimForComp#InsertTemplate_for_mod()
