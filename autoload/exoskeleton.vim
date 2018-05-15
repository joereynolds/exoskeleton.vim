let g:exoskeleton_template_directory = get(g:, 'exoskeleton_template_directory', '~/.vim/exoskeleton/places/')

function! exoskeleton#is_valid_directory(directory)
    return isdirectory(a:directory)
endfunction

function! exoskeleton#get_contents_for_template(template)
endfunction

function! exoskeleton#get_filetype_for_template(template)
endfunction

function! exoskeleton#get_placeholder_contents()
endfunction

function! exoskeleton#evaluate_contents(contents)
    let l:contents = substitute(a:contents, '{{', '', 'g')
    let l:cleaned_contents = substitute(l:contents, '}}', '', 'g')
    put =eval(l:cleaned_contents)
endfunction

augroup exoskeleton
augroup END
