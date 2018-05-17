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
function! exoskeleton#evaluate_placeholders(contents)
    "Get just the command to evaluate including {{'s"
    let l:command = matchstr(a:contents, '{{.*}}')
    let l:command_no_left_braces = substitute(l:command, '{{', '', 'g')
    let l:command_no_braces = substitute(l:command_no_left_braces, '}}', '', 'g')

    let l:command_result = eval(l:command_no_braces)

    return substitute(a:contents, '{{.*}}', l:command_result, '')
endfunction

function! exoskeleton#insert_content(contents)
    put! =eval(exoskeleton#evaluate_placeholders(a:contents))
endfunction

"get_contents_for_template > evaluate_placeholder > insert_content"
