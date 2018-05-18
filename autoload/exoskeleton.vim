function! exoskeleton#is_valid_directory(directory)
    return isdirectory(a:directory)
endfunction

function! exoskeleton#get_contents_for_template(template)
    return readfile(a:template)
endfunction

function! exoskeleton#get_filetype_for_template(template)
    return fnamemodify(a:template, ':e')
endfunction

function! exoskeleton#get_placeholder_contents()
endfunction

" Returns the evaluated string
" i.e.
"   evaluate_contents("This year is {{strftime("%Y")}}")
" Returns
"   This year is 2018
" Note that it takes a single line of a file, not the entire file.
function! exoskeleton#evaluate_placeholders(contents)
    "Get just the command to evaluate including {{'s"
    let l:command = matchstr(a:contents, '{{.*}}')

    "If there's nothing to evaluate, just return the string
    if l:command ==# ""
        return a:contents
    endif

    let l:command_no_left_braces = substitute(l:command, '{{', '', 'g')
    let l:command_no_braces = substitute(l:command_no_left_braces, '}}', '', 'g')
    let l:command_result = eval(l:command_no_braces)

    return substitute(a:contents, '{{.*}}', l:command_result, '')
endfunction

function! exoskeleton#insert_content(template)
    let l:contents = exoskeleton#get_contents_for_template(a:template)

    "A list of each line after it's been evaluated
    let l:end_result = []

    for content in l:contents
        call add(l:end_result, exoskeleton#evaluate_placeholders(content))
    endfor

    let l:string_end_result = join(l:end_result, "\n")

    "scrub the placeholders and put the real one in."
    normal! ggdG
    put! =l:string_end_result
endfunction
