let g:exoskeleton_start_delimiter = get(g:, 'exoskeleton_start_delimiter', '{{')
let g:exoskeleton_end_delimiter = get(g:, 'exoskeleton_end_delimiter', '}}')
let g:exoskeleton_base_directory = get(g:, 'exoskeleton_base_directory', expand('~/.vim/exoskeleton/'))
let g:exoskeleton_ft_directory = g:exoskeleton_base_directory . 'ft/'
let g:exoskeleton_place_directory = g:exoskeleton_base_directory . 'place/'

augroup exoskeleton_ft
    "One autocmd per file extension in the ft directory.
    "i.e.
    "    ~/.vim/exoskeleton/ft/skel.php
    "    ~/.vim/exoskeleton/ft/skel.vim
    "    etc...
    for filepath in glob(g:exoskeleton_ft_directory . '*', '', 1)
        let filename = fnamemodify(filepath, ':t')
        let extension = fnamemodify(filepath, ':e')
        execute 'autocmd BufNewFile *.' . extension . ' :call exoskeleton#insert_content("' . g:exoskeleton_ft_directory . filename . '")'
    endfor
augroup END

augroup exoskeleton_place
    "Snippets here are a mapping from one directory to another.
    "
    "exoskeletons here are in the format of
    "   ~/.vim/exoskeleton/place/a-direct-mapping-to-a-directory/file.php
    "
    "In the above, any php filetypes within a/direct/mapping/to/a/directory
    "will have that template applied
    for filepath in glob(g:exoskeleton_place_directory . '*', '', 1)
        let directory = fnamemodify(filepath, ':t')
        let mapped_directory = exoskeleton#map_directory(directory)
        let template_path = g:exoskeleton_place_directory . directory .  '/exoskeleton'
        execute 'autocmd BufNewFile ' . '/' . mapped_directory . '/*' . ' :call exoskeleton#insert_content("' . template_path . '")'
    endfor
augroup END
