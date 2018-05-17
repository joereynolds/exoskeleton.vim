let g:exoskeleton_start_delimiter = '{{'
let g:exoskeleton_end_delimiter = '}}'
let g:exoskeleton_base_directory = get(g:, 'exoskeleton_base_directory', '~/.vim/exoskeleton/')
let g:exoskeleton_ft_directory = g:exoskeleton_base_directory . 'ft/'
let g:exoskeleton_place_directory = g:exoskeleton_base_directory . 'place/'

augroup exoskeleton_ft
    "One autocmd per file extension in the ft directory.
    "i.e.
    "~/.vim/exoskeleton/ft/skel.php
    "~/.vim/exoskeleton/ft/skel.vim
    "etc...
    for filepath in glob(g:exoskeleton_ft_directory . '*', '', 1)
        let filename = fnamemodify(filepath, ':t')
        let extension = fnamemodify(filepath, ':e')
        execute 'autocmd BufNewFile *.' . extension . ' 0 read' . g:exoskeleton_ft_directory . filename
    endfor
augroup END

augroup exoskeleton_place
    "Snippets here are a mapping from one directory to another, they have
    "higher precedence than the ft exoskeletons"
    "exoskeletons here are in the format of
    "~/.vim/exoskeleton/place/a-direct-mapping-to-a-directory/file.php
    "In the above, any php filetypes within a/direct/mapping/to/a/directory
    "will have that template applied
    for filepath in glob(g:exoskeleton_place_directory . '*', '', 1)
        let directory = fnamemodify(filepath, ':t')
        let mapped_directory = substitute(directory, '-', '/', 'g')
        execute 'autocmd BufNewFile ' . '/' . mapped_directory . '/*' . ' 0 read ' . g:exoskeleton_place_directory . directory . '/exoskeleton'
    endfor
augroup END
