let s:dir_name = $VIM_PATH . '/autoload/'
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

command! Cpp call vimForComp#CreateTemplate_for_cpp()
command! C call vimForComp#CreateTemplate_for_c()
